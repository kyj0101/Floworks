window.onload = ()=>{
    CKEDITOR.replace('emailContent', {
        height: 500
    });
          
    CKEDITOR.replace( 'emailContent' );
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