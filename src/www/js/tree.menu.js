/**
 * Interaktivní stromové menu
 * Základ z http://cssdeck.com/labs/twitter-bootstrap-plain-collapsible-tree-menu
 */
 $(document).ready(function () {
    /**
     * Přidá akci kliknutí na kategorii s pod-menu - otevření pod-menu a uložení otevřené položky.
     * A na začátku zavře všechny položky.
     */
    $('nav.menu-tree label.tree-toggler').click(function () {
        window.sessionStorage.setItem('menu_opened', $(this).data('path'));
        $(this).next('ul.tree').toggle(300);
    }).next('ul.tree').toggle(0);

    /**
     * Přidá akci kliknutí na kategorii bez pod-menu - uložení otevřené položky.
     */
    $('nav.menu-tree a').click(function () {
        window.sessionStorage.setItem('menu_opened', $(this).data('path'));
    });

    /**
     * Pokusí se načíst posledně otevřenou položku a rozbalit menu tam, kde uživatel naposledy skončil.
     */
    var item = window.sessionStorage.getItem('menu_opened');
    if (item) $('nav.menu-tree [data-path$="' + item + '"]').parentsUntil('nav.menu-tree', 'ul.tree').show();
});