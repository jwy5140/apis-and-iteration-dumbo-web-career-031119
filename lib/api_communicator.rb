require 'rest-client'
require 'json'
require 'pry'


def get_character_movies_from_api(character)
#make the web request
arr = Array.new
response_string = RestClient.get('http://www.swapi.co/api/people/')
response_hash = JSON.parse(response_string)
  response_hash.each {|x,y|
    if x === "results"
      y.each {|x|
        if x["name"].downcase === character
          x["films"].each {|x|
          z = RestClient.get(x)
          arr.push(JSON.parse(z))
          }
        end
      }
    end
  }
  return arr 

  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
end

def print_movies(films)
  films.each {|x|
    puts x["title"]  
  }
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
