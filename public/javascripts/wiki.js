$(document).ready(function() {
  $('#wiki-preview-button').click(function() {
    var form = $('#wiki-edit-form');
    var preview_url = form.attr('action').replace(/\/edit$/,'') + '/preview';
    
    $('#wiki-preview').remove();
    
    $.post(preview_url, form.serialize(), function(data) {
      $('#wiki').append(data);
      
      $('#wiki-preview-close').click(function() {
        $('#wiki-preview').remove();
      });
    });
    
    return false;
  });
  
  $('#wiki-preview-button').removeAttr('disabled');
});
