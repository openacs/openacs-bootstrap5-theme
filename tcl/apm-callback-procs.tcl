namespace eval openacs_bootstrap5_theme {}
namespace eval openacs_bootstrap5_theme::apm {}

ad_proc -private openacs_bootstrap5_theme::apm::after_install {} {
    Package after installation callback proc.  Add our themes, and set the acs-subsite's
    default master template parameter's default value to our "plain" theme.
} {

    # Insert this package's themes
    #
    # Note: we are still using jquery -- should be addressed, when we
    # are done with other issues.
    #
    db_transaction {
        subsite::new_subsite_theme \
            -create_or_replace \
            -key openacs_bootstrap5 \
            -name #openacs-bootstrap5-theme.tabbed# \
            -template tabbed-master \
            -css {
                {-href /resources/acs-subsite/site-master.css -media all -order 0}
                {-href urn:ad:css:bootstrap5 -media all -order 1}
                {-href /resources/openacs-bootstrap5-theme/css/main.css -media all -order 2}
                {-href /resources/openacs-bootstrap5-theme/css/color/grey.css -media all -order 3}
                {-href /resources/acs-templating/forms.css -media all -order 4}
                {-href /resources/acs-templating/lists.css -media all -order 5}
            } \
            -js {
                {-src urn:ad:js:jquery -order 1}
                {-src urn:ad:js:bootstrap5 -order 2}
            } \
            -form_template standard \
            -list_template table \
            -list_filter_template filters \
            -dimensional_template dimensional \
            -resource_dir /packages/openacs-bootstrap5-theme/resources \
            -streaming_head tabbed-streaming-head

        subsite::new_subsite_theme \
            -create_or_replace \
            -key openacs_bootstrap5_turquois \
            -name #openacs-bootstrap5-theme.tabbed-turquois# \
            -template tabbed-master-turquois \
            -css {
                {-href /resources/acs-subsite/site-master.css -media all -order 0}
                {-href urn:ad:css:bootstrap5 -media all -order 1}
                {-href /resources/openacs-bootstrap5-theme/css/main.css -media all -order 2}
                {-href /resources/openacs-bootstrap5-theme/css/color/turquois.css -media all -order 3}
                {-href /resources/acs-templating/forms.css -media all -order 4}
                {-href /resources/acs-templating/lists.css -media all -order 5}
            } \
            -js {
                {-src urn:ad:js:jquery -order 1}
                {-src urn:ad:js:bootstrap5 -order 2}
            } \
            -form_template standard \
            -list_template table \
            -list_filter_template filters \
            -dimensional_template dimensional \
            -resource_dir /packages/openacs-bootstrap5-theme/resources \
            -streaming_head tabbed-streaming-head-turquois
    }
}

ad_proc -private openacs_bootstrap5_theme::apm::before_uninstall {} {
    Uninstall the package
} {
    if {[subsite::get_theme] in {openacs_bootstrap5 openacs_bootstrap5_turquois}} {
        subsite::set_theme -theme default_plain
    }
    subsite::delete_subsite_theme -key openacs_bootstrap5
    subsite::delete_subsite_theme -key openacs_bootstrap5_turquois
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
