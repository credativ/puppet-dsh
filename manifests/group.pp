define dsh::group (
    $name=$title,
    $systems = []
    ) {

    
    file { '/etc/dsh/group/all':
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => template('dsh/dsh_group.erb')
    }
}


