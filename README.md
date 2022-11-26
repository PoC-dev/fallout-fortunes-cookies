This is a collection of texts from the
[Fallout games series](https://en.wikipedia.org/wiki/Fallout_(series)) loading
screens. They have been reformatted to be used with the
[fortune](https://en.wikipedia.org/wiki/Fortune_(Unix)) UNIX command.

## Source
The guys from [Fallout Fandom](https://fallout.fandom.com) did a great job in
extracting the data from the game files and formatting them in HTML on the
individual [Loading Screens](https://fallout.fandom.com/wiki/Loading_screen)
sub-pages for the different Fallout Releases.

I also incorporated the strings from the
[Fallout 76 Fortune Teller Machine](https://fallout.fandom.com/wiki/Fortune_teller_machine),
a craftable item for your C.A.M.P.

**Note!** The texts have been copied from commercial games by the community of
*Fallout Fandom*. This doesn't indicate that the texts are free of copyright.

The rest was some... *magic* with
[vim](https://en.wikipedia.org/wiki/Vim_(text_editor)),
[grep](https://en.wikipedia.org/wiki/Grep), and
[sed](https://en.wikipedia.org/wiki/Sed).

## How to use (on Debian based systems)
* Install fortune.
    apt-get install fortune

* Create a local directory for the Fallout fortunes.
    mkdir -p /usr/local/share/games/fortunes

* Move or copy the Fortunes files to the destination directory.
    mv Fallout* /usr/local/share/games/fortunes

* Create the String index files
    cd /usr/local/share/games/fortunes
    \ls -1 Fallout* |while read FILE; do
        strfile ${FILE} ${FILE}.dat
    done

* Now you can call `fortune` to enjoy a random Fallout bit of wisdom.

**Note!** I'm always using `fortune -c`, because I then will see from which
cookie jar the fortune stems. This is the sole reason why I'm using
*shell-unfriendly* spaces in the file names: So the source jar is displayed
nicely.

If you prefer to have the cookie source at end, you can use grep and sed.
    /usr/games/fortune -c |egrep -v '^%$' |sed '1h;1d;$G'

-- poc@pocnet.net, 2022-11-26
