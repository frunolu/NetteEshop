<?php

class Product
{
    /**
     *
     * @ORM\Column(type="string")
     */
    protected $product_id;

    /**
     *
     * @ORM\Column(type="string")
     */
    protected $code;

    /**
     * @ORM\Column(type="string")
     */
    protected $url;
    /**
     * @ORM\Column(type="string")
     */
    protected $title;
    /**
     * @ORM\Column(type="string")
     */
    protected $short_description;
    /**
     * @ORM\Column(type="text")
     */
    protected $description;

    /**
     * @ORM\Column(type="string")
     */
    protected $price;

    /**
     * @ORM\Column(type="integer")
     */
    protected $old_price;

    /**
     * @ORM\Column(type="string")
     */
    protected $rating_sum;

    /**
     * @ORM\Column(type="integer")
     */
    protected $ratings;

    /**
     * @ORM\Column(type="string")
     */
    protected $stock;

    /**
     * @ORM\Column(type="integer")
     */
    protected $images_count;

    /**
     * @ORM\Column(type="string")
     */
    protected $hidden;


}
