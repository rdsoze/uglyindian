namespace :db do
  desc "reset db"
  task reset: :environment do
    ['drop', 'create', 'migrate', 'seed'].each { |task| Rake::Task["db:#{task}"] }
  end

end
