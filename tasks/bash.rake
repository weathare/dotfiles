require "fileutils"

namespace :bash do
  desc "Install shell helper"
  task :bin_install do
    # dircolors
    repo = %(git clone https://github.com/arcticicestudio/nord-dircolors)
    sh %(git clone #{repo} ./bin/nord-dircolors), verbose: true do |ok, _|
      if ok
        symlink("bin/nord-dircolors/src/dir_colors", "bin/dircolors")
      else
        puts "Failure install dircolors."
      end
    end

    # fzf
    repo = %(https://github.com/junegunn/fzf)
    sh %(git clone #{repo} ~/.fzf), verbose: true do |ok, _|
      if ok
        puts "Try: ~/.fzf/install"
      else
        puts "Failure install fzf."
      end
    end

    # enhancd
    repo = %(https://github.com/b4b4r07/enhancd)
    sh %(git clone #{repo} ./bin/enhancd), verbose: true do |ok, _|
      puts "Failure install enhancd." unless ok
    end

    # git scripts
    repo = %(https://raw.githubusercontent.com/yuroyoro/git-ignore/master/git-ignore)
    sh %(curl -sL #{repo} > bin/git-ignore), verbose: true do |ok, _|
      if ok
        File.chmod(0755, "bin/git-ignore")
      else
        puts "Failure install git-ignore."
      end
    end
  end
end
