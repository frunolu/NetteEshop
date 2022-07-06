<?php
declare(strict_types=1);

namespace App\FrontModule\Model\Category;

class CategoryRepository
{
    public function getById(int $id): Category
    {
        return new Category ($id, 'Jablka');
    }

    public function getAll(): array
    {
        return [
            new Category(1, 'Jablka'),
            new Category(2, 'Hrusky')
        ];
    }
}
