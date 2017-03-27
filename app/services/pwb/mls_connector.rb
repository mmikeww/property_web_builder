require 'Rets'
module Pwb
  class MlsConnector
    attr_accessor :mls_name

    def initialize(mls_name)
      self.mls_name = mls_name
    end

    def get_property query
      is = Pwb::ImportSource.find_by_name "interealty"
      client = Rets::Client.new(is.details)

      # {
      #   login_url: 'http://ptest.mris.com:6103/ptest/login',
      #   username: '',
      #   password: '',
      #   version: 'RETS/1.7.2',
      #   agent: 'RETSMD/1.0'
      # }

      # $ver = "RETS/1.7.2";
      # $user_agent = "RETS Test/1.0";

      property = client.find :first, {
        search_type: 'Property',
        class: is.default_property_class,
        query: query
        # limit: 1
      }
      # photos = client.objects '*', {
      #   resource: 'Property',
      #   object_type: 'Photo',
      #   resource_id: '242502823'
      # }

      return property
    end


  end
end
