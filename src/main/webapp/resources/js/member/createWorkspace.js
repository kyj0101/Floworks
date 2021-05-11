$(function(){
  
    $(".custom-file-input").change(function(){
        
        const typeArr = ['.jpg', '.png', '.jpeg', '.bmp', '.gif'];
        const fileOriginalName = $(this).val();
        const fileType = fileOriginalName.substring(fileOriginalName.lastIndexOf("."),fileOriginalName.length)
        
        for(let i = 0; i < typeArr.length; i++){
            
            if(typeArr[i] === fileType){
    
                const fileName = fileOriginalName.replace('C:\\fakepath\\', " ");
                const file = $(this)[0].files[0];
                const reader = new FileReader();
                //const formData = new FormData().append("uploadFile", file); 나중에 ajax쓸때 사용할 상수

                $(".custom-file-label").text(fileName);

                reader.onload = e =>{

                    $(".profile").attr("src", e.target.result);
                    
                }

                reader.readAsDataURL(file);

                return false;
            }

        }

        alert("지원하지 않는 파일 형식입니다. 이미지 파일을 선택하세요.");
        $(".custom-file-label").text('워크스페이스 프로필 이미지를 선택하세요.');
    
    });
});