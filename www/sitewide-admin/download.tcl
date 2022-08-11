ad_page_contract {
    @author Gustaf Neumann

    @creation-date Aug 1, 2018
} {
    {version:word,notnull ""}
}

if {$version eq ""} {
    set version $::openacs_bootstrap5_theme::bootstrap_version
}
::util::resources::download \
    -resource_info [::openacs_bootstrap5_theme::resource_info]

ad_returnredirect .

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
