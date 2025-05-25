require 'json'

# Read and parse the swagger.json file
swagger_data = JSON.parse(File.read('swagger.json'))

# Get all paths from the swagger data
paths = swagger_data['paths'].keys

# Print each path
puts "Available API Endpoints:"
puts "----------------------"
paths.each do |path|
  puts path
end
