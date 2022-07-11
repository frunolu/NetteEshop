<?php

class Person
{
    /**
     * @ORM\Column(type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    protected $id;
    /**
     * @var PersonDetail
     * @ORM\ManyToOne(targetEntity=PersonDetail::class)
     * @ORM\JoinColumn(referencedColumnName="id", name="person_detail_id")
     */
    protected $person_detail_id;

    /**
     * @ORM\Column(type="integer")
     */
    protected $address_id;
    /**
     * @ORM\Column(type="integer")
     */
    protected $delivery_address_id;
    /**
     * @ORM\Column(type="integer")
     */
    protected $bank_account_id;
    /**
     * @var User
     *
     * @ORM\ManyToOne(targetEntity=User::class)
     * @ORM\JoinColumn(referencedColumnName="id", name="user_id")
     */
    protected $user;




}
