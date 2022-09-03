require Rails.root.join('lib', 'tasks', 'manage_pins.rb').to_s

desc "Manages Nanna Martins pins (Pinterest)"
namespace :manage_pins do
  desc "Collect pins tpo add in database"
  task :collect => :environment do
    ManagePins.collect!
  end

  desc "Remove pins os database"
  task :remove => :environment do
    ManagePins.remove!
  end
end
