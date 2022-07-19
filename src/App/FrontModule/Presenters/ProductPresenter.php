<?php

namespace App\FrontModule\Presenters;


use App\FrontModule\Model\Product\Product;
use App\FrontModule\Model\Product\ProductRepository;
use App\FrontModule\Model\Category\Category;
use App\FrontModule\Model\Category\CategoryRepository;
use Nette;
use Nette\Application\BadRequestException;
use Nette\Utils\ArrayHash;


final class ProductPresenter extends Nette\Application\UI\Presenter
{
    private ProductRepository $productRepository;
    private CategoryRepository $categoryRepository;

    public function __construct(
        ProductRepository $productRepository,
        CategoryRepository $categoryRepository
    )
    {
        parent::__construct();
        $this->productRepository = $productRepository;
        $this->categoryRepository = $categoryRepository;
    }

/**
 * Detail produktu.
 * @param string $url URL produktu
 * @throws BadRequestException Jestliže produkt s danou URL nebyl nalezen.
 */
public function renderDetail($url)
{
    // Pokusí se načíst produkt s danou URL a pokud nebude nalezen, vyhodí chybu 404.
    if (!($product = $this->productRepository->getProduct($url)))
        throw new BadRequestException();

    // Nastavení výchozí hodnoty formuláře pro hodnocení produktu.
    $this['reviewForm']->setDefaults(['product_id' => $product->getPrimary()]);

    // Předání parametrů do šablony.
    $this->template->product = $product;
    $this->template->reviews = $this->reviewManager->getReviews($product->product_id);

    // Definuje komponentu, která se vykreslí v rámci formuláře pro psaní recenzí.
    $this->template->ratingWidget = ArrayHash::from(['name' => 'rating', 'after' => 'product_id']);
}

public function actionDefault($productId): void
    {

    }

    public function renderDefault(): void
    {
        echo "5";
    }



}
