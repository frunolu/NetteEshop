<?php
declare(strict_types=1);

namespace App\FrontModule\Model\Category;

class Category
{


    /** Konstanty pro manipulaci s modelem. */
    const
        TABLE_NAME = 'category',
        COLUMN_ID = 'category_id',
        COLUMN_TITLE = 'title',
        COLUMN_PARENT = 'parent_category_id';

    private int $id;
    private string $name;

    public function __construct(int $id, string $name)
    {
        $this->id = $id;
        $this->name = $name;
    }

    public function getId(): int
    {
        return $this->id;
    }


    public function getName(): string
    {
        return $this->name;
    }
}
