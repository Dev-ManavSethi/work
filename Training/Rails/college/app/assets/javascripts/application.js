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

    var global_data;

    $("#get_details_btn").hide();

    $("#submit_btn").click(function(){
        console.log("name submitted")

        $.ajax({
            url: "http://localhost:3000/department/name",
            type: 'POST',
            
            error: function (xhr, ajaxOptions, thrownError){
                alert("Error sending request to server");
                alert(thrownError);
            },
            success: function (data, textStatus, jqXHR) {
               
                $("#name_input").val(data.department.name);
                global_data = data;
                if (data.department == null){
                    $("#get_details_btn").hide();
                } else{
                    $("#get_details_btn").show();
                }
            }
        });
    });

    $("#get_details_btn").click(function() {
        $("#department_table").empty();
        var new_table = "<table> <tr> <th>ID</th> <th>Name</th> <th>HOD ID</th> </tr>";
        new_table += "<tr> <td>" + global_data.department.id+"</td>" + "<td>" + global_data.department.name + "</td>"+ "<td>" + global_data.department.hod_id + "</td>";

        $("#department_table").html(new_table);
    });

});


