namespace eval openacs_bootstrap5_theme {
    set bootstrap_version 5.0.2

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
	set resourceDir [acs_package_root_dir openacs-bootstrap5-theme/www/resources/bootstrap]
	set resourceUrl /resources/openacs-bootstrap5-theme/bootstrap
        set cdnHost    cdn.jsdelivr.net
	set cdn         //$cdnHost/npm
	set version     $openacs_bootstrap5_theme::bootstrap_version

	if {[file exists $resourceDir/$version]} {
	    set prefix  $resourceUrl/$version
	    set cdnHost ""
	} else {
            # https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css
            # https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js            
	    set prefix $cdn/bootstrap@$version/dist
	}

	lappend result \
	    resourceName "Bootstrap 5" \
	    resourceDir $resourceDir \
	    cdn $cdn \
	    cdnHost $cdnHost \
	    prefix $prefix \
	    cssFiles {css/bootstrap.min.css} \
	    jsFiles  {js/bootstrap.bindle.min.js dist/umd/popper.min.js} \
	    extraFiles {} \
	    urnMap {
		urn:ad:css:bootstrap5 css/bootstrap.min.css
		urn:ad:js:bootstrap5  js/bootstrap.bundle.min.js
	    }
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
                urn:ad:js:popper2 {
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
