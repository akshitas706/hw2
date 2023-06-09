# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# rails generate model Studio
# added columns in migrate
# rails db:migrate
# rails generate model Movie
# added columns in migrate
# rails db:migrate
# rails generate model Actor
# added columns in migrate
# rails db:migrate
# rails generate model Role
# added columns in migrate
# rails db:migrate



# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

#studio table

studio_new = Studio.new
studio_new["Name"] = "Warner Bros."
studio_new.save

puts "studios: #{Studio.all.count}"


#movies table

studio = Studio.find_by({"Name" => "Warner Bros."})
movie_new = Movie.new
movie_new["title"] = "Batman Begins"
movie_new["release_year"] = "2005"
movie_new["rating"] = "PG-13"
movie_new["studio_id"] = studio["id"]
movie_new.save

studio = Studio.find_by({"Name" => "Warner Bros."})
movie_new = Movie.new
movie_new["title"] = "The Dark Knight"
movie_new["release_year"] = "2008"
movie_new["rating"] = "PG-13"
movie_new["studio_id"] = studio["id"]
movie_new.save

studio = Studio.find_by({"Name" => "Warner Bros."})
movie_new = Movie.new
movie_new["title"] = "The Dark Knight Rises"
movie_new["release_year"] = "2012"
movie_new["rating"] = "PG-13"
movie_new["studio_id"] = studio["id"]
movie_new.save

puts "movies: #{Movie.all.count}"



# actors table

actor_new = Actor.new
actor_new["Name"] = "Christian Bale"
actor_new.save

actor_new = Actor.new
actor_new["Name"] = "Michael Caine"
actor_new.save

actor_new = Actor.new
actor_new["Name"] = "Liam Neeson"
actor_new.save

actor_new = Actor.new
actor_new["Name"] = "Katie Holmes"
actor_new.save

actor_new = Actor.new
actor_new["Name"] = "Gary Oldman"
actor_new.save

actor_new = Actor.new
actor_new["Name"] = "Heath Ledger"
actor_new.save

actor_new = Actor.new
actor_new["Name"] = "Aaron Eckhart"
actor_new.save

actor_new = Actor.new
actor_new["Name"] = "Maggie Gyllenhaal"
actor_new.save

actor_new = Actor.new
actor_new["Name"] = "Tom Hardy"
actor_new.save

actor_new = Actor.new
actor_new["Name"] = "Joseph Gordon-Levitt"
actor_new.save

actor_new = Actor.new
actor_new["Name"] = "Anne Hathaway"
actor_new.save

puts "actors: #{Actor.all.count}"



# roles table

movie_1 = Movie.find_by({"title" => "Batman Begins"})
actor_1 = Actor.find_by({"Name" => "Christian Bale"})
role_new = Role.new
role_new ["movie_id"] = movie_1["id"]
role_new ["actor_id"] = actor_1["id"]
role_new ["character_name"] = "Bruce Wayne"
role_new.save

movie_1 = Movie.find_by({"title" => "Batman Begins"})
actor_2 = Actor.find_by({"name" => "Michael Caine"})
role_new = Role.new
role_new ["movie_id"] = movie_1["id"]
role_new ["actor_id"] = actor_2["id"]
role_new ["character_name"] = "Alfred"
role_new.save

movie_1 = Movie.find_by({"title" => "Batman Begins"})
actor_3 = Actor.find_by({"name" => "Liam Neeson"})
role_new = Role.new
role_new ["movie_id"] = movie_1["id"]
role_new ["actor_id"] = actor_3["id"]
role_new ["character_name"] = "Ra's Al Ghul"
role_new.save

movie_1 = Movie.find_by({"title" => "Batman Begins"})
actor_4 = Actor.find_by({"name" => "Katie Holmes"})
role_new = Role.new
role_new ["movie_id"] = movie_1["id"]
role_new ["actor_id"] = actor_4["id"]
role_new ["character_name"] = "Rachel Dawes"
role_new.save

movie_1 = Movie.find_by({"title" => "Batman Begins"})
actor_5 = Actor.find_by({"name" => "Gary Oldman"})
role_new = Role.new
role_new ["movie_id"] = movie_1["id"]
role_new ["actor_id"] = actor_5["id"]
role_new ["character_name"] = "Commissioner Gordon"
role_new.save

