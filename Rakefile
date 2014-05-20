require "pathname"

class Pathname
  def lefttruncate(dir)
    chunks = []
    ascend() do |path|
      chunk = File.basename(path)
      break if chunk == dir
      chunks << chunk
    end
    
    File.join(chunks.reverse)
  end
end

def to_dotfile(path)
  File.expand_path(File.join("~", Pathname.new(path).lefttruncate("lib")))
end

SOURCE = Dir.glob("lib/**/*", File::FNM_DOTMATCH).select{ |path| File.file?(path) }
DOTFILES = SOURCE.map{ |path| to_dotfile(path) }

task :default => :up

desc "update all of the dotfiles"
task :up => DOTFILES

SOURCE.zip DOTFILES do |source, dotfile|
  file dotfile => source do |task|
    mkdir_p File.dirname(dotfile)
    system "cp #{source} #{dotfile}"
  end
end
