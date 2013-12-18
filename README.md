snippet-cheatsheet-generator
============================

Generates HTML cheat sheets for Sublime text snippets.

This is a simple script for my own use. I wrote it because I got tired of not knowing which snippets were actually available for me to use. I wanted a file I could keep on my desk (real or virtual) to refer to as I wrote code.

Usage
-----

0. `gem install nokogiri`
1. Open `snippet-lister.rb`
2. Edit OUTPUT_FILE to contain the name of the .html file to output.
3. Edit PATH_TO_SCAN to point to the path where your *.sublime-snippet files are 
4. `ruby snippet-lister.rb`

Improvements That Should Obviously Be Made
------------------------------------------

If I ever revisit this, I'll add these. Or you can do it. Yay!

1. Should take command-line arguments to specify the output file & path to scan
2. If you don't supply the path to scan, it should find your Sublime snippets automatically and let you choose the ones to print. Finding Sublime snippets automatically will probably be a bit of a PITA because of cross-platform issues, I assume.
3. Should prompt before overwriting .html output file, if it exists (or it should choose a unique filename?)
4. Should cure cancer/AIDS/ennui/heartburn.


