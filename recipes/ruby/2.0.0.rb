class Ruby200 < FPM::Cookery::Recipe
  description 'The Ruby virtual machine'

  name 'ruby'
  version '2.0.0.353'
  revision 0
  homepage 'http://www.ruby-lang.org/'
  source 'http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p353.tar.bz2'
  sha256 '3de4e4d9aff4682fa4f8ed2b70bd0d746fae17452fc3d3a8e8f505ead9105ad9'

  section 'interpreters'

  build_depends 'autoconf', 'libreadline6-dev', 'bison', 'zlib1g-dev',
                'libssl-dev', 'libyaml-dev', 'libevent-dev'

  depends 'libffi6', 'libncurses5', 'libreadline6', 'libssl1.0.0',
          'libtinfo5', 'libyaml-0-2', 'zlib1g', 'libevent-2.0-5'

  def build
    configure :prefix => prefix, 'disable-install-doc' => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
