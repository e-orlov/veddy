# Veddy

Veddy is a Rails generator that will allow you to get the ved parameters from the Google search results. this allows you to escape some of the (not provided) hell.

## Installation

Veddy is mainly a generator, therefore, include this into your `Gemfile`:

```ruby
gem 'veddy', group: :development
```

We install it into the development group because Veddy is really just a generator. Due to this, you will not be using Veddy within your test suite or in your production environment.

To install the neccessary files, run `rails g veddy` and you should b good to go.

Veddy will create the vendor files for you, exclude Base64 from the asset pipeline, insert them into your layout, and ensure that you can collect data for mobile devices.

Now, Veddy cannot do everything. Here's what you need to know:

1. Make sure `<meta name="referrer" content="origin">` comes first.
2. Ensure that Base64 (wrapped in a later than IE 10 tag) is loaded up before your application file.
3. Ensure that you call either the application file or the Ved Analytics (which is going ot be called in `app/assets/javascripts/application.js`) _before_ Google Analytics

Veddy will do this all for you, but just double check and make sure it looks OK. If you're on a brand new Rails application, you probably don't need to worry too much. If it is an already existing Rails app, double-checking is recommended.

## Pumping Up to Universal Analytics

To push the code up to Universal Analytics, please look at the example code below and add it before `ga('send', 'pageview');`

```javascript
// The custom variable code needs to go *before* recording the pageview
(function(w) {
    if (w.VedDecode && w.VedDecode.ved) {
        // Send pageview with custom dimension data
        ga('set', {
            dimension1: getVedValue('linkIndex'),
            dimension2: getVedValue('linkType'),
            dimension3: getVedValue('resultPosition'),
            dimension4: getVedValue('subResultPosition'),
            dimension5: getVedValue('page')
            });
    }
    function getVedValue(key) {
        var ret = w.VedDecode[key];
        return ret ? ret + '' : '(not set)';
    }
})(window);
```

Hope you have fun. Check out [this screencast on Rails TV](http://www.rails.tv/videos/6826983/getting-ved-parameters-from-the-google-search-engine) to find out how to install Ved Parameters without installing Veddy.
