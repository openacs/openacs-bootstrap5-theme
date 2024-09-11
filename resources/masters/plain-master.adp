<master src="/www/blank-master">
<if @doc@ defined><property name="&doc">doc</property></if>
<if @body@ defined><property name="&body">body</property></if>
<if @head@ not nil><property name="head">@head;literal@</property></if>
<if @focus@ not nil><property name="focus">@focus;literal@</property></if>
<if @displayed_object_id@ not nil><property name="displayed_object_id">@displayed_object_id;literal@</property></if>

<if @signatory@ defined>
    <property name="signatory">@signatory;literal@</property>
</if>
<if @focus@ defined>
    <property name="focus">@focus;literal@</property>
</if>

<div class="container-fluid">
    <!-- START HEADER -->
    <div class="row header">     
        <widget src="header-bar" ds="0" &="subsite_logo" &="navigation" &="subsite_url" &="subsite_name">
        <widget src="search" ds="0">
        <if @context_bar@ defined and @context_bar@ ne ""> <div class="m-0 col-12 context">@context_bar;noquote@</div> </if>
    </div>
    <!-- END HEADER -->
  
    <if @user_messages:rowcount@ gt 0>
        <div id="bootstrap5-alert-message">
            <multiple name="user_messages">
                <div class="alert alert-success">
		    <a class="btn-close" data-bs-dismiss="alert">×</a>
		    <i class="bi bi-info-square-fill"></i>
                    @user_messages.message;noquote@
                </div>
            </multiple>
        </div>
    </if>
    
    <div class="block-marker">Begin main content</div>
    <div class="mx-3 mt-3 main-content" style="margin-bottom:60px;">
        <slave>
    </div>

    <!-- START FOOTER -->
    <nav class="navbar fixed-bottom navbar-light bg-light border-top">
      <div class="container-fluid text-center justify-content-center">
        <p class="mb-0" style="color:#666; font-size: 80%">
              This website is maintained by the OpenACS community. Any problems, email <a href="mailto:@signatory@">webmaster</a> or <a href="https://openacs.org/bugtracker/openacs.org/">submit</a> a bug report.
<br>
              (Powered by Tcl<a href="http://www.tcl.tk/"><img alt="Tcl Logo" src="/resources/openacs-bootstrap5-theme/images/plume.png" width="14" height="13"></a>, 
                Next Scripting <a href="https://next-scripting.org/"><img alt="NSF Logo" src="/resources/openacs-bootstrap5-theme/images/next-icon.png" width="14" height="8"></a>, 
                NaviServer <%= [ns_info patchlevel] %> <a href="http://sourceforge.net/projects/naviserver/"><img src="/resources/openacs-bootstrap5-theme/images/ns-icon-16.png" alt="NaviServer Logo" width="12" height="12"></a>,
                <%= [expr {[ns_conn isconnected] && [string match *.* [ns_conn peeraddr]] ? "IPv4" : "IPv6"}] %>)
        </p>
      </div>
    </nav>
    <!-- END FOOTER -->

</div>
