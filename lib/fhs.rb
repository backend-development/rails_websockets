require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class FHS < OmniAuth::Strategies::OAuth2
      option :name, :FHS
      option :client_options, {
        site:          'https://auth.mediacube.at',
        authorize_url: 'oauth/authorize'
      }

      uid {
        raw_info['id']
      }

      info do 
        prune!({
          fhs_username:   raw_info['username'],          
          full_name:       raw_info['name'],          
          email:      raw_info['email'],
          first_name: raw_info['first_name'],
          last_name:  raw_info['last_name'],
        })
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end      

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end
    end
  end
end
