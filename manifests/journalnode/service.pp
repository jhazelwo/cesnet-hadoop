# == Class hadoop::journalnode::service
#
# Start Hadoop Journal Node daemon. See also hadoop::journalnode.
#
class hadoop::journalnode::service {
  service { $hadoop::daemons['journalnode']:
    ensure    => 'running',
    enable    => true,
    subscribe => [File['core-site.xml'], File['hdfs-site.xml']],
  }

  if $hadoop::daemon_namenode {
    include hadoop::namenode::service
    Class['hadoop::namenode::service'] -> Class['hadoop::journalnode::service']
  }
}
