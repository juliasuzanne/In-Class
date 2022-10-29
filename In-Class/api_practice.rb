require "http"
require "tty-prompt"

prompt = TTY::Prompt.new

continue = true
while continue == true
  response = HTTP.get("https://api.fisenko.net/v1/quotes/en/random")
  quote = response.parse(:json)
  text = quote["text"]
  name = quote["author"]["name"]
  answer = prompt.select("Generate inspiring quote?", %w(Yes No))
  if answer == "Yes"
    puts text
    puts "--#{name}"
  else
    continue = false
  end
end
