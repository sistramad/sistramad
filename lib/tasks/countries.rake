namespace :countries do
  desc "Crea los registros para la tabla countries"
  task generate: :environment do
    Country::insert_records
  end
end
