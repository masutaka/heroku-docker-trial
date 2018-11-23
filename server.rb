require 'webrick'

server = WEBrick::HTTPServer.new :Port => ENV["PORT"]

server.mount_proc '/' do |req, res|
    res.body = "<h1>Hello, world!</h1>\nThis application is running using <strong>#{ENV['METHOD']}</strong>.\n"
end

trap 'INT' do
  server.shutdown
end

server.start
