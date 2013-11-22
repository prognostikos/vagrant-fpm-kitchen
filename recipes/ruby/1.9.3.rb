class Ruby193 < FPM::Cookery::Recipe
  description 'The Ruby virtual machine'

  name 'ruby'
  version '1:1.9.3.484'
  revision 0
  homepage 'http://www.ruby-lang.org/'
  source 'http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p484.tar.bz2'
  sha256 '0fdc6e860d0023ba7b94c7a0cf1f7d32908b65b526246de9dfd5bb39d0d7922b'

  section 'interpreters'

  build_depends 'autoconf', 'libreadline6-dev', 'bison', 'zlib1g-dev',
                'libssl-dev', 'libyaml-dev', 'libncurses5-dev'

  depends 'libffi6', 'libncurses5', 'libreadline6', 'libssl1.0.0', 'libtinfo5',
          'libyaml-0-2', 'zlib1g'

  def build
    configure :prefix => prefix, 'disable-install-doc' => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
