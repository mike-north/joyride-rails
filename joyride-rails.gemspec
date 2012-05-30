$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "joyride/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "joyride-rails"
  s.version     = Joyride::VERSION
  s.authors     = ["Michael North"]
  s.email       = ["michael.north@truenorthapps.com"]
  s.homepage    = "TODO"
  s.summary     = "Easy jQuery feature tours"
  s.description = "Easy jQuery feature tours, based on ZURB's Joyride plugin (http://www.zurb.com/playground/jquery_joyride_feature_tour_plugin)"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.2"
  s.add_dependency "haml", "~> 3.1.4"
  s.add_dependency "sass", "~> 3.1.16"


  s.add_dependency "jquery-rails"

  s.add_development_dependency "sass-rails", "~> 3.2.5"
  s.add_development_dependency "haml-rails", "~> 0.3.4"

end
