<https://defendtheweb.net/playground/foss-login>

## Source Code

```bash
git clone https://gitlab.com/DefendTheWeb/foss-login.git
```

## Database

```mysql
CREATE DATABASE dev;
USE dev;
```

```mysql
DROP TABLE users;
CREATE TABLE users (
        uid  VARCHAR(20),
        username VARCHAR(20),
        password VARCHAR(100),
        email VARCHAR(20),
        reset VARCHAR(20),
        PRIMARY KEY (uid)
);
```

```mysql
INSERT INTO users VALUES ('1','memtash','xxx', 'email.com', 'xxx');
```

```mysql
UPDATE users SET password = 'xxx' WHERE username = 'memtash';
```

## Install PHP

```bash
sudo apt install php libapache2-mod-php php-mysql
```

## Start PHP Server

```bash
php -S 0.0.0.0:3000
```

## SQL Injection

Maybe we can do sql injection here:

```php
        private function reset($user) {
            $st = $this->db->prepare('SELECT `uid`, `username`, `email`
                    FROM users
                    WHERE username = :u');
            $st->execute(array(':u' => $user));
            $row = $st->fetch();

            if ($row) {
```

> A prepared statement can only execute one MySQL query.

## Reference

<https://alexandervoidstar.wordpress.com/category/hackthis-co-uk/>
