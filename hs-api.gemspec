Gem::Specification.new do |s|
  s.name        = "hs-api"
  s.version     = "0.01"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["HostingStack Maintainers"]
  s.email       = ["maintainers@hostingstack.org"]
  s.homepage    = "http://hostingstack.org/"
  s.summary     = "HostingStack Internal API"
  s.description = ""

  s.required_rubygems_version = ">= 1.2"

  s.add_dependency "thrift"
  s.add_dependency "resque"
  s.add_dependency "resque-status"
  #s.add_development_dependency "rspec"
 
  s.files        = Dir.glob("{billing,invoicing,scheduler}/**/*") + Dir.glob("*.rb") + Dir.glob("*.thrift")
  s.executables  = []
  s.require_path = 'lib'
end
