# -*- encoding: utf-8 -*-
# stub: route_translator 5.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "route_translator"
  s.version = "5.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Geremia Taglialatela", "Enric Lluelles", "Raul Murciano"]
  s.date = "2017-01-24"
  s.description = "Translates the Rails routes of your application into the languages defined in your locale files"
  s.email = ["tagliala.dev@gmail.com", "enric@lluell.es"]
  s.homepage = "http://github.com/enriclluelles/route_translator"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.5.1"
  s.summary = "Translate your Rails routes in a simple manner"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["~> 5.0.0"])
      s.add_runtime_dependency(%q<actionpack>, ["~> 5.0.0"])
      s.add_development_dependency(%q<appraisal>, ["~> 2.1"])
      s.add_development_dependency(%q<byebug>, ["~> 9.0"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.8.19"])
      s.add_development_dependency(%q<minitest>, ["~> 5.10"])
      s.add_development_dependency(%q<rails>, ["~> 5.0.0"])
      s.add_development_dependency(%q<rake>, ["~> 12.0"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.47.1"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.12.0"])
    else
      s.add_dependency(%q<activesupport>, ["~> 5.0.0"])
      s.add_dependency(%q<actionpack>, ["~> 5.0.0"])
      s.add_dependency(%q<appraisal>, ["~> 2.1"])
      s.add_dependency(%q<byebug>, ["~> 9.0"])
      s.add_dependency(%q<coveralls>, ["~> 0.8.19"])
      s.add_dependency(%q<minitest>, ["~> 5.10"])
      s.add_dependency(%q<rails>, ["~> 5.0.0"])
      s.add_dependency(%q<rake>, ["~> 12.0"])
      s.add_dependency(%q<rubocop>, ["~> 0.47.1"])
      s.add_dependency(%q<simplecov>, ["~> 0.12.0"])
    end
  else
    s.add_dependency(%q<activesupport>, ["~> 5.0.0"])
    s.add_dependency(%q<actionpack>, ["~> 5.0.0"])
    s.add_dependency(%q<appraisal>, ["~> 2.1"])
    s.add_dependency(%q<byebug>, ["~> 9.0"])
    s.add_dependency(%q<coveralls>, ["~> 0.8.19"])
    s.add_dependency(%q<minitest>, ["~> 5.10"])
    s.add_dependency(%q<rails>, ["~> 5.0.0"])
    s.add_dependency(%q<rake>, ["~> 12.0"])
    s.add_dependency(%q<rubocop>, ["~> 0.47.1"])
    s.add_dependency(%q<simplecov>, ["~> 0.12.0"])
  end
end
