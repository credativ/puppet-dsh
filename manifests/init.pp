# = Class: dsh
#
# Manage dsh on a system
#
# == Parameters:
#
# [*ensure*]
#    Weither to ensure presence of dsh and group files or not.
#
# [*systems*]
#    A list of all systems for populating the 'all' group file
#
# [*groups*]
#    A hash containing additional groups to be created.
#
# == Author:
#
#    Patrick Schoenfeld <patrick.schoenfeld@credativ.de>
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
        create_resources('dsh::group', $groups)
    }
}


