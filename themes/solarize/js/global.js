$(document).ready(function() {
    let visible = false;
    const ANIMATION_DURATION = 400;
    $("#mobile-menu-icon").click(function() {
        if (visible) {
            $("#nav").animate({
                height: "40px"
            }, {
                duration: ANIMATION_DURATION,
                done: function() {
                    $("#nav ul").hide();
                }
            });
        } else {
            $("#nav").animate({
                height: "100vh"
            }, {
                duration: ANIMATION_DURATION
            });
            $("#nav ul").show()
        }

        visible = !visible;
    });

    window.matchMedia("(min-width: 821px)")
        .addEventListener("change", function() {
            if (this.matches) {
                $("#nav ul").show();
            } else {
                $("#nav ul").hide();
                $("#nav").height("auto");
                visible = false;
            }
        });
});