<multiple name=elements>
	<if @elements.section@ not nil>
		<fieldset id="@elements.form_id;noi18n@:@elements.section;noi18n@" @elements.sec_fieldset;noquote@><!-- section fieldset -->
        <legend @elements.sec_legend;noquote@><span>@elements.sec_legendtext@</span></legend>
	</if>
	
	<group column="section">
      <if @elements.widget;literal@ eq "hidden"> 
		<noparse><div><formwidget id="@elements.id@"></div></noparse>
	  </if>
  
	  <else>
		<if @elements.widget;literal@ eq "submit"><!-- if form submit button wrap it in the form-button class -->
  		 <div class="form-group">
                 <div class="col-sm-offset-2 col-sm-10">
           <group column="widget">
             <noparse><formwidget id="@elements.id@">&nbsp;</noparse>
           </group>
  		 </div>
  		 </div>
       </if>
        
	   <else> <!-- wrap the form item in the form-group class -->
	     <div class="form-group">
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
				   <label class="col-form-label col-sm-2" for="@elements.id@">
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
                 <div class="col-sm-offset-2 col-sm-10">
                 <div class="checkbox">
                 <formgroup id="@elements.id@">			
				   <label for="@elements.form_id@:elements:@elements.id@:\@formgroup.option@">
				     \@formgroup.widget;noquote@
					 \@formgroup.label;noquote@
                                   </label>
				   <br>
				 </formgroup>
                 </div></div>
			   </noparse>
             </if>
			 <else>
			   <noparse>
                 <span class="form-widget col-sm-10">
                   <formwidget id="@elements.id@">
                 </span>
			   </noparse>
             </else>							
							
           <if @elements.help_text@ not nil>
             <span class="col-sm-offset-2 col-sm-10 form-text">
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
