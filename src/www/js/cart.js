/**
 * JavaScript k obsluze košíku
 */
 $(function () {
    // Odstranění položky v košíku
    $("#cart-management").find(".remove-button").click(function () {
        $(this).prev('input').val(0);
    });
});