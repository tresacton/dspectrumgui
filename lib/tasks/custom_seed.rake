# lib/tasks/custom_seed.rake

# rake db:custom_seed

namespace :dspectrum do
  task :seed do
  	puts 
  	puts 
  	puts "[*] Starting Seeds"
  	puts
  	puts "[*] Seeding Accounts"
    Rake::Task['dspectrum:accounts'].invoke
    puts
  end

  
end