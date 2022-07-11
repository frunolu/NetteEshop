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
        $router[] = new Route('prihlaseni/', 'Sign:in');
        $router[] = new Route('/category', 'Category:showCategory');
        $router[] = new Route('/category/<id>', 'Category:showCategory');
        $router[] = new Route('/product', 'Product:detail');
        $router[] = new Route('<presenter>/<action>[/<id>]', 'Homepage:default');
        $router[] = new Route('<presenter>/<action>[/<id>]', ':admin:Homepage:default');
                return $router;
    }
}
