<?php

namespace App\Presenters;

use App\FrontModule\Model\Category\Category;
use App\FrontModule\Model\Category\CategoryRepository;
use Nette;
use Nette\Application\Responses\JsonResponse;
use Nette\Application\UI\Presenter;
use Nette\Database\Context;
use Nette\Database\Table\ActiveRow;
use Tracy\Debugger;
class CategoryPresenter extends Presenter
{
    private CategoryRepository $categoryRepository;
    private Category $category;
    /**
     * @var Category[]
     */
    private array $categories;
    /**
     * @var Context
     */
    private $database;
    public function __construct(CategoryRepository $categoryRepository, Context $database)
    {
        parent::__construct();
        $this->categoryRepository = $categoryRepository;
        $this->database = $database;
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
//$this->template->products = $this->database->table('product')->get($strom);
       // Debugger::barDump($products);
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
