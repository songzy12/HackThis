<https://defendtheweb.net/playground/library-gateway>

Click into the login page <https://defendtheweb.net/extras/playground/real/2/login.php> and check the source code:

```
				var username= document.getElementById('username').value;
				var password= document.getElementById('password').value;
				URL= "members/" + username + " " + password + ".htm";
				path = URL;
				document.getElementById("status").innerHTML = 'Checking details...';

				req = getreq();
				req.onreadystatechange = exists;
				req.open("get", path, true);
				req.send(null);     
```

Then we can just open <https://defendtheweb.net/extras/playground/real/2/members/>, and see:

```
Index of /members
Name	Last modified	Size	Description
Parent Directory	 	-	 
anna god.htm	2011-03-14 20:20	0.0K	 
dave fish_r_friends.htm	2011-03-14 20:21	0.0K	 
jack kack.htm	2011-03-11 15:27	0.0K	 
librarian sweetlittlebooks.htm	2011-03-15 08:32	0.0K	 
luke 9312.htm	2011-03-12 18:30	0.0K	 
```

So we can get some pair of username / password:
- anna god
- jack kack
- dave fish_r_friends
- librarian sweetlittlebooks
- luke 9312

Then we can just log in with username `librarian` and password `sweetlittlebooks`.

That's it!
