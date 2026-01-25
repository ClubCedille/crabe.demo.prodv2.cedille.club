$(document).ready(function() {
    $(".answer-sect").hide();
    $(".question-header").click(function() {
        $(this).next(".answer-sect").slideToggle(300);
        let first = $(this).find("i");
        let transformValue = "";
        if (first.css("transform") == "none") {
            transformValue = "rotate(180deg)";
        }

        first.css({
            transform: transformValue
        });
    })
});