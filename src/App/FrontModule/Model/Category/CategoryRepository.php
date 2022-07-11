<?php
declare(strict_types=1);

namespace App\FrontModule\Model\Category;

use App\CoreModule\DatabaseManager;
use App\FrontModule\Model\Product\ProductRepository;
use Nette\Application\Responses\JsonResponse;
use Nette\Database\Context;
use Nette\Database\Table\ActiveRow;
use Nette\Database\Table\Selection;

class CategoryRepository extends DatabaseManager
{

    public const TABLE_NAME = 'category';
    public const COLUMN_ID = 'category_id';
    public const COLUMN_TITLE = 'title';
    public const COLUMN_PARENT = 'parent_category_id';
    public const COLUMN_HIDDEN = 'hidden';
    public const COLUMN_ORDER = 'order_no';
    public const COLUMN_URL = 'url';

    public function getById(int $id): Category
    {
        return new Category ($id, 'Jablka');
    }

//    public Context $database;
    public function getAll():array
    {
        return [
            new Category(1, 'obyvaci-pokoj'),
            new Category(2, 'kvetinace'),
            new Category(3, 'zaclony'),
            new Category(4, 'sklenene-kvetinace'),
            new Category(5, 'kuchyne'),
            new Category(6, 'koupelny'),
            new Category(9, 'loznice'),
            new Category(10, 'keramicke-kvetinace'),
        ];

 //return $this->database->table('category');
    }

    /**
     * Vrátí URL adresu první kategorie, do které produkt spadá.
     * @param int $productId ID produktu
     * @return string URL adresa první kategorie, do které produkt spadá nebo prázdný string, pokud nespadá do žádné
     */
    public function getProductsOfCategory($categoryId)
    {
        if ($row = $this->database
            ->table(ProductRepository::TABLE_NAME . '_' . self::TABLE_NAME)
            ->where(COLUMN_ID = $categoryId)
            ->fetch()
        ) {
            return $row->ref(self::TABLE_NAME)->url;
        } else {
            return '';
        }
    }
    /**
     * Vrátí všechny kategorie produktů.
     * @return array kategorie produktů
     */
    public function getAllCategories()
    {
        return $this->database->table(self::TABLE_NAME)->fetchAll();
    }

    /**
     * Vrátí URL adresu první kategorie, do které produkt spadá.
     * @param int $productId ID produktu
     * @return string URL adresa první kategorie, do které produkt spadá nebo prázdný string, pokud nespadá do žádné
     */
    public function getProductCategory($productId)
    {
        if ($row = $this->database
            ->table(ProductRepository::TABLE_NAME . '_' . self::TABLE_NAME)
            ->where(ProductRepository::COLUMN_ID, $productId)
            ->fetch()
        ) {
            return $row->ref(self::TABLE_NAME)->url;
        } else {
            return '';
        }
    }

    /**
     * Zformátuje pole kategorií z databáze rekurzivně do stromu.
     * Kód převzat z http://www.jugbit.com/php/php-recursive-menu-with-1-query/ a následně upraven.
     * @param array $categories kategorie pro zformátování
     * @param int $parentId ID rodičovské kategorie
     * @return array kategorie ve stromové podobě
     */
    private function formatTree($categories, int $parentId)
    {
        $tree = array(); // Vytvoříme prázdný strom
        // Pokusíme se najít položky, které patří do rodičovské kategorie ($parentId)
        foreach ($categories as $category) {
            if ($category->parent_category_id == $parentId) {
                // Položku přidáme do nového stromu a rekurzivně přidáme strom podpoložek
                $tree[$category->category_id] = [
                    'category' => $category,
                    'subcategories' => $this->formatTree($categories, $category->category_id)
                ];
            }
        }
        return $tree; // Vrátíme hotový strom
    }

//    /**
//     * Vrátí kategorie produktů v podobě stromu.
//     * @param bool $showAll zda chceme zobrazovat i skryté kategorie
//     * @return array kategorie produktů v podobě stromu
//     */
//    public function getCategories($showAll = false)
//    {
//        $categories = $this->database->table(self::TABLE_NAME); // Získá seznam kategorií z databáze.
//        if (!$showAll) {
//            $categories->where('NOT ' . self::COLUMN_HIDDEN);
//        } // Schová skyté kategorie.
//        $categories->order(self::COLUMN_ORDER); // Seřadí výsledek.
//        return $this->formatTree($categories->fetchAll(), null); // Vratí výsledný strom.
//    }

    /** Vrací JSON s kategoriemi.
     * @throws \Nette\Application\AbortException
     */
    public function handleGetJson()
    {
        $categoriesArray = [];
        $categories = $this->categoryRepository->getAllCategories();
        array_walk($categories, function (ActiveRow $category) use (&$categoriesArray) {
            $categoriesArray[] = $category->toArray();
        });
        $this->sendResponse(new JsonResponse($categoriesArray));
    }
}

