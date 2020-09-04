$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var data = event.data;
        $(".container").css("display",data.show? "none":"block");
    
        $("#health-box").css("width",data.health + "%");
        $("#armor-box").css("width",data.armor + "%");
        $("#stamina-box").css("width",data.oxygen + "%");
        








        

        if (event.data.action == "updateStatus") {
            updateStatus(event.data.st);
        }
    })
})


$(function(){

    window.addEventListener('message', function(event){
        var item = event.data;
        $("#grade").text(item.job_grade);
        $("#name").text(item.job);
        $("#cash").text(item.cash);
       
        
})

});




function updateStatus(status){
    $('#boxHunger').css('width', status[0].percent+'%')
    $('#boxThirst').css('width', status[1].percent+'%')
   
}

