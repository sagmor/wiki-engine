namespace :wiki do
  
  desc 'Installs all the necesary files'
  task :install => ['wiki:repository:create'] do
  end
  
  namespace :repository do

    desc 'Creates and initializes an empty git repository to hold the page data'
    task :create => [:environment] do
      raise "Repository already exists in #{Wiki::PATH}" if File.exists? Wiki::PATH

      puts "Creating directory"
      FileUtils.mkdir_p Wiki::PATH

      puts 'Initializing repository'
      puts `cd #{Wiki::PATH}; git init --bare`
      page = Wiki::Page.new('en','index')
      page.content = <<-END
\015
Welcome To Wiki Engine\015
======================\015
\015
Looks like you managed to make it work!\015
\015
*Congratulations*\015
\015
END

      page.change_reason = 'Initial Commit'
      page.author = Wiki::Author.new(:name => 'wiki')
      page.save
    end
  end
end
