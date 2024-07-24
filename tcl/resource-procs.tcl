namespace eval openacs_bootstrap5_theme {
    set bootstrap_version 5.3.3

    ad_proc -private ::openacs_bootstrap5_theme::resource_info {} {

        Get information about available version(s) of the bootstrap
        packages. The goal is to deliver resources either from the
        local filesystem, or from CDN.

        @return dict containing resourceDir, resourceName, cdn,
                cdnHost, prefix, cssFiles, jsFiles and extraFiles.

    } {
        #
        # Provide paths for loading either via /resources/ or CDN
        #
        #   "resourceDir" is the absolute path in the filesystem
        #   "resourceUrl" is the URL path provided to the request processor
        #   "versionDir" is the version-specific element both in the
        #                URL and in the filesystem.
        #
        set resourceDir   [acs_package_root_dir openacs-bootstrap5-theme/www/resources/bootstrap]
        set resourceUrl   /resources/openacs-bootstrap5-theme/bootstrap
        set version       $openacs_bootstrap5_theme::bootstrap_version
        set versionDir    $version
        set cdn           //cdnjs.cloudflare.com/ajax/libs/bootstrap

        if {[file exists $resourceDir/$versionDir]} {
            set prefix  $resourceUrl/$version
            set cdnHost ""
        } else {
            #
            # Use CDN
            #
            set prefix $cdn/$version
            set cdnHost cdnjs.cloudflare.com
        }
        
        lappend result \
            resourceName "Bootstrap 5" \
            resourceDir $resourceDir \
            versionDir $versionDir \
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
            versionCheckURL https://cdnjs.com/libraries/bootstrap \
            versionCheckAPI {cdn cdnjs library bootstrap count 1} \
            vulnerabilityCheckURL https://snyk.io/advisor/npm-package/bootstrap \
            installedVersion $version

        #urn:ad:js:popper2     dist/umd/popper.min.js

        if {$cdnHost ne ""} {
            lappend result cspMap [subst {
                urn:ad:css:bootstrap5 {
                    style-src $cdnHost
                    font-src $cdnHost
                }
                urn:ad:js:bootstrap5 {
                    script-src $cdnHost
                }
            }]
        }
        return $result
    }
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
