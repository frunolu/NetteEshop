<?php

namespace App\Presenters;

use App\FrontModule\Model\Category\Category;
use App\FrontModule\Model\Category\CategoryRepository;
use App\FrontModule\Model\Product\ProductCategoryRepository;
use App\FrontModule\Model\Product\ProductRepository;
use Nette;
use Nette\Application\Responses\JsonResponse;
use Nette\Application\UI\Presenter;
use Nette\Database\Context;
use Nette\Database\Table\ActiveRow;
use Nette\Database\Table\Selection;
use Tracy\Debugger;

class CategoryPresenter extends Presenter
{
    private ProductRepository $productRepository;
    private CategoryRepository $categoryRepository;
    private Category $category;
    /**
     * @var ProductCategoryRepository @inject
     */
    private ProductCategoryRepository $productCategoryRepository;
    /**
     * @var Category[]
     */
    private array $categories;
    /**
     * @var Context
     */
    public $database;

    public function __construct(
        CategoryRepository $categoryRepository,
        Context $database,
        ProductCategoryRepository $productCategoryRepository,
        ProductRepository $productRepository
    ) {
        parent::__construct();
        $this->categoryRepository = $categoryRepository;
        $this->database = $database;
        $this->productCategoryRepository = $productCategoryRepository;
        $this->productRepository = $productRepository;
    }


//    public function actionShowCategory(): void
//    {
//
//        $this->categories = $this->categoryRepository->getAll();
////        $this->database->query("SELECT * FROM category")->fetchAll();
//    }

    public function renderShowCategory(int $categoryId): void
    {
        $this->template->category = $this->database->table('category')->get($categoryId);
        $this->template->products = $this->database->table('product')->fetchAll();
        $this->template->productsOfCategory = $this->productCategoryRepository->getProductsByCategoryId($categoryId);
       // $this->template->productsNames = $this->productRepository->getAll()->getProductFromId($categoryId);

        //->get(ProductsOfCategory);

//$this->template->products = $this->database->table('product')->get($strom);
 //        Debugger::barDump($this->template->productsNames);
//        ->where('id', $categoryId);
        //       $this->template->test='ahojsss';
//        $this->template->setParameters([
//
//
//            'categoryName' => $this->category->getName(),
//            'categoryId' => $this->category->getId(),
//            'categories' => $this->categories
//
//
//        ]);
//        var_dump($this->category);
    }

//    /** Vrací JSON s kategoriemi.
//     * @throws \Nette\Application\AbortException
//     */
//    public function handleGetJson()
//    {
//        $categoriesArray = [];
//        $categories = $this->categoryRepository->getAllCategories();
//        array_walk($categories, function (ActiveRow $category) use (&$categoriesArray) {
//            $categoriesArray[] = $category->toArray();
//        });
//        $this->sendResponse(new JsonResponse($categoriesArray));
//    }

//    public Nette\Database\Context $database;
}
