ActiveModel::Serializer.config.adapter = :json_api
ActiveModel::Serializer.config.key_transform = :camel_lower
ActiveModel::Serializer.config.jsonapi_namespace_separator = '--'
