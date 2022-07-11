<?php

namespace App\FrontModule\Model\User;



/**
 * Doctrine entita pro tabulku uživatelů (user).
 * @package App\Model\Entities
 * @ORM\Entity
 */
class User
{
    // Pomocné konstanty pro náš model.

    /** Konstanty pro uživatelské role. */
    const ROLE_USER = 1,
        ROLE_ADMIN = 2;

    /** Konstanty pro uživatelské jméno. */
    const MAX_NAME_LENGTH = 15,
        NAME_FORMAT = "^[a-zA-Z0-9]*$";

    // Proměné reprezentující jednotlivé sloupce tabulky.

    /**
     * Sloupec pro ID uživatele.
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue
     */
    protected $id;


    /**
     * Sloupec pro heslo.
     * @ORM\Column(type="string")
     */
    protected $password;



    /**
     * Sloupec pro IP adresu.
     * @ORM\Column(type="string")
     */
    protected $ip;

    /**
     * Sloupec pro datum registrace.
     * @ORM\Column(name="`registration_date`", type="datetime")
     */
    protected $registrationDate;

    /**
     * Sloupec role uživatele. Význam hodnot viz. konstanty pro uživatelské role.
     * @ORM\Column(type="integer")
     */
    protected $role;

    /**
     * Namapovaná vazba uživatele 1:N na tabulku článků.
     * @ORM\OneToMany(targetEntity="Article", mappedBy="user")
     */
    protected $articles;

    /**
     * Namapovaná vazba uživatele 1:1 na tabulku s nastavením účtu uživatele.
     * @ORM\OneToOne(targetEntity="UserSettings", mappedBy="user")
     */
    protected $settings;

    /** Konstruktor s inicializací objektů pro vazby mezi entitami. */
    public function __construct()
    {
        parent::__construct();
        $this->articles = new ArrayCollection();
    }

    /**
     * Ověřuje, zda je uživatel v roli administrátora.
     * @return bool vrací true, pokud je uživatel administrátor; jinak vrací false
     */
    public function isAdmin()
    {
        return $this->role === self::ROLE_ADMIN;
    }

    /**
     * Přidá nový článek do seznamu daného uživatele.
     * @param Article $article nový článek
     */
    public function addArticle(Article $article)
    {
        $this->articles[] = $article;
        $article->user = $this;
    }
}
