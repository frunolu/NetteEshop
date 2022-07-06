<?php

namespace App\Presenters;


use App\FrontModule\Model\Category\Category;
use App\FrontModule\Model\Category\CategoryRepository;
use Nette;


final class HomepagePresenter extends Nette\Application\UI\Presenter
{
    private CategoryRepository $categoryRepository;
    private Category $category;
    /**
     * @var Category[]
     */
    private array $categories;

    public function __construct(CategoryRepository $categoryRepository)
    {
        parent::__construct();
        $this->categoryRepository = $categoryRepository;
    }

    public function actionDefault(): void
    {
        $this->category = $this->categoryRepository->getById(15);
        $this->categories = $this->categoryRepository->getAll();

    }

    public function renderDefault(): void
    {
        $this->template->setParameters([
            'categories' => $this->categories,
            'categoryName' => $this->category->getName(),
            'categoryId' => $this->category->getId(),
        ]);

        var_dump($this->category);
    }
//
//    public function actionShowCategory(int $id):void
//    {
//        $this->categoryRepository->getById($id);
//
//    }
//
//    public function renderShowCategory(int $categoryId): void
//    {
//        $this->template->categoryId = $categoryId;
//        $this->template->setParameters([
//        'categoryId' => $this->category->getId()]);
//    }
}

