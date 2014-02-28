require "fileutils"

task :default do system "rake -T"; end

dotfiles = Dir[".*"].select{ |path| File.file?(path) }
dotfiles.each do |source|
  target = File.expand_path(File.join("~", source))
  
  desc "Update #{source}"
  task source do
    if(FileUtils.uptodate?(target, [source]))
      puts "#{source} is up to date"
      next
    end
  
    FileUtils.cp(source, target)
    puts "#{source} updated"
  end
end

desc "Update all dotfiles"
task :update => dotfiles
