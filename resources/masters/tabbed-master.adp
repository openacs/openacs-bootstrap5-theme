<master src="plain-master">
<property name="&doc">doc</property>
<if @body@ defined><property name="&body">body</property></if>
<if @head@ not nil><property name="head">@head;literal@</property></if>
<if @focus@ not nil><property name="focus">@focus;literal@</property></if>
<if @context@ not nil><property name="context">@context;literal@</property></if>
<if @subsite_logo@ defined><property name="subsite_logo">@subsite_logo;noquote@</property></if>
<property name="&navigation">navigation</property>

<slave>
