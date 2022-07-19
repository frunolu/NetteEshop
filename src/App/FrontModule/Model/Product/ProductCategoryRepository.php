<?php
namespace App\FrontModule\Model\Product;

use App\CoreModule\DatabaseManager;
use Nette\Database\Context;
use Nette\Database\Table\Selection;

class ProductCategoryRepository extends DatabaseManager
{
    public Context $database;

    public function getAll():selection
    {
        return $this->database->table('product_category');
    }
    /**
     * Vrátí ID produktu, z danej kategorie.
     * @param int $categoryId ID categorie
     * @return Selection ID produktu, z danej kategorie
     */
    public function getProductsByCategoryId(int $categoryId):selection
    {
        return $this->getAll()->where('category_id', $categoryId);
    }

    public function getNameOfProductById($productId)
    {
        return $this->getAll()->where('product_id', $productId);

}
    /**
     *
     * @ORM\Column(type="integer")
     */
    protected $product_category_id;

    /**
     *
     * @ORM\Column(type="integer")
     */
    protected $product_id;

    /**
     * @ORM\Column(type="integer")
     */
    protected $category_id;

}
