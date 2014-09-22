require "rake/clean"

PATHMAP = { 
  ".subversion" => File.join(ENV["APPDATA"].gsub("\\", "/"), "Subversion", "config") 
}

SOURCES = Dir.glob("dotfiles/*", File::FNM_DOTMATCH).select{ |path| File.file?(path) }.map{ |path| File.expand_path(path) }
DOTFILES = SOURCES.map{ |path| PATHMAP[File.basename(path)] || File.expand_path(File.join("~", File.basename(path))) }

CLOBBER.include(DOTFILES)

desc "Make links to all of the dotfiles"
task :default => [:clobber, DOTFILES].flatten

SOURCES.zip DOTFILES do |source, dotfile|
  file dotfile => source do
    puts "[dotfiles] #{dotfile}"
    system "cmd /c mklink \"#{dotfile}\" \"#{source}\""
  end
end
