<master src="/www/blank-master">
<property name="&doc">doc</property>
<if @streaming_head@ defined><property name="streaming_head">@streaming_head;literal@</property></if>

<div class="container-fluid">
    <!-- START HEADER -->
    <div class="row header">     
        <widget src="header-bar" ds="0" &="subsite_logo" &="navigation" &="subsite_url" &="subsite_name">
        <widget src="search" ds="0">
        <if @context_bar@ defined and @context_bar@ ne ""> <div class="col-12 context"> @context_bar;noquote@ </div> </if>
    </div>
    <!-- END HEADER -->

</div>
