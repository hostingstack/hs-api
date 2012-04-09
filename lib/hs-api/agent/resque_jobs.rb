require 'resque/job_with_status'

# Stub classes for Resque.
module HSAgent

  class DeployAppJob < Resque::JobWithStatus
    include HSApi::DynamicQueueMixIn
    @queue_basename = "agent"
  end

  class RunConfigureScriptJob < Resque::JobWithStatus
    include HSApi::DynamicQueueMixIn
    @queue_basename = "agent"
  end

  class UndeployAppJob < Resque::JobWithStatus
    include HSApi::DynamicQueueMixIn
    @queue_basename = "agent"
  end

  class UpdateGatewayRouteJob < Resque::JobWithStatus
    include HSApi::DynamicQueueMixIn
    @queue_basename = "agent"
  end

  class UpdateServiceInstanceJob < Resque::JobWithStatus
    include HSApi::DynamicQueueMixIn
    @queue_basename = "agent"
  end

  class UndeployServiceInstanceJob < Resque::JobWithStatus
    include HSApi::DynamicQueueMixIn
    @queue_basename = "agent"
  end

  class PackAndStoreCodeJob < Resque::JobWithStatus
    include HSApi::DynamicQueueMixIn
    @queue_basename = "agent"
  end

  class RunAppCommandJob < Resque::JobWithStatus
    include HSApi::DynamicQueueMixIn
    @queue_basename = "agent"
  end

end
