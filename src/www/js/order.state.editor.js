/*  _____ _______         _                      _
 * |_   _|__   __|       | |                    | |
 *   | |    | |_ __   ___| |___      _____  _ __| | __  ___ ____
 *   | |    | | '_ \ / _ \ __\ \ /\ / / _ \| '__| |/ / / __|_  /
 *  _| |_   | | | | |  __/ |_ \ V  V / (_) | |  |   < | (__ / /
 * |_____|  |_|_| |_|\___|\__| \_/\_/ \___/|_|  |_|\_(_)___/___|
 *                                _
 *              ___ ___ ___ _____|_|_ _ _____
 *             | . |  _| -_|     | | | |     |
 *             |  _|_| |___|_|_|_|_|___|_|_|_|
 *             |_|                          _ _ _        LICENCE
 *        ___ ___    ___    ___ ___ ___ ___| | |_|___ ___
 *       |   | . |  |___|  |  _| -_|_ -| -_| | | |   | . |
 *       |_|_|___|         |_| |___|___|___|_|_|_|_|_|_  |
 *                                                   |___|
 *
 * IT ZPRAVODAJSTVÍ  <>  PROGRAMOVÁNÍ  <>  HW A SW  <>  KOMUNITA
 *
 * Tento zdrojový kód je součástí výukových seriálů na
 * IT sociální síti WWW.ITNETWORK.CZ
 *
 * Kód spadá pod licenci prémiového obsahu s omezeným
 * přeprodáváním a vznikl díky podpoře našich členů. Je určen
 * pouze pro osobní užití a nesmí být šířen. Může být použit
 * v jednom uzavřeném komerčním projektu, pro širší využití je
 * dostupná licence Premium commercial. Více informací na
 * http://www.itnetwork.cz/licence
 */


/** Změní stav objednávky. */
function changeOrderState() {
    var path = $(this).parent().parent().data("order-path");
    var state = $(this).prev().val();
    var self = this;
    $.get(path + '&state=' + state, function (data) {
        if(!isNaN(parseInt(data, 10)))
            $(self).parent().prev().find(".invoice-link").text(data); // Vepsání vygenerovaného čísla faktury do tabulky.
        alert("Úspěšně změněno. Zákazníkovi byl odeslán email.");
    }).fail(function (data) {
        alert("Došlo k chybě. Stav nebyl změněn protože: " + data.responseText);
    });
}

/** Změna stavu objednávky pomocí AJAXu. */
$(document).ready(function () {
    $.get($('#orders').data('source'), function (orderStates) {
        var lastCellsInRow = $(".change-state");
        var select = $("<select></select>");
        var submitButton = $("<button></button>");
        submitButton.attr("type", "button");
        submitButton.click(changeOrderState);
        submitButton.append('<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>');

        // Přidání selectů na jednotlivé řádky tabulky.
        for (var index in orderStates) {
            if (orderStates.hasOwnProperty(index)) {
                var option = $("<option></option>");
                option.attr("value", orderStates[index]);
                option.text(index);
                select.append(option);
            }
        }
        lastCellsInRow.append(select);
        lastCellsInRow.append(submitButton);

        // Výběr stavu objednávky v příslušných selectech.
        var selects = $("td.change-state select");
        for (var i = 0; i < selects.length; i++) {
            var state = $(selects[i]).parent().parent().data("order-state");
            $(selects[i]).find("option[value='" + state + "']").attr("selected", "");
        }
    })
});