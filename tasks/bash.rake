require "fileutils"

namespace :bash do
  desc "Install shell helper"
  task :bin_install do
    # dircolors
    repo = %(https://github.com/peterhellberg/dircolors-jellybeans)
    sh %(git clone #{repo} ./bin/dircolors-jellybeans), verbose: true do |ok, _|
      symlink("bin/dircolors-jellybeans/dircolors.jellybeans", "bin/dircolors") if ok
      puts "Failure install dircolors." unless ok
    end

    # fzf
    repo = %(https://github.com/junegunn/fzf)
    sh %(git clone #{repo} ~/.fzf), verbose: true do |ok, _|
      puts "Try: ~/.fzf/install" if ok
      puts "Failure install enhancd." unless ok
    end

    # enhancd
    repo = %(https://github.com/b4b4r07/enhancd)
    sh %(git clone #{repo} > bin/enhancd), verbose: true do |ok, _|
      puts "Failure install enhancd." unless ok
    end

    # git scripts
    repo = %(https://raw.githubusercontent.com/yuroyoro/git-ignore/master/git-ignore)
    sh %(curl -sL #{repo} > bin/git-ignore), verbose: true do |ok, _|
      puts "Failure install git-ignore." unless ok
    end
  end
end
