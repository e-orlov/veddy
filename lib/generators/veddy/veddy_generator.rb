class VeddyGenerator < Rails::Generators::Base
  desc "This generator installs veddy."
  def create_initializer_file
    create_file "config/initializers/veddy.rb", "# Add initialization content here"
  end
end
