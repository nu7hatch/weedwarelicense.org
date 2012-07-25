# -*- ruby -*-

use Rack::Static, {
  :root  => 'www',
  :index => 'index.html',
  :urls  => [""],
}

error_404 = 'output/404.html'

run lambda {
  [404, {
    "Content-Type"   => "text/html",
    "Content-Length" => File.size(error_404).to_s,
    "Last-Modified"  => File.mtime(error_404).httpdate,
    }, File.read(error_404)
  ]
}
