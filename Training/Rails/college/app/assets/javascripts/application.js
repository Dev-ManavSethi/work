// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function(){

    var i=1;

    $("#add_section_button").click(function () {
        var section = "<div id='section-"+i+"'><h3>Section "+i+"</h3><input type='text' id='section-" + i + "-name' name='section-"+i+"-name' placeholder='Section "+i+" name'/><br/><input type='number' name='section-"+i+"-cord-id' placeholder='Co-ordinator teacher ID'/></div><br/>"
        $("#sections").append(section);
        i++;
      });

    $("#submit_btn").click(function(){

    });

    $("#form").submit(function(e) {

        e.preventDefault(); // avoid to execute the actual submit of the form.
    
        var form = $(this);

        console.log("yyyyyyyyyyyyyyyyyyyy")
    
        // $.ajax({
        //        type: "POST",
        //        url: url,
        //        data: form.serialize(), // serializes the form's elements.
        //        success: function(data)
        //        {
        //            alert(data); // show response from the php script.
        //        }
        //      });
    
    
    });

});


