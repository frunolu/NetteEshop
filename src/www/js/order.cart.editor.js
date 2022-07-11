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

$(function () {
    // Počáteční inicializace.
    $.nette.init();
    $('#buyer-form').dialog({width: 600, height: 500, autoOpen: false});

    // Otevření dialogového okna.
    $('#change-buyer-button').click(function (e) {
        e.preventDefault();
        $('#buyer-form').dialog('open');
    });

    // Odeslání formuláře pro editaci odběratele pomocí Nette AJAXu.
    $("#buyer-form-submit").click(function (e) {
        e.preventDefault();
        $.nette.ajax({}, $('#frm-personForm-personForm'), e).done(function () {
            $('#buyer-form').dialog('close');
        }).error(function () {
            alert("Při stahování změn ze serveru došlo k chybě. Aktualizujte stránku.")
        });
    });

    // Změna počtu kusů daného produktu v objednávce pomocí Nette AJAXu.
    $(document).on('click', '.order-item-change', function (e) {
        e.preventDefault();
        $.nette.ajax({data: {'quantity': $(this).prev().val()}}, this, e).error(function (data) {
            console.log(data);
            alert("Při nahrávání změn na server došlo k chybě." + data);
        });
    });
});