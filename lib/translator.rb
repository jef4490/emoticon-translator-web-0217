require "yaml"
require 'pry'

def load_library(lib)
  library = YAML.load_file(lib)
  library_hash = {"get_emoticon" => {}, "get_meaning" => {}}
  #binding.pry
  library.each do |key, values|
    library_hash["get_meaning"][values[1]] = key
    library_hash["get_emoticon"][values[0]] = values[1]
  end
  #binding.pry
  library_hash
end

def get_japanese_emoticon(lib, emoticon)
  library = load_library(lib)
  if library["get_emoticon"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    return library["get_emoticon"][emoticon]
  end
end

def get_english_meaning(lib, emoticon)
  library = load_library(lib)
  if library["get_meaning"][emoticon] == nil
    return "Sorry, that emoticon was not found"
  else
    return library["get_meaning"][emoticon]
  end
end
