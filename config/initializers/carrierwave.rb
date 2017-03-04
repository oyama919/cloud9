CarrierWave.configure do |config|
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region:                'ap-northeast-1',
      path_style:            true,
  }

  config.fog_public     = true
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  case Rails.env
    when 'production'
      config.fog_directory = 'cloud9-production'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/cloud9-production'
    when 'development'
      config.fog_directory = 'cloud9-development'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/cloud9-development'
  end
end
