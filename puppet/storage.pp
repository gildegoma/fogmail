#
# !! Receipt based on Jessie for a Mailserver, part of EthACK Mail Infrastructure
#
Exec {
  path => '/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/use/local/sbin',
}

include ::fogmail::base
include ::fogmail::scripts
class {'::fogmail::tor':
  type => 'storage',
}
class {'::fogmail::tahoe::storage':
  introducer => hiera('introducer'),
}

file {'/var/lib/tahoe-lafs/introducer/introducer.port':
  ensure  => file,
  require => Class['fogmail::tahoe::introducer'],
  mode    => '0600',
  owner   => 'introducer',
  group   => 'nogroup',
  content => '59933',
}
