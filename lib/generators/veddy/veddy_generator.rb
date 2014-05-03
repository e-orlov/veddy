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
    # Make sure that this comes before your JavaScript.
    insert_into_file "app/views/layouts/application.html.erb", %Q{\n  <meta name="referrer" content="origin">\n}, after: "<head>"
  end

  def set_up_assets
    # This initializer will ensure that we don't add the Base64 encoding
    # to our asset pipeline.
    template "config/initializers/assets.rb"
    # Now that the asset will not be included in the pipeline, we insert
    # it into the layout just after the closing title tag.
    insert_into_file "app/views/layouts/application.html.erb", %Q{\n\n  <!--[if lt IE 10]>\n    <script src="http://veddecode.opensource.dpo.org.uk/js/base64-1.1.min.js"></script>\n  <![endif]-->\n}, after: "</title>"
    # To add the Ved Analytics to our asset pipeline, we make sure it is
    # run first due to the dependency reasons.
    insert_into_file "app/assets/javascripts/application.js", %Q{//= require ved_analytics/ved_analytics-1.1\n}, before: "//= require jquery\n"
  end
end
