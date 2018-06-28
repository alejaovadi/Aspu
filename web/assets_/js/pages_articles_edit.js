$(function() {
  
  if (!window.Quill) {
    $('#article-editor,#article-editor-toolbar').remove();
    $('#article-editor-fallback').removeClass('d-none');
  } else {
    $('#article-editor-fallback').remove();
    var quill= new Quill('#article-editor', {
      modules: {
        toolbar: '#article-editor-toolbar'
      },
      theme: 'snow'
    });
  }

});
