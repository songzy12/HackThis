<https://defendtheweb.net/playground/planet-bid>

## Planet Bid

### Admin

From the following two pages:

- <https://defendtheweb.net/extras/playground/planetbid/planetbid/account.php?admin>
- <https://defendtheweb.net/extras/playground/planetbid/top10.html>

We can know the password for `admin` is `letmein`.

- Member db: <https://defendtheweb.net/extras/playground/planetbid/planetbid/view.php?members&1=user&2=email>
- Bid db: <https://defendtheweb.net/extras/playground/planetbid/planetbid/view.php?bids>

### Buyer Account

From the member db, we know the user id for `Revoked.Mayhem` is 31.

Then from the bid db, we know the buyer id of seller id 31 is 11. Also, the bid is £1.32.

31	11	Dr Pepper 3ltr RARE	£1.32

Then from the member db, we know the info for user id 11:

- id: `11`
- user: `nemisis`
- email: `jfelliot@mail.com`

### Buyer Password

Then we change the member db url: <https://defendtheweb.net/extras/playground/planetbid/planetbid/view.php?members&1=user&2=pass>.

We have: 11	nemisis	742929dcb631403d7c1c1efad2ca2700

Then we want to find the original password whose md5 hash is `742929dcb631403d7c1c1efad2ca2700`: `chicken`.

<https://md5.gromweb.com/?md5=742929dcb631403d7c1c1efad2ca2700>

## Email Beta

<https://defendtheweb.net/extras/playground/planetbid/email_beta/>

Then we can use username `jfelliot` and password `chicken` to login.

## Safe Transfer

<https://defendtheweb.net/extras/playground/planetbid/safetransfer/login.php?forgot>

Forget password by `nemisis` and `jfelliot@mail.com`.

Then we can have:
> Username: nemisis
> Password: i.am.awesome

Then just send amount `1.32` to account `64957746`.

## Reference

<https://alexandervoidstar.wordpress.com/2015/11/01/hackthis-real-level-4/>
