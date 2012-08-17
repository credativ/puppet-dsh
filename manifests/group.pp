# Define a dsh group file
define dsh::group (
    $grpname=$title,
    $systems = []
    ) {

    
    file { "/etc/dsh/group/${grpname}":
        ensure  => present,
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        content => template('dsh/dsh_group.erb')
    }
}


