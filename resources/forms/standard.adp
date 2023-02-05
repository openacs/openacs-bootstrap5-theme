<multiple name=elements>
	<if @elements.section@ not nil>
		<fieldset id="@elements.form_id;noi18n@:@elements.section;noi18n@" @elements.sec_fieldset;noquote@><!-- section fieldset -->
        <a name='@elements.section;noi18n@'><legend @elements.sec_legend;noquote@><span>@elements.sec_legendtext@</span></legend></a>
	</if>
	
	<group column="section">
      <if @elements.widget;literal@ eq "hidden"> 
		<noparse><div><formwidget id="@elements.id@"></div></noparse>
	  </if>
  
	  <else>
		<if @elements.widget;literal@ eq "submit"><!-- if form submit button wrap it in the form-button class -->
  		<div class="form-group mb-3">
           <group column="widget">
             <noparse><formwidget id="@elements.id@" class="btn btn-outline-secondary">&nbsp;</noparse>
           </group>
  		 </div>
       </if>
        
	   <else> <!-- wrap the form item in the form-group class -->
	     <div class="mb-3">
           <noparse>
			 <formerror id="@elements.id@">
			   <span class="form-error">
				 \@formerror.@elements.id@;noquote\@
			   </span> <!-- /form-error -->
			 </formerror>
		   </noparse>

		   <if @elements.widget;literal@ in radio checkbox> 
             <if @elements.legendtext@ defined>
			   <fieldset @elements.fieldset;noi18n@>
                 <!-- radio button groups and checkbox groups get their own fieldsets -->
				 <legend @elements.legend;oni18n@><span>@elements.legendtext@</span></legend>
             </if>
		   </if>

             <if @elements.label@ not nil>
	       <noparse>
                 <if @form_properties.mode;literal@ eq display or @elements.widget;literal@ in radio checkbox date inform>
                   <!-- no label tag -->
                 </if>
                 <else>
				   <label for="@elements.id@">
                 </else>

                 <if \@formerror.@elements.id@\@ not nil>
                   <span class="form-label form-label-error">
                 </if>
                 <else>
                   <span class="form-label">
                 </else>
               </noparse>

               @elements.label;noquote@

               <if @form_properties.show_required_p;literal@ true>
                 <if @elements.optional@ nil and @elements.mode;literal@ ne "display" and @elements.widget;literal@ ne "inform">
                   <strong class="form-required-mark">(#acs-templating.required#)</strong>
                 </if>
               </if>
               </span><!-- form-label -->
                 <if @form_properties.mode;literal@ eq display or @elements.widget;literal@ in radio checkbox date inform>
                   <!-- no label tag -->
                 </if>
                 <else>
                                   </label>
                 </else>

		     </if>
		     <else>
                        <if @form_properties.show_required_p;literal@ true>
                           <if @elements.optional@ nil and @elements.mode;literal@ ne "display" and @elements.widget;literal@ ne "inform">
			     <span class="form-label form-required-mark">
			       #acs-templating.required#
			     </span>
		           </if>
		        </if>
		     </else>

		     <if @elements.widget;literal@ in radio checkbox>
                           <noparse>
                <formgroup id="@elements.id@" class="form-check-input">
                  <div class="form-check">
                    \@formgroup.widget;noquote@
				   <label class="form-check-label" for="@elements.form_id@:elements:@elements.id@:\@formgroup.option@">
					 \@formgroup.label;noquote@
				   </label>
				   </div>
				 </formgroup>
			   </noparse>
             </if>
             <elseif @elements.widget;literal@ in select>
               <noparse>
                 <formwidget id="@elements.id@" class="form-select">
               </noparse>
             </elseif>
			 <else>
			   <noparse>
                   <formwidget id="@elements.id@" class="form-control">
			   </noparse>
             </else>							
							
           <if @elements.help_text@ not nil>
             <span class="form-text">
       	         <adp:icon name="form-info-sign">&nbsp;
                 <noparse><formhelp id="@elements.id@"></noparse>
             </span> <!-- /form-text -->
           </if>

		   <if @elements.widget;literal@ in radio checkbox> 
             <if @elements.legendtext@ defined>
               <!-- radio button groups and checkbox groups get their own fieldsets -->
			   </fieldset>
             </if>
		   </if>
		 </div> <!-- form-group -->
       </else>
	</else>
  </group>

  <if @elements.section@ not nil>
    </fieldset> <!-- section fieldset -->
  </if>
</multiple>
