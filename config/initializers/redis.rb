uri = URI.parse(ENV["REDISTOGO_URL"] || "redis://redistogo:f78b6bdc2d054442c78ae6d8895daf4d@mummichog.redistogo.com:9547/")
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
