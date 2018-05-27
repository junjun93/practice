$(function(){
    $("#selectCityId").change(function(){
        var cityId = $("#selectCityId").val();
        //理解它，然后修改
        window.location.href = 'http://localhost:8080/report/cityId/' + cityId;
    })
});