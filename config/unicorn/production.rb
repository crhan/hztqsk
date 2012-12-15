worker_processes 1
preload_app true
timeout 60
listen "127.0.0.1:8002"

stderr_path "log/unicorn.err.log"
stdout_path "log/unicorn.out.log"
pid "tmp/pids/unicorn.pid"
