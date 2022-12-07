# Language Assignment 5: Awk

* Author: Tony Nielsen
* Class: CS354 Section 2
* Semester: Fall 2022

## Overview

A simple program to take in a CSV file and output a simple html file with a title, header, and a table containing all entries from the csv file that represent new housing built within the time frame covered by the csv file.

## Included Files

 * CreateHTML.awk - main program
 * BldgPrmtsPublic10-01-2017To10-15-2017.csv - machine readable input file for testing purposes
 * BldgPrmtsPublic10-01-2017To10-15-2017.xlsx - same testing input but in a human readable format
 * index.html - an example of a CreateHTML output file
 * README - this file

## Design

This program is largely built around two BEGIN statements and a single END statement. It is designed in this manner as the first BEGIN statement creates the opening code for the html document, while the second handles the repetitive line-by-line search of the CSV file. Lastly, the END statement adds the last bit of code to complete the html file and ends the execution of the program.

I would have liked to have been able to have completed all execution and search within just a single BEGIN statement, however, I was never able to make that work quite correctly as the search through the csv file would have outputed as many html openings as lines that it searched, thus effectively creating a new html document for each line searched. This I tried to combat with boolean flag values to set to 1 and then not to print the beginnings after those flags changed but it was impossible in my testing to keep a global value incrementing and not to have it be reset by the loop.

In the end, I settled for the arrangement that is present currently as this would enable looping as well as static performance in the same program, just isolated from each other.
 
## Testing

I tested the individual components in a few ways while I was working, firstly to make sure that the delineated parsing of the csv worked correctly, then I moved on to the filter for only the newly built structures, and lastly, I tested the piping and the html output. These tests were incremental and piecemeal as I slowly got a grasp of what Awk was and what its capabilities were.

My tests were not always successful, however, through trial and error, I finally concluded, that while perhaps not particularly aesthetically pleasing, the program was successful at its task.

## Reflection

Overall I very much expected to struggle with this assignment, as I had struggled with the previous assignments. While Awk was certainly different, its functionality was very well documented, and with that and the documentation around html it was quite easy to troubleshoot when things weren't working quite correctly.

I spent quite a bit of testing by hand using several implementations before settling on the one that I finally did. And while I would have liked to get all of the code within one Begin statement, the solution I ended with was the only viable one for the way that I was reading through the data.

## Compiling and Using

To compile and run the program, execute the following command in the main project directory:

gawk -f CreateHTML [inputfile.csv] > [output.html]

Where inputfile.csv is the csv file to be searched (for testing I used BldgPrmtsPublic10-01-2017To10-15-2017.csv which is included in the main project directory) and output.html is the file that the html code will be written to (in my case I always wrote to index.html)

After this command is run an html file of a user-specified name will be produced, which will contain the converted and filtered table.