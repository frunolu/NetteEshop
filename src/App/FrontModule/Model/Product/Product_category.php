<?php

class Product_category
{
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
