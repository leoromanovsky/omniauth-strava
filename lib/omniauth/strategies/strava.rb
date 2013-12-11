require 'spec_helper'
require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Strava < OmniAuth::Strategies::OAuth2
      option :client_options, {
          site: 'https://www.strava.com',
          authorize_url: '/oauth/authorize',
          token_url: '/oauth/access_token'
      }

      uid { raw_info['id'] }

      info do
        {
          id: raw_info['id'],
          firstname: raw_info['firstname'],
          lastname: raw_info['lastname']
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def request_phase
        options[:authorize_params] = client_params.merge(options[:authorize_params])
        super
      end

      def auth_hash
        OmniAuth::Utils.deep_merge(super, client_params.merge({grant_type: 'authorization_code'}))
      end

      def raw_info
        access_token.options[:mode] = :query
        access_token.options[:param_name] = :oauth_token
        @raw_info ||= access_token.get('https://www.strava.com/api/v3/athletes/me').parsed['response']
      end

      private

      def client_params
        {
          client_id: options[:client_id],
          redirect_uri: callback_url,
          response_type: 'code'
        }
      end
    end
  end
end