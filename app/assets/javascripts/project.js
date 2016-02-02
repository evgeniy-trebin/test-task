$(document).ready(function(){

  Dropzone.autoDiscover = false;

  $("#person_form").dropzone({
    maxFilesize: 3,
    maxFiles: 1,
    paramName: "person[photo]",
    addRemoveLinks: true,
    success: function(file, response){
      if(response['result'] == 'success') {
        this.disable();
        window.location.href = response['location']
      }
      else {
        alert('Error!');
        this.removeAllFiles();
      }
    }
  });
});