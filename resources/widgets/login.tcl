set user_id [ad_conn user_id]
set untrusted_user_id [ad_conn untrusted_user_id]
set user_name [person::name -person_id $untrusted_user_id]
if {$user_name eq ""} {
    ns_log notice "Cannot determine user_name for user-id $untrusted_user_id"
    set user_name "Unknown"
}
set system_name [ad_system_name]

# User Portrait
set portrait_id [acs_user::get_portrait_id -user_id $user_id]
if {$portrait_id == 0} {
    set email [party::email -party_id $user_id]
    set md5 [string tolower [ns_md5 $email]]
    set src //www.gravatar.com/avatar/$md5?size=35&d=mm
    security::csp::require img-src www.gravatar.com
} else {
    set src [export_vars -base /shared/portrait-bits.tcl {user_id {size x50}}]
}
set photo "<img width='35' height='35' class='photo' src='[ns_quotehtml $src]'>"

# Who's Online
set num_users_online [lc_numeric [whos_online::num_users]]
set whos_online_url "[subsite::get_element -element url]shared/whos-online"
set subsite_url [site_node::get_url -node_id [ad_conn subsite_node_id]]
#ns_log notice "subsite_url <$subsite_url>"

if {!$user_id} {
    #
    # If the current form is the login form, remove the password for
    # security reasons.
    #
    set f [ns_getform]
    if {[ns_set get $f form:id] eq "login"} {
        ns_set delkey $f password
    }
    #
    # Do not pass the __csrf_token via return_url. This seems to cause
    # problems with web vulnerability scanners, that poison the token
    # value.
    #
    ns_set delkey $f __csrf_token
    
    set return_url [ad_return_url]    
    set login_p 0
    set login_url [export_vars -base ${subsite_url}register/ return_url]
    set register_url [export_vars -base /register/user-new return_url]
} else {
    # set return_url [ad_return_url]
    set login_p 1
    set logout_url "${subsite_url}register/logout"    
    set name [person::get_person_info -person_id $user_id -element first_names]
}


# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
