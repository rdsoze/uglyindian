namespace :db do
  desc "reset db"
  task reset: :environment do
    %w( drop create migrate seed ).each { |task| Rake::Task["db:#{task}"] }
  end

end
