namespace :db do
  desc 'Prints migration versions'
  task schema_migrations: :environment do
    puts ActiveRecord::Base.connection.select_values(
    'select version from schema_migrations order by version' )
  end
end