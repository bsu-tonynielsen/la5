
 # Author: Tony Nielsen
 # Date: 12/6/2022
 # Description: Program to take in a CSV file of building permits and output a file "index.html"
 #      This html file will then contain a table of outputed buildings that represent all newly
 #      constructed housing developments within the area during the period covered within the csv file.

#Creates the opeing lines for the HTML output
BEGIN{
    #Creates the first headers and the title of the file
    printf("<html>\n<head>\n<title>Boise Realtor</title>\n")
    #Creates the style changes within the html table including some rudimentary color as well as border styling
    printf("<style>\ntable,\ntr,\nth,\ntd {\nborder: 1px solid black;\nborder-collapse: collapse;\n}\nth:nth-child(even),\ntd:nth-child(even) {\nbackground-color: #FFF8EC\n}\n</style>\n")
    #Creates the heading within the webpage
    printf("</head>\n<body>\n<h1>Boise Realtor</h1>\n")
    #Creates the table headers
    printf("<table>\n<tr>\n<th>Date</th>\n<th>Subdivision Name</th>\n<th>Lot</th>\n<th>Block</th>\n<th>Value</th>\n</tr>\n")
}

#Creates a comma delineated parser for the csv file with usage including outputing certain entries for each row
BEGIN { FS = "," }
{
    #Prevents numbers usage involving commas from creating multiple row entries in the output
    FPAT = "([^,]*)|(\"[^\"]+\")"
    #Filters the data to only that of which matches the relevant data, and excludes any alterations to current structures
    if(match($2,"BP") != 0 && match(tolower($3), "single family dwelling") != 0 && match(tolower($3), "to") == 0 && match(tolower($3), "on") == 0)
    {   
        #Takes in certain data from the csv row and puts them into variables
        date = $1
        subdiv = $5
        lot = $6
        block = $7
        value = $8
        #Puts the variables into the table using the HTML syntax and outputs that to the index file
        printf("<tr>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n<td>%s</td>\n</tr>\n", date, subdiv, lot, block, value)
        }
}

#Outputs the ending piece of the HTML output
END {
    printf("</table>\n</body>\n</html>")
}