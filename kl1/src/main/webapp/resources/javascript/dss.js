function hasCSSClass(id,css){
	var elements = document.getElementsByClassName(css);
	
	 for(var i=elements.length-1; i >=0; i--){
		 if(elements[i].id == id){
			 return true;
		 }
	 }
	return false;
}

function toggle_visibilityById(id) {
	$("#"+id).toggle("slow");
	
      /* var e = document.getElementById(id);
       if(e.style.display == ''){
	       if(hasCSSClass(id,'hidden'))
	    	   e.style.display = 'block';
	       else
	    	   e.style.display = 'none';
       }
       else{
    	   if(e.style.display == 'block')
    		   e.style.display = 'none';
    	   else
    		   e.style.display = 'block';
       }
*/
    }
function toggle_visibilityByName(name) {
    var elements = document.getElementsByName(name);
    
    for(var i=elements.length-1; i >=0; i--){
    	if(elements[i].style.display == ''){
	    	if(hasCSSClass(elements[i].id,'hidden')) {
	    		elements[i].style.display='block';
	    	}
	    	else
	    		elements[i].style.display='none';
    	}
    	else{
	    	if(elements[i].style.display == 'none') {
	    		elements[i].style.display='block';
	    	}
	    	else
	    		elements[i].style.display='none';    		
    	}
    }
}		

/*function toggle_disabled(disabled_class) {
    var elements = document.getElementsByClassName(disabled_class);   
    for (var i=elements.length-1; i >=0; i--) {
        if (elements[i].disabled) {
     	    elements[i].disabled=false;
     	  // elements[i].className='enabled_box';
        }
        else
        	elements[i].disabled=true;
    }
 }*/

function toggle_disabledByForm(formId) {
	var elements = document.getElementById(formId);
    for (var i=elements.length-1; i >=0; i--) {
        if (elements[i].disabled) {
     	    elements[i].disabled=false;
        }
        else
        	elements[i].disabled=true;
    }
 }

function toggle_update(v,vi,form,ta,text,p){
	toggle_disabledByForm(form);
	toggle_visibilityByName(v);
	$("#"+vi).hide();
	prepareTextarea(form,ta,text,p);
}

function toggle_updateCancel(v,vi,form,ta,p){
	toggle_disabledByForm(form);
	toggle_visibilityByName(v);
	$("#"+vi).show();

	var oFormObject = document.getElementById(form);
	oFormObject.elements[ta].style.display = 'none';
	
	var o = document.getElementById(p);
	o.style.display = 'block';
}

function prepareTextarea(form,txtarea,text,p){
	var oFormObject = document.getElementById(form);
	oFormObject.elements[txtarea].value = text;
	oFormObject.elements[txtarea].disabled = false;
	oFormObject.elements[txtarea].style.display = 'block';
	
	var o = document.getElementById(p);
	o.style.display = 'none';
}
function loadTextArea(form,placeholderId,txtAreaId){
	var oFormObject = document.getElementById(form);
	var temp = $("#"+placeholderId).html();
	oFormObject.elements[txtAreaId].value = temp;
	$('#'+txtAreaId).htmlarea();
}
function loadTextArea3(classToShow,placeholderId,txtAreaId){
	$("."+classToShow).toggle('fast');
	var temp = $("#"+placeholderId).html();
	$('#'+txtAreaId).val(temp);
	$('#'+txtAreaId).htmlarea();
}
function loadTextArea2(placeholderId,txtAreaId,frmControls,form){
	var temp = $("#"+placeholderId).html();
	$('.'+frmControls).toggle();
	$("#txtarea"+txtAreaId).val(temp);
	$('#txtarea'+txtAreaId).htmlarea();
	$("iframe").contents().find("body").css("color","#454545");
	$("iframe").contents().find("body").css("font","15px/24px Georgia, Serif");
	$("iframe").contents().find("body").css("border","1px solid #DCDEE2");
	$("iframe").contents().find("body").css("padding","5px");
	$("iframe").contents().find("body").css("margin-left","1px");
	//$('#'+placeholderId).toggle();
	$('#div'+txtAreaId).show();
	$('#'+form).find(':disabled').removeAttr('disabled');
}
function unloadTextArea(placeholderId,txtAreaId,frmControls,form){
	$('.'+frmControls).hide();

	//$('#'+placeholderId).show();
	$('#'+txtAreaId).hide();

}
function htmlEntities(str) {
    return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}
