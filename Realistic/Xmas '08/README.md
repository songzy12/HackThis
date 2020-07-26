<https://defendtheweb.net/playground/xmas08>

## SQL Injection

When we submit the letter, we would be directed to <https://defendtheweb.net/extras/playground/xmas08/mod.php?submit>.

Then try to access <https://defendtheweb.net/extras/playground/xmas08/mod.php>, we would be at a login page.

Use SQL injection: `' or 1=1` for both username and password. We can then open an edition page.

Note the main page is at: <https://defendtheweb.net/extras/playground/xmas08/index.php>.

Thus we can open the file `index.php`, and fill in what is in the source code of `https://defendtheweb.net/extras/playground/xmas08/xmas_new.html`.

## Reference

<https://alexandervoidstar.wordpress.com/2015/11/08/hackthis-real-level-xmas/>
