require 'zenoss/client'

Dir["./spec/support/**/*.rb"].sort.each {|f| require f}


RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.order = 'random'
  config.before(:each) do
    Zenoss::Client.instance_variable_set :@singleton__instance__, nil
  end
end
