This is a collection of texts from the [Fallout games
series](https://en.wikipedia.org/wiki/Fallout_(series)) loading screens, and
other sources. They have been reformatted to be used with the
[fortune](https://en.wikipedia.org/wiki/Fortune_(Unix)) UNIX command.

### Source
The guys from [Fallout Fandom](https://fallout.fandom.com) did a great job in
extracting the data from the game files and formatting them in HTML on the
individual [Loading Screens](https://fallout.fandom.com/wiki/Loading_screen)
sub-pages for the different Fallout Releases. Same goes for the automatically
generated [fo76-dumps](https://github.com/FWDekker/fo76-dumps). This doesn't
indicate that the texts are free of copyright.

I also incorporated the strings from the [Fallout 76 Fortune Teller
Machine](https://fallout.fandom.com/wiki/Fortune_teller_machine), a craftable
item for your C.A.M.P.

Finally, I added the [Fallout 76 perk
jokes](https://fallout-archive.fandom.com/wiki/Fallout_76_perk_jokes).

The rest was some... *magic* with
[vim](https://en.wikipedia.org/wiki/Vim_(text_editor)),
[grep](https://en.wikipedia.org/wiki/Grep), and
[sed](https://en.wikipedia.org/wiki/Sed).

To lessen manual labour, I'm using files from the *fo76-dumps* to generate the
cookie jars as shown below.

The current *Fallout 76* file has been generated with this sophisticated
command line:
```
tr -d '\r' < LSCR.csv \
  |sed -E -e 's/^"//' -e 's/", "/\t/g' -e 's/"[[:space:]]*$//' -e 's/\\n/ /g' \
  |cut -d$'\t' -f4 \
  |sed -E -e 's/["]{2}/"/g' -e 's/[ ]*$//' \
  |grep -v -e '^Description$' -e '^$' \
  |sed 's/$/\n\%/' \
  |fmt -s -w 80 > 'Fallout 76'
```

The provided perl script `extract-76fortunes.pl` reads from stdin, and writes
to stdout.  Stdin is expected to be the file *wiki.BOOK.wiki* from the releases
of the above repository. Output is a cookie jar file from the contained Fallout
76 Fortune Teller Machine entries.

The current *Fallout 76 Fortune Machine* file has been generated with this
command line:
```
tr -d '\r' < wiki.BOOK.wiki \
  |./extract-76fortunes.pl \
  |fmt -s -w 80 > 'Fallout 76 Fortune Machine'
```

### How to use (on Debian based systems)
* Install fortune.

    `apt-get install fortune`

* Create a local directory for the Fallout fortunes.

    `mkdir -p /usr/local/share/games/fortunes`

* Move or copy the Fortunes files to the destination directory.

    `mv Fallout* /usr/local/share/games/fortunes`

* Create the String index files
```
   cd /usr/local/share/games/fortunes
   \ls -1 Fallout* |grep -v '\.dat$' |while read FILE; do
       strfile "${FILE}" "${FILE}.dat"
   done
```

* Now you can call `fortune` to enjoy a random Fallout bit of wisdom.

**Note!** I'm always using `fortune -c`, because I then will see from which
cookie jar the fortune stems. This is the sole reason why I'm using
*shell-unfriendly* spaces in the file names: So the source jar is displayed
nicely.

If you prefer to have the cookie source at end, you can use grep and sed.

    /usr/games/fortune -c |sed -e '/^%$/d' -e '1h;1d;$G'

-- poc@pocnet.net, 2025-01-12
