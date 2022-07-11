<?php

/**
 * Doctrine entita pro tabulku komentářů článků (article_comment).
 * @package App\Model\Entities
 * @ORM\Entity
 * @ORM\Table(name="article_comment")
 */
class ArticleComment extends BaseEntity
{
    /**
     * Sloupec pro ID komentáře.
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue
     */
    protected $id;

    /**
     * Sloupec pro obsah komentáře.
     * @ORM\Column(type="text")
     */
    protected $content;

    /**
     * Sloupec pro datum vytvoření komentáře.
     * @ORM\Column(type="datetime")
     */
    protected $date;

    /**
     * Vazba komentáře N:1 na článek.
     * @ORM\ManyToOne(targetEntity="Article", inversedBy="comments")
     * @ORM\JoinColumn(name="article_id", referencedColumnName="id")
     */
    protected $article;

    /**
     * Vazba komentáře N:1 na uživatele.
     * @ORM\ManyToOne(targetEntity="User")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     */
    protected $author;

    /**
     * Namapovaná vazba článku 1:N na tabulku komentářů.
     * @ORM\OneToMany(targetEntity="ArticleComment", mappedBy="article")
     */
    protected $comments;

    /** Konstruktor s inicializací objektů pro vazby mezi entitami. */
    public function __construct()
    {
        parent::__construct();
        $this->comments = new ArrayCollection();
    }

    /**
     * Přidá nový komentář k danému článku.
     * @param ArticleComment $comment nový komentář
     */
    public function addComment(ArticleComment $comment)
    {
        $this->comments[] = $comment;
        $comment->article = $this;
    }
}

