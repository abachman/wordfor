# Wordfor

A simple command line thesaurus based on the
[WordNet](http://wordnet.princeton.edu/) database. It can help you get other
**word**s **for** things, which can be particularly useful if your dayjob
requires frequent naming of things.

To "bulk up" the results, I'm using a traversal of the input word's [hyponyms
and hypernyms](http://en.wikipedia.org/wiki/Hyponymy). Sometimes these look a
lot like synonyms, sometimes they get a little weird.

## Installation

Install the gem by running:

    $ gem install wordfor

This gem requires Ruby 1.9.2 or higher.

## Usage

the command:

    $ wordfor list

prints:

    noun:
      synonyms:
        inclination, lean, leaning, tilt, listing
      hyponyms:
        agenda, agendum, order of business, order of the day, order book, order paper,
        a-list, bibliography, bill, bill of entry, bill of goods, bill of fare,
        card, carte, carte du jour, menu, a la carte, prix fixe, table d'hote,
        playbill, black book, blacklist, shitlist, calendar, docket, calorie chart,
        canon, catalog, catalogue, discography, library catalog, library catalogue,
        card catalog, card catalogue, parts catalog, parts catalogue, seed catalog,
        seed catalogue, character set, alphabet, armenian, armenian alphabet, latin
        alphabet, roman alphabet, hebraic alphabet, hebrew alphabet, hebrew script,
        greek alphabet, cyrillic, cyrillic alphabet, arabic alphabet, phonetic
        alphabet, sound alphabet, visible speech, finger alphabet, manual alphabet,
        alphanumeric characters, alphanumerics, checklist, class list, honours list,
        codex, contents, table of contents, corrigenda, credits, criminal record,
        record, directory, subdirectory, distribution list, enumeration, numbering, faq,
        free list, grocery list, shopping list, hit list, hit parade, index,
        concordance, key, key word, key, inventory, stock list, parts inventory,
        mailing list, flag, masthead, computer menu, menu, drop-down menu, cascading
        menu, hierarchical menu, submenu, necrology, play list, playlist, portfolio,
        posting, price list, push-down list, push-down stack, stack, queue, push-down
        queue, roll, roster, batting order, card, lineup, death-roll, muster roll,
        church roll, rota, waiting list, schedule, network programming, timetable,
        timetable, shopping list, grocery list, short list, shortlist, sick list,
        slate, ticket, standing, wish list
      hypernyms:
        position, spatial relation, relation, abstract entity, abstraction, entity,
        database, info, information, content, message, subject matter, substance,
        communication
    verb:
      synonyms:
        name, number, heel, lean
      hyponyms:
        itemise, itemize, inventory, stock-take, take stock, empanel, impanel, index,
        cross-index, blacklist, post
      hypernyms:
        enumerate, itemise, itemize, recite, identify, name, denote, refer, intend, mean,
        signify, stand for, angle, lean, slant, tilt, tip, bend, flex, change form,
        change shape, deform, change, move, register, enter, put down, record,
        preserve, save, hold on, keep, have, have got, hold


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
