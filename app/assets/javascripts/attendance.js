$(document).ready(function(){


  $('#batch').change(function(){
    $.get("/students/student_register/" + this.value , function(mydata){
      $('.student_list').html(mydata);
    });
  });


  $('#attendance_report').change(function(){
    $.get("/students/student_report/" + this.value , function(mydata){
      $('.student_list').html(mydata);
    });
  });


});
