#require 'aws-sdk'

node[:deploy].each do |deploy|
  execute "test-s3" do
    Chef::Log.info("********** HelloWorld123 **********")
  end
end

