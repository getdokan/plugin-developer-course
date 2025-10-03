# Debugging Tools and Configuration

Complete guide for debugging WordPress and PHP applications using Laravel Herd.

---

## Table of Contents

1. [WordPress Debugging Plugins](#wordpress-debugging-plugins)
2. [PHP Debug with VSCode](#php-debug-configuration-for-vscode)
3. [PHP Debug with PhpStorm](#php-debug-configuration-for-phpstorm)
4. [Additional Resources](#additional-resources)

---

## WordPress Debugging Plugins

Essential plugins for WordPress development and debugging:

- **[User Switching](https://wordpress.org/plugins/user-switching/)** - Instantly switch between user accounts in WordPress for testing different user roles and permissions
- **[Query Monitor](https://wordpress.org/plugins/query-monitor/)** - Debug database queries, hooks, conditionals, HTTP requests, and more with detailed performance insights
- **[WP Crontrol](https://wordpress.org/plugins/wp-crontrol/)** - View and control WP-Cron jobs and schedules directly from the WordPress admin
- **[WP Console](https://wordpress.org/plugins/wp-console/)** - Run WordPress and PHP code directly from your browser console for quick debugging
- **[WP Mail Logging](https://wordpress.org/plugins/wp-mail-logging/)** - Log and view all emails sent through WordPress to debug email delivery issues

---

## PHP Debug Configuration for VSCode

### Prerequisites

- Laravel Herd installed
- Visual Studio Code installed
- Basic understanding of Xdebug

### Step 1: Configure Xdebug in php.ini

Modify the `php.ini` file for your PHP version in `~/Library/Application Support/Herd/config/php/` folder.

Example for PHP 8.1 (`~/Library/Application Support/Herd/config/php/php81.ini`):

```ini
pcre.jit=0
output_buffering=4096
upload_max_filesize=200M
post_max_size=2000M
memory_limit=-1
auto_prepend_file=/Applications/Herd.app/Contents/Resources/valet/dump-loader.php
extension=/Applications/Herd.app/Contents/Resources/herd-ext/herd-81-arm64.so
zend_extension=/Applications/Herd.app/Contents/Resources/xdebug/xdebug-81-arm64.so
xdebug.mode=debug,develop
xdebug.start_with_request=yes
xdebug.start_upon_error=yes
```

**Note**: Adjust the paths according to your PHP version (php81, php82, php83).

See the [Laravel Herd Xdebug documentation](https://herd.laravel.com/docs/macos/debugging/xdebug) for more details.

### Step 2: Install PHP Debug Extension

Install the [PHP Debug extension](https://marketplace.visualstudio.com/items?itemName=xdebug.php-debug) for VSCode.

### Step 3: Create Launch Configuration

Create a `.vscode/launch.json` file in your workspace root:

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Listen for Xdebug",
            "type": "php",
            "request": "launch",
            "port": 9003,
            "pathMappings": {
                "/absolute/path/to/your/project": "${workspaceFolder}"
            },
            "log": true
        }
    ]
}
```

**Replace** `/absolute/path/to/your/project` with your actual project path.

**Example**:
```json
"pathMappings": {
    "/Users/mahbub/Development/Projects/my-project": "${workspaceFolder}"
}
```

### Step 4: Start Debugging

1. Set breakpoints in your PHP code (click in the gutter next to line numbers)
2. Press `F5` or click **Run > Start Debugging**
3. VSCode will start listening for Xdebug connections
4. Access your site in the browser
5. VSCode should pause at your breakpoints

---

## PHP Debug Configuration for PhpStorm

### Prerequisites

- Laravel Herd installed
- PhpStorm installed
- Basic understanding of Xdebug

### Step 1: Configure Xdebug in php.ini

Modify the `php.ini` file for your PHP version in `~/Library/Application Support/Herd/config/php/` folder.

Example for PHP 8.1 (`~/Library/Application Support/Herd/config/php/php81.ini`):

```ini
pcre.jit=0
output_buffering=4096
upload_max_filesize=200M
post_max_size=2000M
memory_limit=-1
auto_prepend_file=/Applications/Herd.app/Contents/Resources/valet/dump-loader.php
extension=/Applications/Herd.app/Contents/Resources/herd-ext/herd-81-arm64.so
zend_extension=/Applications/Herd.app/Contents/Resources/xdebug/xdebug-81-arm64.so
xdebug.mode=debug,develop
xdebug.start_with_request=yes
xdebug.start_upon_error=yes
```

**Note**: Adjust the paths according to your PHP version (php81, php82, php83).

See the [Laravel Herd Xdebug documentation](https://herd.laravel.com/docs/macos/debugging/xdebug) for more details.

### Step 2: Configure PHP Interpreter in PhpStorm

1. Open **PhpStorm > Settings** (or **Preferences** on Mac)
2. Navigate to **PHP**
3. Click the **...** button next to **CLI Interpreter**
4. Click **+** to add a new interpreter
5. Select **Other Local...**
6. Set the PHP executable path:
   - For PHP 8.1: `/Users/YOUR_USERNAME/Library/Application Support/Herd/bin/php81`
   - For PHP 8.2: `/Users/YOUR_USERNAME/Library/Application Support/Herd/bin/php82`
   - For PHP 8.3: `/Users/YOUR_USERNAME/Library/Application Support/Herd/bin/php83`
7. PhpStorm should automatically detect Xdebug
8. Click **OK** to save

### Step 3: Configure Debug Settings

1. Go to **PhpStorm > Settings > PHP > Debug**
2. Set the following:
   - **Xdebug port**: `9003` (default)
   - ✅ Check **Can accept external connections**
   - ✅ Check **Break at first line in PHP scripts** (for initial testing, can disable later)
   - ✅ Check **Force break at first line when no path mapping specified**
   - ✅ Check **Force break at first line when a script is outside the project**
3. Click **OK**

### Step 4: Configure Server (for WordPress/Web Projects)

1. Go to **PhpStorm > Settings > PHP > Servers**
2. Click **+** to add a new server
3. Configure:
   - **Name**: Your project name (e.g., `my-project.test`)
   - **Host**: Your Herd domain (e.g., `my-project.test`)
   - **Port**: `80` (or `443` for HTTPS)
   - **Debugger**: `Xdebug`
   - ✅ Check **Use path mappings**
   - Map your project root to the absolute server path:
     - **Local path**: `/Users/YOUR_USERNAME/Herd/my-project`
     - **Absolute path on server**: `/Users/YOUR_USERNAME/Herd/my-project`
4. Click **OK**

### Step 5: Create Debug Configuration

1. Click **Run > Edit Configurations...**
2. Click **+** and select **PHP Web Page**
3. Configure:
   - **Name**: Debug My Project
   - **Server**: Select the server you created in Step 4
   - **Start URL**: `/` (or your starting page)
4. Click **OK**

### Step 6: Start Debugging

1. Set breakpoints in your PHP code (click in the gutter next to line numbers)
2. Click the **Listen for PHP Debug Connections** button (phone icon) in the toolbar
3. Start debugging:
   - **Option A**: Click **Run > Debug 'Debug My Project'**
   - **Option B**: Install the [Xdebug helper browser extension](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc) and enable debugging in your browser
4. Access your site in the browser
5. PhpStorm should pause at your breakpoints

### Troubleshooting

#### Xdebug Not Detected

- Verify Xdebug is installed: Run `php -v` in terminal (should show "with Xdebug")
- Restart Herd after modifying php.ini
- Restart PhpStorm

#### Breakpoints Not Working

- Ensure the "Listen for PHP Debug Connections" icon is active (green)
- Check that port 9003 is not blocked by firewall
- Verify path mappings in Server configuration
- Check PhpStorm's Event Log for Xdebug connection messages

#### Path Mapping Issues

- Make sure local path exactly matches your project directory
- Absolute path should be the same for Herd local development
- Check for case-sensitivity in paths

### Useful PhpStorm Shortcuts

| Action | Mac | Windows/Linux |
|--------|-----|---------------|
| Set/Remove Breakpoint | `Cmd + F8` | `Ctrl + F8` |
| Resume Program | `Cmd + Option + R` | `F9` |
| Step Over | `F8` | `F8` |
| Step Into | `F7` | `F7` |
| Step Out | `Shift + F8` | `Shift + F8` |
| Evaluate Expression | `Option + F8` | `Alt + F8` |

---

## Additional Resources

### Documentation

- [Laravel Herd Documentation](https://herd.laravel.com/docs) - Official Herd documentation
- [Xdebug Documentation](https://xdebug.org/docs/) - Complete Xdebug reference

### IDE Guides

- [VSCode PHP Debug Guide](https://marketplace.visualstudio.com/items?itemName=xdebug.php-debug) - VSCode extension documentation
- [PhpStorm Xdebug Guide](https://www.jetbrains.com/help/phpstorm/configuring-xdebug.html) - Official PhpStorm debugging guide

### Browser Extensions

- [Xdebug Helper for Chrome](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc) - Enable/disable Xdebug from browser
- [Xdebug Helper for Firefox](https://addons.mozilla.org/en-US/firefox/addon/xdebug-helper-for-firefox/) - Firefox version

### WordPress Debugging

- [WordPress Debugging](https://wordpress.org/documentation/article/debugging-in-wordpress/) - Official WordPress debugging guide
- [Query Monitor Documentation](https://querymonitor.com/docs/) - Advanced WordPress debugging