movie_2 = Movie.find_by({"title" => "The Dark Knight"})
actor_1 = Actor.find_by({"name" => "Christian Bale"})
role_new = Role.new
role_new ["movie_id"] = movie_2["id"]
role_new ["actor_id"] = actor_1["id"]
role_new ["character_name"] = "Bruce Wayne"
role_new.save

movie_2 = Movie.find_by({"title" => "The Dark Knight"})
actor_6 = Actor.find_by({"name" => "Heath Ledger"})
role_new = Role.new
role_new ["movie_id"] = movie_2["id"]
role_new ["actor_id"] = actor_6["id"]
role_new ["character_name"] = "Joker"
role_new.save

movie_2 = Movie.find_by({"title" => "The Dark Knight"})
actor_7 = Actor.find_by({"name" => "Aaron Eckhart"})
role_new = Role.new
role_new ["movie_id"] = movie_2["id"]
role_new ["actor_id"] = actor_7["id"]
role_new ["character_name"] = "Harvey Dent"
role_new.save

movie_2 = Movie.find_by({"title" => "The Dark Knight"})
actor_2 = Actor.find_by({"name" => "Michael Caine"})
role_new = Role.new
role_new ["movie_id"] = movie_2["id"]
role_new ["actor_id"] = actor_2["id"]
role_new ["character_name"] = "Alfred"
role_new.save

movie_2 = Movie.find_by({"title" => "The Dark Knight"})
actor_8 = Actor.find_by({"name" => "Maggie Gyllenhaal"})
role_new = Role.new
role_new ["movie_id"] = movie_2["id"]
role_new ["actor_id"] = actor_8["id"]
role_new ["character_name"] = "Rachel Dawes"
role_new.save

movie_3 = Movie.find_by({"title" => "The Dark Knight Rises"})
actor_1 = Actor.find_by({"name" => "Christian Bale"})
role_new = Role.new
role_new ["movie_id"] = movie_3["id"]
role_new ["actor_id"] = actor_1["id"]
role_new ["character_name"] = "Bruce Wayne"
role_new.save

movie_3 = Movie.find_by({"title" => "The Dark Knight Rises"})
actor_5 = Actor.find_by({"name" => "Gary Oldman"})
role_new = Role.new
role_new ["movie_id"] = movie_3["id"]
role_new ["actor_id"] = actor_5["id"]
role_new ["character_name"] = "Commissioner Gordon"
role_new.save

movie_3 = Movie.find_by({"title" => "The Dark Knight Rises"})
actor_9 = Actor.find_by({"name" => "Tom Hardy"})
role_new = Role.new
role_new ["movie_id"] = movie_3["id"]
role_new ["actor_id"] = actor_9["id"]
role_new ["character_name"] = "Bane"
role_new.save

movie_3 = Movie.find_by({"title" => "The Dark Knight Rises"})
actor_10 = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
role_new = Role.new
role_new ["movie_id"] = movie_3["id"]
role_new ["actor_id"] = actor_10["id"]
role_new ["character_name"] = "John Blake"
role_new.save

movie_3 = Movie.find_by({"title" => "The Dark Knight Rises"})
actor_11 = Actor.find_by({"name" => "Anne Hathaway"})
role_new = Role.new
role_new ["movie_id"] = movie_3["id"]
role_new ["actor_id"] = actor_11["id"]
role_new ["character_name"] = "Selena Kyle"
role_new.save

puts "roles: #{Role.all.count}"






# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""



# Query the movies data and loop through the results to display the movies output.
# TODO!

all_movies = Movie.all
#puts all_movies.inspect

for movie in all_movies
    title = movie["title"]
    release_year = movie["release_year"]
    rating = movie["rating"]
    studio = Studio.find_by({"id" => movie["studio_id"]})
    #puts studio.inspect
    studio_name = studio["Name"]
    printf "%-30s %-10s %-10s %s\n", title, release_year, rating, studio_name
    # puts "#{title} #{release_year} #{rating} #{studio_name}"
end




# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

all_roles = Role.all
#puts all_roles.inspect

for role in all_roles
    movie = Movie.find_by ({"id" => role["movie_id"]})
    movie_title = movie["title"]

    actor = Actor.find_by ({"id" => role["actor_id"]})
    actor_name = actor["Name"]

    character_name = role ["character_name"]
    printf "%-30s %-30s %s\n", movie_title, actor_name, character_name
    # puts "#{movie_title} #{actor_name} #{character_name}"
end 