### WordPress Plugins for Debugging

https://wordpress.org/plugins/user-switching/
https://wordpress.org/plugins/query-monitor/
https://wordpress.org/plugins/wp-crontrol/
https://wordpress.org/plugins/wp-console/
https://wordpress.org/plugins/wp-mail-logging/

### PHP Debug Configuration for VSCode using the Laravel Herd

- Modify the `php.ini` file as per your `PHP` version in `~/Library/Application\ Support/Herd/config/php/` folder to configure the *xdebug*. The example file for the *php-8.1* as follows:

    ```ini
    pcre.jit=0
    output_buffering=4096
    upload_max_filesize=200M
    post_max_size =2000M
    memory_limit=-1
    auto_prepend_file=/Applications/Herd.app/Contents/Resources/valet/dump-loader.php
    extension=/Applications/Herd.app/Contents/Resources/herd-ext/herd-81-arm64.so
    zend_extension=/Applications/Herd.app/Contents/Resources/xdebug/xdebug-81-arm64.so
    xdebug.mode=debug,develop
    xdebug.start_with_request=yes
    xdebug.start_upon_error=yes
    ```
    See the [Laravel herd](https://herd.laravel.com/docs/macos/debugging/xdebug) documentation.

- Install the [php debug](https://marketplace.visualstudio.com/items?itemName=xdebug.php-debug) extension.
- Create `.vscode/launch.json` file in your workspace and configure as follows:
    ```json
    {
        // Use IntelliSense to learn about possible attributes.
        // Hover to view descriptions of existing attributes.
        // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
        "version": "0.2.0",
        "configurations": [
            {
                "name": "Listen for Xdebug (core-dokan)",
                "type": "php",
                "request": "launch",
                "port": 9003,
                "pathMappings": {
                    "absoulate-root-path-of-your-project ": "${workspaceFolder}"
                },
                "log": true
            }
        ]

    }
    ```
    >  For example absulate root path: **/Users/mahbub/Development/Projects/core-dokan**
