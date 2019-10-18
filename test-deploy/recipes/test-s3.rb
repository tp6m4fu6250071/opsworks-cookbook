require 'aws-sdk'

s3 = AWS::S3.new

log 'message' do
  message 'HelloWorld123'
  level :info
end

# Set bucket and object name
obj = s3.buckets['test-opsworks-s3-role-appbucket-h74iqpaoyoru'].objects['object.txt']

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
