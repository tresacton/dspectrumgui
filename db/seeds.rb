u = User.find_or_create_by(:email => "user@example.com") do |user|
  user.password = "password"
  user.password_confirmation = "password"
  user.full_name = "Nameless"
end
puts "Seeded user: #{u.full_name} (#{u.email})"

puts "Seeding Section Template Library"
Dir[File.join(Rails.root, 'db', 'template_seeds', '*.rb')].sort.each { |seed| load seed }
puts "#{SectionTemplate.all.count} templates imported into library"
