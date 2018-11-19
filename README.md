# bookmark Manager

## Requirements:

Initial specification given:

* Show a list of bookmarks
* Add new bookmarks
* Delete bookmarks
* Update bookmarks
* Comment on bookmarks
* Tag bookmarks into categories
* Filter bookmarks by tag
* Users manage their bookmarks

## User stories

```
As a User
So I can view all my stored Bookmarks
I would like to see a list of Bookmarks
```
```
As a User
So I can update my favourite Bookmarks
I would like to be able to add a new Bookmark
```
To see domain model, please see model.png.

Requirements

Install PostgreSQL

To set up the database:

1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql
