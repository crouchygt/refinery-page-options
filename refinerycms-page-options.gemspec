Gem::Specification.new do |s|
  s.name              = %q{refinerycms-page-options}
  s.version           = %q{2.1.0}
  s.description       = %q{Add key/value options to pages}
  s.summary           = %q{Page options extension for Refinery CMS}
  s.email             = %q{matt@crazypanda.co.uk}
  s.homepage          = %q{http://github.com/}
  s.authors           = ['Matthew Crouch']
  s.require_paths     = %w(lib)
  s.license            = %q{MIT}

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  s.add_dependency    'refinerycms-pages', '~> 2.1.0'
end