function isValidDate(dateString)
{
    // First check for the pattern
    if(!/^\d{2}\/\d{2}\/\d{4}$/.test(dateString))
        return false;

    // Parse the date parts to integers
    var parts = dateString.split("/");
    var day = parseInt(parts[0], 10);
    var month = parseInt(parts[1], 10);
    var year = parseInt(parts[2], 10);

    // Check the ranges of month and year
    if(year < 1000 || year > 3000 || month == 0 || month > 12)
        return false;

    var monthLength = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];

    // Adjust for leap years
    if(year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
        monthLength[1] = 29;

    // Check the range of the day
    return day > 0 && day <= monthLength[month - 1];
};
function validateEmail(email) { 
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
} 
function validateForm(formId){
	//var form = document.getElementsByName(formName);

	/*for (var i=form[0].elements.length-1; i >=0; i--) {
		form[0].elements[i].style.backgroundColor = '#fff';
	}
	$('#'+form[0].id+' input[type=text]').css('backgroundColor','red');
	try{
		if(form[0].elements['firstname'].value==null || form[0].elements['firstname'].value==""){
			form[0].elements['firstname'].style.backgroundColor = '#FF6666';
			$('label[for="firstname"] span p').text("Gelieve uw naam ook in te vullen");
			
				if(form[0].elements['lastname'].value==null || form[0].elements['lastname'].value==""){
					form[0].elements['lastname'].style.backgroundColor = '#FF6666';
					$('label[for="firstname"] span p').text("naam en familienaam verplicht");
					$('label[for="firstname"] span p').css('color','red');
				}
			return false;
		}
		else if(form[0].elements['lastname'].value==null || form[0].elements['lastname'].value==""){
			form[0].elements['lastname'].style.backgroundColor = '#FF6666';
			$('label[for="firstname"] span p').text("Gelieve uw familienaam ook in te vullen");
			return false;
	*/
	
	
	
	var valid = true;
	var id = "#"+formId;
	
	// reset all input fields
	$(id+" label span p").show();
	$(id+" label span .error").hide();
	$(id+" input[type=text]").css('backgroundColor','#fff');
	
	try
	{
		if($(id+" #firstname").val()==null || $(id+" #firstname").val()==""){
			valid= false;
			$(id+" label[for='firstname'] span p").hide();
			$(id+" label[for='firstname'] span .error").text("Naam verplicht");
			$(id+" label[for='firstname'] span .error").show();
			$(id+' #firstname').css('backgroundColor','#FF6666');
				if($(id+" #lastname").val()==null || $(id+" #lastname").val()==""){
					$(id+" label[for='firstname'] span .error").text("Naam en familienaam verplicht");
					$(id+' #lastname').css('backgroundColor','#FF6666');
				}
		}
		else if($(id+" #lastname").val()==null || $(id+" #lastname").val()==""){
			valid= false;
			$(id+" label[for='firstname'] span p").hide();
			$(id+" label[for='firstname'] span .error").text("Familienaam verplicht");
			$(id+" label[for='firstname'] span .error").show();
			$(id+' #lastname').css('backgroundColor','#FF6666');
		}
		if($(id+" #nationality").val()==null || $(id+" #nationality").val()==""){
			valid= false;
			$(id+" label[for='nationality'] span p").hide();
			$(id+" label[for='nationality'] span .error").text("Nationaliteit verplicht");
			$(id+" label[for='nationality'] span .error").show();
			$(id+' #nationality').css('backgroundColor','#FF6666');
		}
		if($(id+" #gender").val()==null || $(id+" #gender").val()==""){
			valid= false;
			$(id+" label[for='gender'] span p").hide();
			$(id+" label[for='gender'] span .error").text("Geslacht verplicht");
			$(id+" label[for='gender'] span .error").show();
			$(id+' #gender').css('backgroundColor','#FF6666');
		}
		if($(id+" #dateofbirth").val()==null || $(id+" #dateofbirth").val()==""){
			valid= false;
			$(id+" label[for='dateofbirth'] span p").hide();
			$(id+" label[for='dateofbirth'] span .error").text("Geboortedatum verplicht");
			$(id+" label[for='dateofbirth'] span .error").show();
			$(id+' #dateofbirth').css('backgroundColor','#FF6666');
		}
		else if (!isValidDate($(id+" #dateofbirth").val())){
			valid= false;
			$(id+" label[for='dateofbirth'] span p").hide();
			$(id+" label[for='dateofbirth'] span .error").text("formaat is niet dd/mm/jjjj");
			$(id+" label[for='dateofbirth'] span .error").show();
			$(id+' #dateofbirth').css('backgroundColor','#FF6666');
		}
		if($(id+" #email").val()==null || $(id+" #email").val()==""){
			valid= false;
			$(id+" label[for='email'] span p").hide();
			$(id+" label[for='email'] span .error").text("E-mail verplicht");
			$(id+" label[for='email'] span .error").show();
			$(id+' #email').css('backgroundColor','#FF6666');
		}
		else if (validateEmail($(id+" #email").val()) == false){
			valid= false;
			$(id+" label[for='email'] span p").hide();
			$(id+" label[for='email'] span .error").text("E-mail adres ongeldig");
			$(id+" label[for='email'] span .error").show();
			$(id+' #email').css('backgroundColor','#FF6666');
		}
		if($(id+" #mobile").val()==null || $(id+" #mobile").val()==""){
			valid= false;
			$(id+" label[for='mobile'] span p").hide();
			$(id+" label[for='mobile'] span .error").text("Gsm nummer verplicht");
			$(id+" label[for='mobile'] span .error").show();
			$(id+' #mobile').css('backgroundColor','#FF6666');
		}
		if($(id+" #address").val()==null || $(id+" #address").val()==""){
			valid= false;
			$(id+" label[for='address'] span p").hide();
			$(id+" label[for='address'] span .error").text("Adres verplicht");
			$(id+" label[for='address'] span .error").show();
			$(id+' #address').css('backgroundColor','#FF6666');
				if($(id+" #city").val()==null || $(id+" #city").val()==""){
					$(id+" label[for='address'] span .error").text("Adres en gemeente verplicht");
					$(id+' #city').css('backgroundColor','#FF6666');
						if($(id+" #postalcode").val()==null || $(id+" #postalcode").val()=="" || $(id+" #postalcode").val()=="0"){
							$(id+" label[for='address'] span .error").text("Woonplaats verplicht");
							$(id+' #postalcode').css('backgroundColor','#FF6666');
						}			
				}
				else if($(id+" #postalcode").val()==null || $(id+" #postalcode").val()==""){
					$(id+" label[for='address'] span .error").text("Adres en postcode verplicht");
					$(id+' #postalcode').css('backgroundColor','#FF6666');
				}
				
		}
		else if($(id+" #city").val()==null || $(id+" #city").val()==""){
			valid= false;
			$(id+" label[for='address'] span p").hide();
			$(id+" label[for='address'] span .error").text("Gemeente verplicht");
			$(id+" label[for='address'] span .error").show();
			$(id+' #city').css('backgroundColor','#FF6666');
				if($(id+" #postalcode").val()==null || $(id+" #postalcode").val()=="" || $(id+" #postalcode").val()=="0"){
					$(id+" label[for='address'] span .error").text("Gemeente en postcode verplicht");
					$(id+' #postalcode').css('backgroundColor','#FF6666');
				}
		}
		else if($(id+" #postalcode").val()==null || $(id+" #postalcode").val()=="" || $(id+" #postalcode").val()=="0"){
			valid= false;
			$(id+" label[for='address'] span p").hide();
			$(id+" label[for='address'] span .error").text("Postcode verplicht");
			$(id+" label[for='address'] span .error").show();
			$(id+' #postalcode').css('backgroundColor','#FF6666');
		}
		if(isNaN($(id+" #postalcode").val())){
			valid= false;
			$(id+" label[for='address'] span p").hide();
			$(id+" label[for='address'] span .error").text("Postcode niet numeriek");
			$(id+" label[for='address'] span .error").show();
			$(id+' #postalcode').css('backgroundColor','#FF6666');
		}
		else if(parseInt($(id+" #postalcode").val()) < 0){
			valid= false;
			$(id+" label[for='address'] span p").hide();
			$(id+" label[for='address'] span .error").text("Postcode moet > zijn dan 0");
			$(id+" label[for='address'] span .error").show();
			$(id+' #postalcode').css('backgroundColor','#FF6666');
		}
		if($(id+" #country").val()==null || $(id+" #country").val()==""){
			valid= false;
			$(id+" label[for='country'] span p").hide();
			$(id+" label[for='country'] span .error").text("Land verplicht");
			$(id+" label[for='country'] span .error").show();
			$(id+' #country').css('backgroundColor','#FF6666');
		}
		if($(id+" #linkedin").val()=="http://www.linkedin.com/in/mijnnaam"){
			$(id+" #linkedin").val("");
		}
	}
	catch(err){
		return false;
	}
	if(valid == true){
		$(id+" .button").prop('disabled', true);
		//$(id+" .button").css('backgroundColor','#8F8F8F');
		//$(id+" .button").css('borderColor','#EDEDED');
		$(id+" .button").hide();
		$(id+" #loading").show();
		$(id+" img").show();
	}
	return valid;
}
function clickUpload(elementId){
	$("#"+elementId).focus();
	$("#"+elementId).click();
}
function sliceMessage(messageId,elementId){
	var t = $("#"+messageId).text();
	var i = 7;
	var index = t.indexOf(".");
	while(i--){
		index = t.indexOf(".",index)+1;
	}
	t = t.substr(0,index);
	$("#"+elementId).text(t);
}
function hideMeGracefully(elementId){
	setTimeout(function(){$(elementId).hide('fast');},2000);
}
function removeFakePath(element){
	alert(element);
	//inputNode.value = fileInput.value.replace("C:\\fakepath\\", "");
}
function getInternetExplorerVersion()
// Returns the version of Windows Internet Explorer or a -1
// (indicating the use of another browser).
{
   var rv = -1; // Return value assumes failure.
   if (navigator.appName == 'Microsoft Internet Explorer')
   {
      var ua = navigator.userAgent;
      var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
      if (re.exec(ua) != null)
         rv = parseFloat( RegExp.$1 );
   }
   return rv;
}
function checkIEVersion()
{
   var ver = getInternetExplorerVersion();
   if ( ver> -1 )
   {
      if ( ver>= 9.0 ){
    	  // Ok, support for HTML5 and CSS3
      }  
      else
    	  window.location = "http://www.datasoftservices.be/version";

    }
}
function checkBrowserNonIE(){
	if (navigator.appName != 'Microsoft Internet Explorer'){
		window.location = "http://www.datasoftservices.be";
	}
}
$.fn.reply = function(element) { 
	var toggle= "off";
	if($(this).is(":visible")){
		toggle = "on";
	}
	$('[id^="reply_"]').hide('fast');
	if(toggle == "on"){
		$("#"+element).text("reply");
		return $(this).hide('fast');
	}
	else{
		$("#"+element).text("cancel reply");
		return  $(this).show('fast');
	}
}
$.fn.toggleText = function(defaultText,replaceText) { 
	$(this)
	  .focus(function() {
	        if (this.value === defaultText) {
	            this.value = replaceText;
	        }
	  })
	  .blur(function() {
	        if (this.value === replaceText) {
	            this.value = defaultText;
	        }
	});
}
$.fn.initComment = function(rootid){
	var id = $(this).attr('id');
	var width = $(this).parent().css('width');
	var w = parseInt(width);
	w = w - 20;
	$(this).css('width',w);

	$('#'+id+' .reply-block').css('width',w-40);

	if($(this).parent().css('background-color') == "rgb(241, 241, 241)"){

		$('#'+id+' .reply-block').css('background-color','#E6E6E6');

	}
	else{

		$('#'+id+' .reply-block').css('background-color','#F1F1F1');
		//$('#'+id+' .reply-tri').addClass('tri');
		//$('#'+id+' .reply-tri').removeClass('reply-tri');
		//$('#'+id+' .tri').css('margin-top','7px');
	}
	if($('#'+id+' .reply-block').css('background-color') == "rgb(230, 230, 230)"){

	}
	else{

		$('#'+id+' #reply-tri_'+rootid).addClass('tri');
		$('#'+id+' #reply-tri_'+rootid).removeClass('reply-tri');
		$('#'+id+' #reply-tri_'+rootid).css('margin-top','7px');
	}


}
$.fn.initMargin = function(originalCommentNumber){
	var margin = $('#aside_'+originalCommentNumber).css('margin-left');
	var m = parseInt(margin);
	m = m - 27;
	$(this).css('margin-left',m);
	
}
function disableEnterKey(e)
{
     var key;      
     if(window.event)
          key = window.event.keyCode; //IE
     else
          key = e.which; //firefox      

     return (key != 13);
}
