<list name="navigation_groups">
    <!-- @navigation_groups:item@ -->
    <if @navigation_groups:item@ eq "main">
        <multiple name="navigation">
            <if @navigation.parent@ eq "">
                <if @navigation.submenu@ not nil>
                    <li<if @navigation.id@ not nil> id="@navigation.id@" class="nav-item active dropdown"</if><else> class="nav-item dropdown"</else>>
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" 
                        <if @navigation.class@ not nil> class="@navigation.class;noquote@"</if>
                        <if @navigation.title@ not nil> title="@navigation.title;noquote@"</if>
                        <if @navigation.lang@ not nil> lang="@navigation.lang;noquote@"</if>
                        <if @navigation.accesskey@ not nil> accesskey="@navigation.accesskey;noquote@"</if>
                        <if @navigation.tabindex@ not nil> tabindex="@navigation.tabindex;noquote@"</if>>
                        <if @navigation.display_template@ not nil>@navigation.display_template;noquote@</if>
                        <else>@navigation.label@</else>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-lg-end">@navigation.submenu;noquote@</ul>
                    </li>
                </if>
                <else>
                    <li<if @navigation.id@ not nil> id="@navigation.id@" class="nav-item active"</if><else> class="nav-item"</else>>
                        <a href="@navigation.href@" class="nav-link <if @navigation.class@ not nil>@navigation.class;noquote@</if>"
                        <if @navigation.target@ not nil> target="@navigation.target;noquote@"</if>
                        <if @navigation.title@ not nil> title="@navigation.title;noquote@"</if>
                        <if @navigation.lang@ not nil> lang="@navigation.lang;noquote@"</if>
                        <if @navigation.accesskey@ not nil> accesskey="@navigation.accesskey;noquote@"</if>
                        <if @navigation.tabindex@ not nil> tabindex="@navigation.tabindex;noquote@"</if>>
                        <if @navigation.display_template@ not nil>@navigation.display_template;noquote@</if>
                        <else>@navigation.label@</else></a>
                    </li>
                </else>
            </if>
        </multiple>
    </if>
</list>
