$( document ).ready(function() {
  
  $("#contentarea").contentbuilder({
    snippetFile: '/widgets'
  });

  $("#article_submit_action input").on('click', function(){
    $("#article_content").val($('#contentarea').data('contentbuilder').html());
  });

});
