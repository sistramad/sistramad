# -*- encoding: utf-8 -*-
# stub: carrierwave-crop 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "carrierwave-crop"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Kirti Thorat"]
  s.date = "2014-05-16"
  s.description = "CarrierWave extension to crop uploaded images using Jcrop plugin."
  s.email = ["kirti.brenz@gmail.com"]
  s.homepage = "https://github.com/kirtithorat/carrierwave-crop"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "CarrierWave extension for cropping images with preview."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.2"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
      s.add_runtime_dependency(%q<carrierwave>, ["< 0.11.0", ">= 0.8.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.5"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.2"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<carrierwave>, ["< 0.11.0", ">= 0.8.0"])
      s.add_dependency(%q<bundler>, ["~> 1.5"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.2"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<carrierwave>, ["< 0.11.0", ">= 0.8.0"])
    s.add_dependency(%q<bundler>, ["~> 1.5"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
