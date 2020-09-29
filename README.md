# README

Build the Docker services: `docker-compose build`

Start the Docker services: `docker-compose up`

Once the Docker containers are running, navigate to http://localhost:3001/players to view the main player statistics page.
1. Upload your JSON data file, or use the `rushing.json` file located in the root directory
2. Click on Import JSON to load the data

# Features

* Player search will filter for substrings of any given player name
* Column headers Total Rushing Yards, Total Rushing Touchdowns, and Longest Rush can be clicked to sort by order ascending
  * clicking on the same header will reorder that column in descending order
* The filtered data can be exported by the Export CSV button
