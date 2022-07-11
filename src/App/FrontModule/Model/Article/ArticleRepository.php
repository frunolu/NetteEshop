<?php

/*  _____ _______         _                      _
 * |_   _|__   __|       | |                    | |
 *   | |    | |_ __   ___| |___      _____  _ __| | __  ___ ____
 *   | |    | | '_ \ / _ \ __\ \ /\ / / _ \| '__| |/ / / __|_  /
 *  _| |_   | | | | |  __/ |_ \ V  V / (_) | |  |   < | (__ / /
 * |_____|  |_|_| |_|\___|\__| \_/\_/ \___/|_|  |_|\_(_)___/___|
 *                                _
 *              ___ ___ ___ _____|_|_ _ _____
 *             | . |  _| -_|     | | | |     |  LICENCE
 *             |  _|_| |___|_|_|_|_|___|_|_|_|
 *             |_|
 *
 * IT ZPRAVODAJSTVÍ  <>  PROGRAMOVÁNÍ  <>  HW A SW  <>  KOMUNITA
 *
 * Tento zdrojový kód je součástí výukových seriálů na
 * IT sociální síti WWW.ITNETWORK.CZ
 *
 * Kód spadá pod licenci prémiového obsahu a vznikl díky podpoře
 * našich členů. Je určen pouze pro osobní užití a nesmí být šířen.
 * Více informací na http://www.itnetwork.cz/licence
 */

namespace App\Model\Facades;

use App\Model\Entities\Article;
use App\Model\Entities\ArticleCategory;
use App\Model\Entities\ArticleComment;
use App\Model\Entities\User;
use App\Model\Queries\ArticlesListQuery;
use Kdyby\Doctrine\ResultSet;
use Nette\InvalidArgumentException;
use Nette\Utils\ArrayHash;
use Nette\Utils\DateTime;

/**
 * Fasáda pro manipulaci s články.
 * @package App\Model\Facades
 */
class ArticleFacade extends BaseFacade
{
	/**
	 * Najde a vrátí článek podle jeho ID.
	 * @param int|NULL ID článku
	 * @return Article|NULL vrátí entitu článku nebo NULL pokud článek nebyl nalezen
	 */
	public function getArticle($id)
	{
		return isset($id) ? $this->em->find(Article::class, $id) : NULL;
	}

	/**
	 * Vytváří nový článek.
	 * @param User            $user     uživatel
	 * @param ArticleCategory $category kategorie, do které má článek spadat
	 * @param ArrayHash       $data     informace o novém článku
	 */
	public function createArticle(User $user, ArticleCategory $category, $data)
	{
		$article = new Article();
		$article->title = $data->title;
		$article->content = $data->content;
		$article->released = FALSE;
		$user->addArticle($article);
		$category->addArticle($article);

		$this->em->persist($article);
		$this->em->flush();
	}

	/**
	 * Edituje článek.
	 * @param Article   $article článek
	 * @param ArrayHash $data    editované informace o kategorii
	 */
	public function editArticle(Article $article, $data)
	{
		$article->title = $data->title;
		$article->category = $data->category;
		$article->content = $data->content;
		$this->em->flush();
	}

	/**
	 * Označí článek s daným ID jako publikovaný.
	 * @param int  $id   ID článku
	 * @param User $user uživatel
	 * @throws InvalidArgumentException Jestliže uživatel nemá práva článek publikovat nebo článek s daným ID neexistuje.
	 */
	public function releaseArticle($id, User $user)
	{
		if (!$user->isAdmin())
			throw new InvalidArgumentException("youHaveNoPermissionsToReleaseArticles");

		$article = $this->getArticle($id);
		if (is_null($article))
			throw new InvalidArgumentException("articleDoesntExist");

		$article->released = TRUE;
		$article->releasedDate = new DateTime();
		$this->em->flush();
	}

	/**
	 * Vrací N posledních článků v závislosti na parametru.
	 * @param int $num počet N článků, které má vrátit
	 * @return ResultSet N posledních článků
	 */
	public function getLatestArticles($num)
	{
		$query = new ArticlesListQuery();
		$query->onlyReleased();
		return $this->em->getRepository(Article::class)
			->fetch($query)
			->applyPaging(NULL, $num);
	}

	/**
	 * Vrací seznam ještě NEpublikovaných článků.
	 * @return ResultSet NEpublikované články
	 */
	public function getNoReleasedArticles()
	{
		$query = new ArticlesListQuery();
		$query->onlyNoReleased();
		return $this->em->getRepository(Article::class)->fetch($query);
	}

	/**
	 * Vrací počet ještě NEpublikovaných článků.
	 * @return int počet NEpublikovaných článků
	 */
	public function getNoReleasedArticlesCount()
	{
		return (int)$this->em->createQuery("
			SELECT COUNT(a.id)
			FROM App\Model\Entities\Article a
			WHERE a.released = 0
		")->getSingleScalarResult();
	}

	/**
	 * Přidá nový komentář od uživatele k danému článku.
	 * @param Article   $article článek
	 * @param User|NULL $user    uživatel; NULL pokud byl komentář přidán nepřihlášeným uživatelem
	 * @param string    $content obsah komentáře
	 */
	public function addComment(Article $article, $user, $content)
	{
		$comment = new ArticleComment();
		$comment->content = $content;
		$comment->date = new DateTime();
		$comment->article = $article;
		$comment->author = $user;
		$this->em->persist($comment);
		$this->em->flush();
	}
}
