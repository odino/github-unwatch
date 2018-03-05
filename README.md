# github-unwatch

Unsubscribe from watching a whole bunch of github repositories. This is a simple
shell script that automates something that'd be tedious to do manually...

## Usage

Set these env variables:

```
GH_USER: username
GH_TOKEN: access token for the github API
GH_PAGES: no. of pages in the subscription API, you can find it via curl -H "Authorization: token $GH_TOKEN" https://api.github.com/users/$GH_USER/subscriptions | grep Link
```

Then generate a list of all repos you're subscribed to:

```
$ ./github-unwatch.sh list_repos > list.txt
```

Examine the list and **delete repos you still want to watch** -- everything within
the list will be un-watched.

Now run the `unsubscribe` command and watch it free your GH inbox:

```
$ cat list.txt | ./github-unwatch.sh unsubscribe
Unsubscribed from:
 - odino/some
 - odino/thing
 - odino/else
done.
```
