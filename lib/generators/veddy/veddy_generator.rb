class VeddyGenerator < Rails::Generators::Base
  source_root File.expand_path("../templates", __FILE__)

  desc "This generator installs veddy."
  def create_initializer_file
    template "vendor/assets/javascripts/base64/base64-1.1.js"
  end
end

