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

declare(strict_types=1);

namespace App\Presenters;

use App\Forms\FormFactory;
use Nette\Application\AbortException;
use Nette\Application\UI\Presenter;
use App\EshopModule\Model\CategoryManager;
use App\EshopModule\components\CategoryControl;
use Nette\Application\UI\Form;
use App\components\IPriceControlFactory;
use App\EshopModule\Model\SettingsManager;
use App\EshopModule\Model\OrderManager;
use App\components\PriceControl;

/**
 * Základní presenter pro všechny ostatní presentery aplikace.
 * @package App\Presenters
 */
abstract class BasePresenter extends Presenter
{
	/** Zpráva typu informace. */
	const MSG_INFO = 'info';
	/** Zpráva typu úspěch. */
	const MSG_SUCCESS = 'success';
	/** Zpráva typy chyba. */
	const MSG_ERROR = 'danger';
	/** Cesta ke globální šabloně formulářů. */
	const FORM_PATH = __DIR__ . '/../templates/forms/form.latte';

	/** @var FormFactory Továrnička na formuláře. */
	protected FormFactory $formFactory;

	/** @var CategoryManager Instance třídy modelu pro práci s kategoriemi. */
	private CategoryManager $categoryManager;

	/** @var IPriceControlFactory Instance třídy továrničky na tvorbu komponent pro vykreslování ceny. */
	private IPriceControlFactory $priceControlFactory;

	/** @var SettingsManager Instance třídy modelu pro práci s účetním nastavením. */
	private SettingsManager $settingsManager;

	/** @var OrderManager Instance třídy modelu pro práci s objednávkami. */
	private OrderManager $orderManager;

	/**
     * Získává továrnu na formuláře pomocí DI.
     * @param FormFactory $formFactory automaticky injektovaná továrna na formuláře
     * @param CategoryManager $categoryManager automaticky injektovaná třída modelu pro práci s kategoriemi
     * @param IPriceControlFactory $priceControlFactory automaticky injectovaná továrnička na tvorbu komponent pro vykreslování ceny
     * @param SettingsManager $settingsManager automaticky injektovaná třída modelu pro práci s účetním nastavením
     * @param OrderManager $orderManager automaticky injektovaná třída modelu pro práci s objednávkami
     */
    public function injectServices(FormFactory $formFactory,
                                   CategoryManager $categoryManager,
                                   IPriceControlFactory $priceControlFactory,
                                   SettingsManager $settingsManager,
                                   OrderManager $orderManager)
    {
        $this->formFactory = $formFactory;
        $this->categoryManager = $categoryManager;
        $this->priceControlFactory = $priceControlFactory;
        $this->settingsManager = $settingsManager;
        $this->orderManager = $orderManager;
    }


	/**
	 * Získává továrnu na formuláře pomocí DI.
	 * @param FormFactory $formFactory automaticky injektovaná továrna na formuláře
	 */
	public final function injectFormFactory(FormFactory $formFactory)
	{
		$this->formFactory = $formFactory;
	}

	/**
	 * Na začátku každé akce u všech presenterů zkontroluje uživatelská oprávnění k této akci.
	 * @throws AbortException Jestliže uživatel nemá oprávnění k dané akci a bude přesměrován.
	 */
	protected function startup()
	{
		parent::startup();
		if (!$this->getUser()->isAllowed($this->getName(), $this->getAction())) {
			$this->flashMessage('Nejsi přihlášený nebo nemáš dostatečná oprávnění.');
			$this->redirect(':Core:Administration:login');
		}
	}

	/** Volá se před vykreslením každého presenteru a předává společné proměné do celkového layoutu webu. */
	protected function beforeRender()
	{
		parent::beforeRender();
		$this->template->admin = $this->getUser()->isInRole('admin');
		$this->template->domain = $this->getHttpRequest()->getUrl()->getHost(); // Předá jméno domény do šablony.
		$this->template->formPath = self::FORM_PATH; // Předá cestu ke globální šabloně formulářů do šablony.
		$this->template->categories = $this->categoryManager->getCategories($this->getUser()->isInRole('admin')); // Předá kategorie do šablony.
		$this->template->settings = $this->settingsManager->getSettings();
		$this->template->cart = $this->orderManager->getOrderSummary();
	}

	/**
	 * Vytváří komponentu, která se stará o rekurzivní vykreslení stromového navigačního menu kategorií.
	 * @return CategoryControl komponenta menu kategorií
	 */
	protected function createComponentMenu()
	{
		return new CategoryControl();
	}

	/**
	 * Vytváří a vrací komponentu formuláře pro vyhledávání produktů.
	 * @return Form formulář pro vyhledávání produktů
	 */
	protected function createComponentSearchForm()
	{
		$form = $this->formFactory->create();
		$form->addText('phrase')->setRequired();
		$form->addSubmit('send');
		$form->onSuccess[] = function($form, $values) {
			$this->redirect(':Eshop:Product:', [ 'phrase' => $values->phrase ]);
		};
		return $form;
	}
	
	/**
	 * Vytváří a vrací komponentu pro vykreslení ceny.
	 * @return PriceControl komponenta pro vykreslení ceny
	 */
	protected function createComponentPrice()
	{
		return $this->priceControlFactory->create();
	}
}
