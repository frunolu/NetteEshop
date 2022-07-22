<?php

namespace App\Model\Facades;

use App\Model\Entities\User;
use App\Model\Entities\UserSettings;
use App\Model\Queries\UsersListQuery;
use Kdyby\Doctrine\ResultSet;
use Nette\Security\AuthenticationException;
use Nette\Security\IAuthenticator;
use Nette\Security\Identity;
use Nette\Security\Passwords;
use Nette\Utils\ArrayHash;
use Nette\Utils\DateTime;

/**
 * Fasáda pro manipulaci s uživateli.
 * @package App\Model\Facades
 */
class UserFacade extends BaseFacade implements IAuthenticator
{
    public function getUserByName()
    {

    }

	/**
	 * Najde a vrátí uživatele podle jeho ID.
	 * @param int|NULL $id ID uživatele
	 * @return User|NULL vrátí entitu uživatele nebo NULL pokud uživatel nebyl nalezen
	 */
	public function getUser($id)
	{
		return isset($id) ? $this->em->find(User::class, $id) : NULL;
	}

	/**
	 * Uloží nově registrovaného uživatele do databáze.
	 * @param ArrayHash $values hodnoty pro nového uživatele
	 */
	public function registerUser($values)
	{
		$user = new User();
		$user->name = $values->name;
		$user->password = Passwords::hash($values->password);
		$user->email = $values->email;
		$user->ip = $values->ip;
		$user->role = User::ROLE_USER;
		$user->registrationDate = new DateTime();

		$settings = new UserSettings();
		$settings->user = $user;

		$this->em->persist($user);
		$this->em->persist($settings);
		$this->em->flush();
	}

	/**
	 * Přihlásí uživatele do systému.
	 * @param array $credentials jméno a heslo uživatele
	 * @return Identity identitu přihlášeného uživatele pro další manipulaci
	 * @throws AuthenticationException Jestliže došlo k chybě při prihlašování, např. špatné heslo nebo uživatelské jméno.
	 */
	function authenticate(array $credentials)
	{
		list($username, $password) = $credentials;

		$user = $this->em->getRepository(User::class)->findOneBy(array("name" => $username));

		if (!isset($user) || !Passwords::verify($password, $user->password)) throw new AuthenticationException("youFilledBadNameOrPassword");

		// Zjistí, jestli heslo potřebuje rehashovat a případně to udělá.
		if (Passwords::needsRehash($user->password)) {
			$user->password = Passwords::hash($password);
			$this->em->flush();
		}

		return new Identity($user->id);
	}

	/**
	 * Upraví nastavení daného uživatele.
	 * @param User      $user   uživatel
	 * @param ArrayHash $values nové hodnoty nastavení
	 */
	public function updateSettings(User $user, $values)
	{
		$settings = $user->settings;
		$settings->description = $values->description;
		$this->em->flush();
	}

	/**
	 * Vrací seznam uživatelů seřazaný podle jejich jmen ve vzestupném pořadí.
	 * @return ResultSet seznam uživatelů
	 */
	public function getUsersList()
	{
		$query = new UsersListQuery();
		$query->orderByName();
		return $this->em->getRepository(User::class)->fetch($query);
	}

	/**
	 * Přidá nového uživatele do databáze.
	 * @param ArrayHash $values hodnoty pro nového uživatele
	 */
	public function addUser($values)
	{
		$role = $values->isAdmin ? User::ROLE_ADMIN : User::ROLE_USER;

		$user = new User();
		$user->name = $values->name;
		$user->password = Passwords::hash($values->password);
		$user->email = $values->email;
		$user->ip = "";
		$user->role = $role;
		$user->registrationDate = new DateTime();

		$settings = new UserSettings();
		$settings->user = $user;

		$this->em->persist($user);
		$this->em->persist($settings);
		$this->em->flush();
	}

	/**
	 * Edituje uživatele.
	 * @param User      $user   uživatel
	 * @param ArrayHash $values editované informace o uživateli
	 */
	public function editUser(User $user, $values)
	{
		$role = $values->isAdmin ? User::ROLE_ADMIN : User::ROLE_USER;

		$user->name = $values->name;
		$user->email = $values->email;
		$user->role = $role;

		$this->em->flush();
	}
}
