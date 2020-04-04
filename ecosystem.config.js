module.exports = {
  apps : [{
    name: 'api',
    script: 'yarn',
    interpreter: 'zsh',
    args: 'workspace api start',
    instances: 1,
    autorestart: true,
    watch: true,
    max_memory_restart: '1G',
    env: {
      NODE_ENV: 'development'
    }
  }, {
    name: 'frontend',
    script: 'yarn',
    interpreter: 'zsh',
    args: 'workspace frontend start',
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: '1G',
    env: {
      NODE_ENV: 'development',
      BROWSER: 'none',
    }
  }, {
    name: 'services',
    script: 'docker-compose',
    args: 'up',
    instances: 1,
    autorestart: true,
    watch: false,
    max_memory_restart: '32G',
  }],
};
