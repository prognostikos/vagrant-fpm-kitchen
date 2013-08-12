class Tmux < FPM::Cookery::Recipe
  description 'terminal multiplexer'

  name     'tmux'
  version  '1.8'
  homepage 'http://tmux.sourceforge.net/'
  source   "http://downloads.sourceforge.net/project/tmux/tmux/tmux-#{version}/tmux-#{version}.tar.gz"
  sha1     '08677ea914e1973ce605b0008919717184cbd033'

  conflicts 'tmux'
  replaces  'tmux'

  build_depends 'autoconf', 'libevent-dev', 'libncurses5-dev'

  depends 'libevent-2.0-5', 'libncurses5'

  def build
    configure :prefix => prefix
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
