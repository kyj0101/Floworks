window.onload = ()=>{
    CKEDITOR.replace('editor1', {
        height: 500
    });
          
    CKEDITOR.replace( 'editor1' );
};
    
  
$(()=>{
    const $ccBtn = $("#btn-cc");
     const $bccBtn = $("#btn-bcc");
  
    $ccBtn.click(function(){
        $("#cc").toggleClass("cc-div");
    });
  
    $bccBtn.click(function(){
        $("#bcc").toggleClass("bcc-div");
    })
});