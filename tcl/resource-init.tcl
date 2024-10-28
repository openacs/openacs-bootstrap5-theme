#
# Register some URNs that we are providing for sharing.
#
::util::resources::register_urns -prefix openacs_bootstrap5_theme

#
# Strictly speaking, jquery is not necessary for bootstrap 5. However,
# to ease the migration from bootstrap 3 to 5, we still include it.
#
template::register_urn \
    -urn urn:ad:js:jquery \
    -resource /resources/openacs-bootstrap5-theme/js/jquery-3.7.1.min.js

::template::CSS registerCSSclasses bootstrap5 {
    action "btn btn-outline-secondary btn-sm m-1"
    btn-default btn-outline-secondary
    bulk-action "btn btn-outline-secondary btn-sm"
    checkbox-inline form-check-inline
    close btn-close
    cog gear
    form-action "btn btn-outline-secondary btn-sm m-1"
    margin-form ""
    navbar-default navbar-light
    navbar-right ms-auto
    print printer
    radio-inline form-check-inline
}
# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
