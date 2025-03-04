# random_renamer
## Script made for client, inspired by  [gfycat](https://github.com/HeartoLazor/gfycat_name_generator), but made to be run locally on any Windows using Powershell.



A script that renames a bunch of files inside ./input folder, with random quirky names (separated as adjective, verb, noun so final name of each will be "\<adjective> \<verb> \<noun>.png", such as "fierce punching turtle.png")



### Assumptions
- Files amount doesnt exceed 10,000\
 and none of the files have names that look like this "TEMP\<numbers>"
- Where \<numbers> starts from "00001" to "99999"
- *./input* folder contains sample images
- *list.csv* contains the random words by column
- *used.csv* is mainly used to ensure unique namings


