require 'spec_helper'
require 'omniauth-strava'

describe OmniAuth::Strategies::Strava do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }
  end

  subject do
    OmniAuth::Strategies::Strava.new(nil, @options || {}).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  describe '#client' do
    it 'has correct Strava site' do
      subject.client.site.should eq('https://www.strava.com')
    end

    it 'has correct authorize url' do
      subject.client.options[:authorize_url].should eq('/oauth/authorize')
    end

    it 'has correct token url' do
      subject.client.options[:token_url].should eq('/oauth/access_token')
    end
  end

  describe '#info' do
    before :each do
      @raw_info = {
        'id' => 123,
        'firstname' => 'Strava',
        'lastname' => 'Athlete'
      }
      subject.stub(:raw_info) { @raw_info }
    end

    context 'when data is present in raw info' do
      it 'returns the first name' do
        subject.info[:firstname].should eq('Strava')
      end

      it 'returns the last name' do
        subject.info[:lastname].should eq('Athlete')
      end
    end
  end

  describe '#credentials' do
    before :each do
      @access_token = double('OAuth2::AccessToken')
      @access_token.stub(:token)
      @access_token.stub(:expires?)
      @access_token.stub(:expires_at)
      @access_token.stub(:refresh_token)
      subject.stub(:access_token) { @access_token }
    end

    it 'returns a Hash' do
      subject.credentials.should be_a(Hash)
    end

    it 'returns the token' do
      @access_token.stub(:token) { '123' }
      subject.credentials['token'].should eq('123')
    end
  end
end
