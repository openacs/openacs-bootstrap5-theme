<nav class="navbar navbar-expand-lg bg-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="@subsite_url;literal@" style="padding:3px;">
      <if @subsite_logo@ not nil><img src="@subsite_logo;literal@" alt="Home"></if>
      <else><div>#acs-subsite.Subsite_Home#</div></else>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-expanded="false" aria-controls="navbarSupportedContent" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
      <ul class="navbar-nav">
        <comment> Tabbed Master Navigation </comment>
        <if @navigation:rowcount@ defined>
          <widget src="navigation" &="navigation" ds="0" &="subsite_url" &="subsite_name">
        </if>
        <widget src="login" ds="0" >
      </ul>
    </div><!-- /.navbar-collapse -->

  </div><!-- /.container-fluid -->
</nav>
