require 'chefspec'

describe 'apache::default' do
  chef_run = ChefSpec::ChefRunner.new do |node|
    node.set["meetup"]["name"] = "Bucks County DevOps"
  end

  chef_run.converge "apache::default"

  it "should install apache package" do
    chef_run.should install_package "apache2"
  end

  it "should start the apache service" do
    chef_run.should start_service "apache2"
  end

  it "should enable the apache service" do
    chef_run.should enable_service "apache2"
  end

  it "should create a home page" do
    chef_run.should create_file_with_content("/var/www/index.html", "Bucks County DevOps")
  end
end
