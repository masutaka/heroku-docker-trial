require 'webrick'

server = WEBrick::HTTPServer.new :Port => ENV["PORT"]

server.mount_proc '/' do |req, res|
    res.body =<<EOB
<h1>Hello, world!</h1>
This application is running using <strong>#{ENV['METHOD']}</strong>.
EOB
end

trap 'INT' do
  server.shutdown
end

server.start
