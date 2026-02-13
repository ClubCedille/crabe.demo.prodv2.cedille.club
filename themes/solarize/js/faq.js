$(document).ready(function() {
    $(".answer-sect").hide();
    let current = null;
    $(".question-header").click(function() {
        // Close question currently open
        if (current) {
            current.find("i").css({
                transform: ""
            });
            current.next(".answer-sect").slideToggle(300);
        }

        // Open question clicked
        let first = $(this).find("i");
        let transformValue = "";

        // Slide answer section open/close
        $(this).next(".answer-sect").slideToggle(300);

        // Flip arrow to open state if answer is not showing
        if (first.css("transform") == "none") {
            transformValue = "rotate(180deg)";
        }

        // Rotate arrow
        first.css({
            transform: transformValue
        });

        // Track current question
        current = $(this);
    })
});