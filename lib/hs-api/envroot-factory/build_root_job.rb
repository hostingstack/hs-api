require 'resque/job_with_status'
module EnvRootFactory
  # Stub class for Resque.
  class BuildRootJob < Resque::JobWithStatus
    @queue = :envroot_factory
    # Arguments: job_token, options
  end
end
