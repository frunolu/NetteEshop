<?php

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

namespace App\FrontModule\components;

use Nette\Application\UI\Control;

/**
 * Komponenta pro vykreslení kategorie v menu.
 * @package App\EshopModule\Components
 */
class CategoryControl extends Control
{
	/** Cesta k souboru šablony pro tuto komponentu. */
	const TEMPLATE = __DIR__ . '/../Presenters/templates/components/category.latte';

	/**
	 * Vykresluje komponentu kategorie.
	 * @param array $categories kategorie, které se mají vykreslit
	 */
	public function render($categories)
	{
		$this->template->setFile(self::TEMPLATE); // Nastaví šablonu komponenty.
		$this->template->categories = $categories; // Předá kategorie pro vykreslení do šablony.
		$this->template->render(); // Vykreslí komponentu.
	}

	/**
	 * Vytváří komponentu pro vykreslení kategorie při rekurzivním volání pro účel vykreslení sub-kategorie v menu.
	 * @return CategoryControl instance komponenty pro vykreslení kategorie menu
	 */
	protected function createComponentCategories()
	{
		return new CategoryControl();
	}
}
