threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count
port        ENV.fetch("PORT") { 3000 }
environment ENV.fetch("RAILS_ENV") { "development" }
plugin :tmp_restart

app_root = File.expand_path("../..", __FILE__)
bind "unix://myapp/tmp/sockets/puma.sock"

# stdout_redirect "myapp/log/puma.stdout.log", "myapp/log/puma.stderr.log", true