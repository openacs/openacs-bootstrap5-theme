<if @login_p;literal@ true>
    <li class="nav-item dropdown" style="z-index:1100;padding-top:3px;">
        <a href="#" class="dropdown-toggle" data-bs-toggle="dropdown">@photo;noquote@ </a>
        <ul class="dropdown-menu dropdown-menu-lg-end">
            <li class="dropdown-item">
                <!-- user greeting or login message -->
                <a href="@subsite_url;literal@pvt/home">#acs-subsite.Welcome_user#  </a>
            </li>

            <li class="dropdown-item">
                <a href="@whos_online_url@" title="#acs-subsite.Whos_Online_link_label#">
                    @num_users_online;noquote@
                    <if @num_users_online@ eq 1>
                        #acs-subsite.Member#
                    </if>
                    <else>
                        #acs-subsite.Members#
                    </else>
                    #acs-subsite.Online#
                </a>
            </li>
            <li class="divider"></li>
            <li class="dropdown-item">
                <a href="@subsite_url;literal@register/logout" title="#acs-subsite.Logout_from_system#">#acs-subsite.Logout#</a>
            </li>
        </ul>
    </li>
</if>
<else>
    <li class="nav-item"><a href="@login_url@">Log In</a></li>
</else>  
