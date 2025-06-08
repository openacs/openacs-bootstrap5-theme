namespace eval openacs_bootstrap5_theme {
    variable parameter_info
    #
    # The version configuration can be tailored via the OpenACS
    #
    set parameter_info {
        package_key openacs-bootstrap5-theme
        parameter_name BootstrapVersion
        default_value 5.3.6
    }

    ad_proc -private ::openacs_bootstrap5_theme::resource_info {
        {-version ""}
    } {

        Get information about available version(s) of the bootstrap
        packages. The goal is to deliver resources either from the
        local filesystem, or from CDN.

        @return dict containing resourceDir, resourceName, cdn,
                cdnHost, prefix, cssFiles, jsFiles and extraFiles.

    } {
        variable parameter_info

        if {$version eq ""} {
            dict with parameter_info {
                set version [::parameter::get_global_value \
                                 -package_key $package_key \
                                 -parameter $parameter_name \
                                 -default $default_value]
            }
        }

        #
        # Provide paths for loading either via /resources/ or CDN
        #
        #   "resourceDir" is the absolute path in the filesystem
        #   "versionSegment" is the version-specific element both in the
        #                URL and in the filesystem.
        #
        set resourceDir    [acs_package_root_dir openacs-bootstrap5-theme/www/resources/bootstrap]
        #set cdn            //cdnjs.cloudflare.com/ajax/libs/bootstrap
        #set versionSegment $version
        set cdn            //cdn.jsdelivr.net/npm
        set versionSegment bootstrap@$version/dist

        if {[file exists $resourceDir/$versionSegment]} {
            set prefix  /resources/openacs-bootstrap5-theme/bootstrap/$versionSegment
            set cdnHost ""
            set cspMap ""
        } else {
            #
            # Use CDN
            #
            #set prefix $cdn/$version
            #set cdnHost cdnjs.cloudflare.com
            set cdnHost cdn.jsdelivr.net
            set prefix $cdn/$versionSegment
            dict set cspMap urn:ad:css:bootstrap5 style-src $cdnHost
            dict set cspMap urn:ad:css:bootstrap5 font-src $cdnHost
            dict set cspMap urn:ad:js:bootstrap5 script-src $cdnHost
        }

        lappend result \
            resourceName "Bootstrap 5" \
            resourceDir $resourceDir \
            versionSegment $versionSegment \
            cdn $cdn \
            cdnHost $cdnHost \
            prefix $prefix \
            cssFiles {css/bootstrap.min.css css/bootstrap.min.css.map} \
            jsFiles  {js/bootstrap.bundle.min.js js/bootstrap.bundle.min.js.map} \
            extraFiles {} \
            urnMap {
                urn:ad:css:bootstrap5 css/bootstrap.min.css
                urn:ad:js:bootstrap5  js/bootstrap.bundle.min.js
            } \
            cspMap $cspMap \
            versionCheckAPI {cdn jsdelivr library bootstrap count 1} \
            vulnerabilityCheck {service snyk library bootstrap} \
            parameterInfo $parameter_info \
            configuredVersion $version

        #urn:ad:js:popper2     dist/umd/popper.min.js
        return $result
    }
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
