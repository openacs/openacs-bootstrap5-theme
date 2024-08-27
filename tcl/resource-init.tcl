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

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
