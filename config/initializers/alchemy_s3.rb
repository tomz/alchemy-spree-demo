if Rails.env=="production"
  require 'dragonfly/s3_data_store'

  pictures_app = Dragonfly.app(:alchemy_pictures)
  pictures_app.configure_with(:imagemagick)
  pictures_app.configure do
    datastore :s3,
      bucket_name: ENV['S3_BUCKET_NAME_ALCHEMY_PICTURES'] || 'intridea-alchemy-cms-pictures',
      access_key_id: ENV['S3_KEY'],
      secret_access_key: ENV['S3_SECRET'],
      region: ENV['S3_REGION'] || 'us-east-1',
      storage_headers: {'x-amz-acl' => 'public-read'},
      url_scheme: 'https'
  end

  attachments_app = Dragonfly.app(:alchemy_attachments)
  attachments_app.configure do
    datastore :s3,
      bucket_name: ENV['S3_BUCKET_NAME_ALCHEMY_ATTACHMENTS'] || 'intridea-alchemy-cms-attachments',
      access_key_id: ENV['S3_KEY'],
      secret_access_key: ENV['S3_SECRET'],
      region: ENV['S3_REGION'] || 'us-east-1',
      storage_headers: {'x-amz-acl' => 'public-read'},
      url_scheme: 'https'
  end
end
