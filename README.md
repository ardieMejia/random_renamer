# random_renamer
## _The Last Markdown Editor, Ever_

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

A script that renames a bunch of files inside ./input folder, with random quirky names (separated as adjective, verb, noun so final name of each will be<adjective> <verb> <noun>, such as "fierce punching turtle.png")


### AssumptionsL
- Files amount doesnt exceed 10,000\
 and none of the files have names that look like this "TEMP\<numbers>"
- Where \<numbers> starts from "00001" to "99999"
- *./input* folder contains sample images
- *list.csv* contains the random words by column
- *used.csv* is mainly used to ensure unique namings


