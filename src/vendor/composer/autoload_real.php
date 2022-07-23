<?php

// autoload_real.php @generated by Composer

class ComposerAutoloaderInita21cd7fb35cc9f51244a4a0e3cc3cb77
{
    private static $loader;

    public static function loadClassLoader($class)
    {
        if ('Composer\Autoload\ClassLoader' === $class) {
            require __DIR__ . '/ClassLoader.php';
        }
    }

    /**
     * @return \Composer\Autoload\ClassLoader
     */
    public static function getLoader()
    {
        if (null !== self::$loader) {
            return self::$loader;
        }

        require __DIR__ . '/platform_check.php';

        spl_autoload_register(array('ComposerAutoloaderInita21cd7fb35cc9f51244a4a0e3cc3cb77', 'loadClassLoader'), true, true);
        self::$loader = $loader = new \Composer\Autoload\ClassLoader(\dirname(__DIR__));
        spl_autoload_unregister(array('ComposerAutoloaderInita21cd7fb35cc9f51244a4a0e3cc3cb77', 'loadClassLoader'));

        require __DIR__ . '/autoload_static.php';
        call_user_func(\Composer\Autoload\ComposerStaticInita21cd7fb35cc9f51244a4a0e3cc3cb77::getInitializer($loader));

        $loader->register(true);

        $includeFiles = \Composer\Autoload\ComposerStaticInita21cd7fb35cc9f51244a4a0e3cc3cb77::$files;
        foreach ($includeFiles as $fileIdentifier => $file) {
            composerRequirea21cd7fb35cc9f51244a4a0e3cc3cb77($fileIdentifier, $file);
        }

        return $loader;
    }
}

/**
 * @param string $fileIdentifier
 * @param string $file
 * @return void
 */
function composerRequirea21cd7fb35cc9f51244a4a0e3cc3cb77($fileIdentifier, $file)
{
    if (empty($GLOBALS['__composer_autoload_files'][$fileIdentifier])) {
        $GLOBALS['__composer_autoload_files'][$fileIdentifier] = true;

        require $file;
    }
}
