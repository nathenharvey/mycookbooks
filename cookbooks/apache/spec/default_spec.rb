require 'chefspec'

describe 'apache::default' do
  chef_run = ChefSpec::ChefRunner.new
  chef_run.converge "apache::default"

  it "should install apache package" do
    chef_run.should install_package "apache2"
  end
end
