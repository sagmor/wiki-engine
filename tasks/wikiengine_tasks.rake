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
      index = Wiki.repo.index
      index.add('en/index.wiki', <<-END

Welcome To Wiki Engine      
======================

Looks like you managed to make it work!

*Congratulations*

END
)
      index.commit('Initial Commit')
    end
  end
end
