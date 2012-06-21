class dsh (
    $ensure     = params_lookup('ensure'),
    $systems    = params_lookup('systems'),
    $groups     = params_lookup('groups'),
    ) inherits dsh::params {

    package { 'dsh':
        ensure  => $ensure
    }
    
    dsh::group { 'all':
        systems => $systems
    }

    if $groups {
        create_resources('dsh::groups', $groups)
    }
}


