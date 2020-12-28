@url = 'https://pokeapi.co/api/v2/pokemon/'
if Pokemon.count == 0 
  NEXT_POKEMON = 1 
else 
  NEXT_POKEMON = Pokemon.last.id + 1
end
TOTAL_POKEMON = HTTParty.get(@url).parsed_response['count']
    
(NEXT_POKEMON..TOTAL_POKEMON).each do |x|
  puts "Creating Pokemon #{x}"
  @pokemon = HTTParty.get(@url + x.to_s).parsed_response
  new_pokeman = Pokemon.create(name: @pokemon['name'], base_experience: @pokemon['base_experience'], id: x)
  new_pokeman.save
end