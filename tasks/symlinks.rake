require "fileutils"

IGNORE_FILE=%w(
  .
  ..
  .git
  .bundle
  .rake_tasks~
  .snippets
  _git.local
  Gemfile
  Gemfile.lock
  Rakefile
  shell
  tasks
  vendor
)
WORKSPACE=File.expand_path("workspace", "~")

def backup!(fullpath)
  if File.exists?(fullpath)
    FileUtils.cp_r(fullpath, "%s_" % fullpath, preserve: true, verbose: true)
    FileUtils.rm_r(fullpath)
  end
end

namespace :symlinks do
  desc "$HOMEへドットファイルを設置"
  task :home do
    Dir.foreach(".") do |target|
      next if IGNORE_FILE.include?(target)

      filepath = File.expand_path(target)
      symlinkpath = File.expand_path(target, "~")

      begin
        backup!(symlinkpath)
        symlink(filepath, symlinkpath)
      rescue Errno::EEXIST
        puts %(!!! Already exists: ~/#{target})
      end
    end

    puts %(You try: source #{File.expand_path(".profile", "~")})
  end
end
