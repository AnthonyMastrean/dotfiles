require "rake/clean"

PATHMAP = {
  ".subversion"       => File.join(ENV["APPDATA"].gsub("\\", "/"), "Subversion/config"),
  ".sublime-settings" => File.join(ENV["APPDATA"].gsub("\\", "/"), "Sublime Text 3/Packages/User/Preferences.sublime-settings")
}

SOURCES = Dir.glob("dotfiles/*", File::FNM_DOTMATCH).select{ |path| File.file?(path) }.map{ |path| File.expand_path(path) }
TARGETS = SOURCES.map{ |path| PATHMAP[File.basename(path)] || File.expand_path(File.join("~", File.basename(path))) }

CLOBBER.include(TARGETS)

task :default => [:clobber, :link]

desc "Symlink all the files"
task :link => TARGETS

SOURCES.zip TARGETS do |source, target|
  file target => source do
    system "cmd /c mklink \"#{target}\" \"#{source}\""
  end
end
