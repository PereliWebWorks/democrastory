server '45.55.40.245', user: 'deploy', roles: %w{web app db}

set :ssh_options, {
    forward_agent: true,
    user: 'deploy'
  }