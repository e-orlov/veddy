class VeddyGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)
  desc "This generator installs veddy."

  def create_vendor_files
    template "vendor/assets/javascripts/base64/base64-1.1.js"
    template "vendor/assets/javascripts/base64/base64-1.1.min.js"
    template "vendor/assets/javascripts/ved_analytics/ved_analytics-1.1.js"
    template "vendor/assets/javascripts/ved_analytics/ved_analytics-1.1.min.js"
  end
end
