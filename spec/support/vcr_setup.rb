require 'vcr'
require 'support/sabr_test'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  c.hook_into :webmock
  c.filter_sensitive_data('<apikey>') { SabrTest::API_KEY }
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.around(:each, :vcr) do |example|
    name = example.metadata[:full_description].split(/\s+/, 2).join("/").gsub(/[^\w\/]+/, "_")
    VCR.use_cassette(name) { example.call }
  end
end
