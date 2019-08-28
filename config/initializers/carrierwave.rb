# config/initializers/carrierwave.rb

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_public = false
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["AKIARCDWWDYVAAFSPGWC"],        # required
    aws_secret_access_key: ENV["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"],        # required
  }
  config.fog_directory  = ENV["meowmixin"]              # required
end