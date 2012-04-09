$: << File.expand_path(File.dirname(__FILE__))

require 'rubygems'

def launch_api_server(klass, handler, transport = nil, port = 9090, logger = nil)
  processor = klass::Processor.new(handler)
  if Thrift.const_defined?(:NonblockingServerSocket)
    transport ||= Thrift::NonblockingServerSocket.new(port)
  else
    transport ||= Thrift::ServerSocket.new(port)
  end
  transport_factory = Thrift::FramedTransportFactory.new
  server = Thrift::NonblockingServer.new(processor, transport, transport_factory, nil, 20, logger)
  server.serve
end

def remote_call(klass, endpoint_host = 'localhost', endpoint_port = 9090)
  endpoint = Thrift::Socket.new(endpoint_host, endpoint_port)
  transport = Thrift::FramedTransport.new(endpoint)
  protocol = Thrift::BinaryProtocol.new(transport)
  transport.open
  klass::Client.new(protocol)
end

# TODO: restrict_access helper for server's handler

module HSApi
  module DynamicQueueMixIn
    def self.included receiver
      receiver.extend ClassMethods
    end
    module ClassMethods
      # Overrides JobWithStatus.enqueue (called from .create)
      def enqueue(klass, options = {})
        q = self.select_queue(klass, options)
        uuid = Resque::Status.create :options => options, :name => self.name, :message => "Scheduled"
        Resque::Job.create(q, klass, uuid, options)

        Resque::Plugin.after_enqueue_hooks(klass).each do |hook|
          klass.send(hook, *args)
        end
        uuid
      end
      
      # Default impl, feel free to override.
      def select_queue(klass, options)
        if options[:job_host].nil?
          raise "job_host not set for job with DynamicQueueMixIn"
        end
        return @queue_basename + "_" + options[:job_host]
      end
    end
  end
end
