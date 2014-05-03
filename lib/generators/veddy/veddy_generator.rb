class VeddyGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)
  desc "This generator installs veddy."

  def create_vendor_files
    # Some browsers are not capable of Base64 decoding *cough IE10 and below*
    # Nick Galbreat has gone and solved this issue for us.
    template "vendor/assets/javascripts/base64/base64-1.1.js"
    template "vendor/assets/javascripts/base64/base64-1.1.min.js"
    # To decode the Ved parameters and set them up to be sent off to Universal
    # Analytics, we use some JavaScript created by Deed Poll Office Ltd, UK
    template "vendor/assets/javascripts/ved_analytics/ved_analytics-1.1.js"
    template "vendor/assets/javascripts/ved_analytics/ved_analytics-1.1.min.js"
  end

  def mobile_installation
    # Since mobile devices are not able to do hyperlink auditing,
    # (well, they can, just don't expect the average user to turn it on)
    # we insert a meta tag to be able to capture the ved parameter.
    insert_into_file "app/views/layouts/application.html.erb", %Q{\n  <meta name="referrer" content="origin">\n}, after: "<head>"
  end
end
