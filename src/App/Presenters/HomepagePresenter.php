<?php

namespace App\Presenters;


use App\FrontModule\Model\Category\Category;
use App\FrontModule\Model\Category\CategoryRepository;
use Nette;
use Nette\Database\Context;


final class HomepagePresenter extends Nette\Application\UI\Presenter
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

    public function actionDefault(): void
    {
//        $this->category = $this->categoryRepository->getById(15);
//        $this->categories = $this->categoryRepository->getAll();

    }

    public function renderDefault(): void
    {
        $this->template->categories = $this->database->table('category')->fetchAll();
//        ->limit(1);
//        $this->template->setParameters([
//            'categories' => $this->categories,
//            'categoryName' => $this->category->getName(),
//            'categoryId' => $this->category->getId(),
//        ]);

        //       var_dump($this->category);
    }
//
//    public function actionShowCategory(): void
//    {
//        $this->categoryRepository->getById(10);
//        $this->categories = $this->categoryRepository->getAll();
//
//    }
//
//    public function renderShowCategory(): void
//    {
//        $this->template->setParameters([
//            'categories' => $this->categories,
//            'categoryName' => $this->category->getName(),
//            'categoryId' => $this->category->getId()
//        ]);
//    }
}

