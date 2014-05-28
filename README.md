# omniauth-strava

[Omniauth][omniauth] strategy for [Strava][strava].

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-strava'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-strava

## Configuration

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :strava, ENV['STRAVA_CLIENT_ID'], ENV['STRAVA_CLIENT_SECRET']
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Contributors

- [Leo Romanovsky](https://github.com/leoromanovsky)
- [Oto Brglez](https://github.com/otobrglez)

[strava]:https://www.strava.com/
[omniauth]:https://github.com/intridea/omniauth
