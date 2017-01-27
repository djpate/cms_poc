$( document ).ready(function() {
  
  $("#contentarea").contentbuilder({
    snippetFile: '/cms/snippets-bootstrap.html'
  });

  $("#article_submit_action input").on('click', function(){
    $("#article_content").val($('#contentarea').data('contentbuilder').html());
  });

});
