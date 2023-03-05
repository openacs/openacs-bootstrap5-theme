#
# Register some URNs that we are providing for sharing.
#

set version $::openacs_bootstrap5_theme::bootstrap_version

#
# Get resource info from this package. If not locally installed, offer
# a link for download.
#
set resource_info [::openacs_bootstrap5_theme::resource_info]
set prefix        [dict get $resource_info prefix]

foreach URN [dict keys [dict get $resource_info urnMap]] {
    ns_log notice REGISTER=[list template::register_urn \
        -urn $URN \
        -resource $prefix/[dict get $resource_info urnMap $URN] \
        -csp_list [expr {[dict exists $resource_info cspMap $URN]
                         ? [dict get $resource_info cspMap $URN]
                         : ""}]]
    template::register_urn \
        -urn $URN \
        -resource $prefix/[dict get $resource_info urnMap $URN] \
        -csp_list [expr {[dict exists $resource_info cspMap $URN]
                         ? [dict get $resource_info cspMap $URN]
                         : ""}]
}

#
# Strictly speaking, jquery is not necessary for bootstrap 5. However,
# to ease the migration from bootstrap 3 to 5, we still include it.
#
template::register_urn \
    -urn urn:ad:js:jquery \
    -resource /resources/openacs-bootstrap5-theme/js/jquery-3.6.3.min.js

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
