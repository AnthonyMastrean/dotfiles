require "rake/clean"

PATHMAP = {
  ".subversion"       => File.join(ENV["APPDATA"].gsub("\\", "/"), "Subversion/config"),
  ".sublime-settings" => File.join(ENV["APPDATA"].gsub("\\", "/"), "Sublime Text 3/Packages/User/Preferences.sublime-settings")
}

TARGETS = Dir.glob("dotfiles/*", File::FNM_DOTMATCH).select{ |path| File.file?(path) }.map{ |path| File.expand_path(path) }
LINKS = TARGETS.map{ |path| PATHMAP[File.basename(path)] || File.expand_path(File.join("~", File.basename(path))) }

CLOBBER.include(LINKS)

task :default => [:clobber, :link]

desc "Symlink all the files"
task :link => LINKS

TARGETS.zip LINKS do |target, link|
  file link => target do
    system "cmd /c mklink \"#{link}\" \"#{target}\""
  end
end
