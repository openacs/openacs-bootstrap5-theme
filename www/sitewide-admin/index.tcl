ad_page_contract {
    @author Gustaf Neumann

    @creation-date Aug 1, 2018
} {
}

set resource_info [::openacs_bootstrap5_theme::resource_info]
set version [dict get $resource_info installedVersion]

set title "[dict get $resource_info resourceName] - Sitewide Admin"
set context [list $title]


# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
