<?php

namespace App\Router;

use Nette;
use Nette\Application\Routers\Route;
use Nette\Application\Routers\RouteList;


final class RouterFactory
{
    use Nette\StaticClass;

    /**
     * @return Nette\Application\IRouter
     */
    public static function createRouter()
    {
        $router = new RouteList;
//                $router[] = new Route('/category/<id>', 'homepage:showCategory');
        $router[] = new Route('<presenter>/<action>[/<id>]', 'Homepage:default');
        return $router;
    }
}