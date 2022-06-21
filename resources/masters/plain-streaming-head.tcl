set streaming_head 1

if {![info exists title]}      { set title       [ad_system_name]   }
if {![info exists doc(title)]} { set doc(title)  $title   }
if {[info exists context]}     { set context_bar [ad_context_bar {*}$context]}

set subsite_id [ad_conn subsite_id]
set subsite_url [subsite::get_element -subsite_id $subsite_id -element url]
set subsite_name [lang::util::localize [subsite::get_element -element instance_name]]

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
