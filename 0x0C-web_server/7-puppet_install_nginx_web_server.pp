package { 'nginx':
  ensure => installed,
}

service { 'nginx_stop':
  ensure  => stopped,
  enable  => true,
  require => Package['nginx'],
}

file_line { 'Add redirection, 301':
  ensure   => 'present',
  path     => '/etc/nginx/sites-available/default',
  after    => 'listen 80 default_server;',
  multiple => true,
  line     => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

service { 'nginx':
  ensure  => running,
  enable  => true,
  require => Package['nginx'],
}