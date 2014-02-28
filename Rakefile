require "fileutils"
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

task :default do system "rake -T"; end

dotfiles = Dir.glob("lib/**/*", File::FNM_DOTMATCH).select{ |path| File.file?(path) }
dotfiles.each do |source|
  localpath = Pathname.new(source).lefttruncate("lib")
  target = File.expand_path(File.join("~", localpath))
  
  desc "Update #{localpath}"
  task localpath do
    if(FileUtils.uptodate?(target, [source]))
      puts "#{localpath} is up to date"
      next
    end
  
    FileUtils.cp(source, target)
    puts "#{localpath} updated"
  end
end

desc "Update all dotfiles"
task :update => dotfiles.map{ |path| Pathname.new(path).lefttruncate("lib") }
