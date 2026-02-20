$(document).ready(function() {
    $(".answer-sect").hide();
    let current = null;
    $(".question-header").click(function() {
        // Close question currently open
        if (current) {
            $("[data-qa-id=" + current + "]").find("i").css({
                transform: ""
            });
            $("[data-qa-id=" + current + "]").find(".answer-sect").slideToggle(300);
        }

        // Open question clicked
        let first = $(this).find("i");
        let transformValue = "";

        // Flip arrow to open state if answer is not showing
        if (first.css("transform") == "none") {
            transformValue = "rotate(180deg)";
        }

        // Rotate arrow
        first.css({
            transform: transformValue
        });

        // Slide answer section open/close
        questionId = $(this).parent().attr("data-qa-id");
        if (current == questionId) {
            current = null;
        } else {
            $(this).parent().find(".answer-sect").slideToggle(300);

            // Track current question
            current = questionId;
        }
    })
});