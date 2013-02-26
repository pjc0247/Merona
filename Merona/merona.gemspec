# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "merona"
  s.version = "1.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["pjc0247"]
  s.date = "2013-02-24"
  s.description = "Chocopie Game Server Engine by Ruby"
  s.email = ["pjc0247@naver.com"]
  s.homepage = "http://github.com/pjc0247/Merona"
  s.require_paths = ["lib"]
  s.rubyforge_project = "merona"
  s.rubygems_version = "1.8.25"
  s.summary = "Merona Game Server Engine"
  s.files = Dir["{lib}/**/*.rb", "{frame}/**/*.*", "{tests}/**/*.rb"]
  
  s.executables << 'merona'
  
  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sqlite3>, [">= 1.3.7"])
	  s.add_runtime_dependency(%q<eventmachine>, [">= 1.0.0"])
	  s.add_runtime_dependency(%q<redis>, [">= 3.0.2"])
    else
      s.add_dependency(%q<sqlite3>, [">= 1.3.7"])
	  s.add_dependency(%q<eventmachine>, [">= 1.0.0"])
	  s.add_dependency(%q<redis>, [">= 3.0.2"])
    end
  else
	  s.add_dependency(%q<sqlite3>, [">= 1.3.7"])
	  s.add_dependency(%q<eventmachine>, [">= 1.0.0"])
	  s.add_dependency(%q<redis>, [">= 3.0.2"])
  end
end
