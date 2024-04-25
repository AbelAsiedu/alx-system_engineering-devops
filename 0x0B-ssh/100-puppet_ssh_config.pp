# Puppet manifest to configure SSH client settings

# Ensure the SSH configuration directory exists
file { '/home/vagrant/.ssh':
  ensure => directory,
  mode   => '0700',
  owner  => 'vagrant',
  group  => 'vagrant',
}

# Configure SSH client to use specific private key and disable password authentication
file_line { 'Declare identity file':
  path    => '/home/vagrant/.ssh/config',
  line    => 'IdentityFile ~/.ssh/school',
  ensure  => present,
  match   => '^IdentityFile.*$',
  replace => false,
}

file_line { 'Turn off passwd auth':
  path    => '/home/vagrant/.ssh/config',
  line    => 'PasswordAuthentication no',
  ensure  => present,
  match   => '^PasswordAuthentication.*$',
  replace => false,
}
