# Ruby Vine

A simple object describing a Twitter Vine video.

## Usage

```ruby
  vine = Vine.get('https://vine.co/v/bgD2rJXvOi1')
  => "Butler Blue II's post on Vine"
  vine.video
  => "https://vines.s3.amazonaws.com/videos/A.....mp4?
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
