require 'rets'
module Pwb
  class MlsConnector
    attr_accessor :import_source

    def initialize(import_source)
      # import_source = Pwb::ImportSource.find_by_name mls_name
      self.import_source = import_source
    end

    def retrieve query, limit
      client = Rets::Client.new(import_source.details)

      # {
      #   login_url: 'http://ptest.mris.com:6103/ptest/login',
      #   username: '',
      #   password: '',
      #   version: 'RETS/1.7.2',
      #   agent: 'RETSMD/1.0'
      # }

      # $ver = "RETS/1.7.2";
      # $user_agent = "RETS Test/1.0";
      quantity = :all
      # quantity has to be one of :first or :all
      # but would rather use limit than :first
      properties = client.find quantity, {
        search_type: 'Property',
        class: import_source.default_property_class,
        query: query,
        limit: limit
      }
      # photos = client.objects '*', {
      #   resource: 'Property',
      #   object_type: 'Photo',
      #   resource_id: '242502823'
      # }

      return properties
    end

    

  end
end
