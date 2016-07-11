CarrierWave.configure do |config|
  config.permissions = 0644
  config.directory_permissions = 0755
  config.storage_engines = {
      :file => "CarrierWave::Storage::File",
      :fog  => "CarrierWave::Storage::Fog"
  }
  config.storage = :file
  config.cache_storage = :file
  config.fog_provider = 'fog'
  config.fog_attributes = {}
  config.fog_credentials = {}
  config.fog_public = true
  config.fog_authenticated_url_expiration = 600
  config.fog_use_ssl_for_aws = true
  config.store_dir = 'uploads'
  config.cache_dir = 'uploads/tmp'
  config.delete_tmp_file_after_storage = true
  config.move_to_cache = false
  config.move_to_store = false
  config.remove_previously_stored_files_after_update = true
  config.ignore_integrity_errors = true
  config.ignore_processing_errors = true
  config.ignore_download_errors = true
  config.validate_integrity = true
  config.validate_processing = true
  config.validate_download = true
  config.root = lambda { CarrierWave.root }
  config.base_path = CarrierWave.base_path
  config.enable_processing = true
  config.ensure_multipart_form = true
end