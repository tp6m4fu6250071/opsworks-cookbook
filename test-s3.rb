require 'aws-sdk'

s3 = AWS::S3.new

# Set bucket and object name
obj = s3.buckets[node[:photobucket]].objects['object.txt']

# Read content to variable
file_content = obj.read

# Log output (optional)
Chef::Log.info(file_content)

# Write content to file
file '/tmp/myobject.txt' do
  owner 'root'
  group 'root'
  mode '0755'
  content file_content
  action :create
end
