desc "This task is called by the Heroku scheduler add-on"
task update_db: 'environment' do
  UpdateDbJob.new.perform
end
