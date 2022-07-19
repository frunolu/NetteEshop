<?php

namespace App\FrontModule\Model\Product;


use App\CoreModule\DatabaseManager;
use Nette\Database\Context;
use Nette\Database\Table\Selection;

class ProductRepository extends DatabaseManager
{
    /** Konstanty pro manipulaci s modelem. */
    const
        TABLE_NAME = 'product',
        COLUMN_ID = 'product_id',
        COLUMN_URL = 'url',
        COLUMN_HIDDEN = 'hidden',
        COLUMN_RATING_SUM = 'rating_sum',
        COLUMN_RATINGS = 'ratings',
        COLUMN_STOCK = 'stock',
        COLUMN_IMAGE_COUNT = 'images_count';

    public Context $database;

    public function getAll(): selection
    {
        return $this->database->table('product');
    }

//    public function getProductFromId($productId): selection
//    {
//        return $this->getAll->where('product_id', $productId);
//    }


    /**
     * Vrátí produkt podle URL.
     * @param string $url URL produktu
     * @param null|string $columns sloupce pro SELECT, nebo null pro všechny sloupce
     * @return bool|mixed|IRow produkt
     */
    public function getProduct($url, $columns = null)
    {
        return $this->database->table(self::TABLE_NAME)
            ->select($columns ? $columns : '*')
            ->where(self::COLUMN_URL, array($url))
            ->where('NOT ' . self::COLUMN_HIDDEN)->fetch();
    }

    /**
     * Vrátí produkt podle ID.
     * @param int $productId ID produktu
     * @param null|string $columns sloupce pro SELECT, nebo null pro všechny sloupce
     * @return bool|mixed|IRow produkt
     */
    public function getProductFromId($productId, $columns = null)
    {
        return $this->database->table(self::TABLE_NAME)
            ->select($columns ? $columns : '*')
            ->where(self::COLUMN_ID, array($productId))->fetch();
    }
}
