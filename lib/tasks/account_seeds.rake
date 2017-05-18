namespace :dspectrum do
	task :accounts => :environment do

		#####
		#  User
		####

		puts "[!] Seeding user"

		u = User.create!(:email => "user@example.com", :full_name => "some guy", :password => "password", :password_confirmation => "password")
	end
end