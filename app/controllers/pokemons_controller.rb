class PokemonsController < ApplicationController
  def capture
  		pokemon = Pokemon.find(params[:id])
  	  pokemon.trainer = trainer
  	  pokemon.save
  	  redirect_to root_path
  	end

  def new
    pokemon = Pokemon.new
  end

  def damage
    pokemon = Pokemon.find(params[:id])
    pokemon.health = pokemon.health - 10
    redirect_to trainer_path(pokemon.trainer)

    if (pokemon.health <= 0)
      pokemon.destroy
    redirect_to trainer_path(pokemon.trainer)
    end

    pokemon.save

  end


  def create
   pokemon = Pokemon.new(params.require(:pokemon).permit(:name))
   pokemon.level = 1
   pokemon.health = 100
   pokemon.trainer = trainer
   if pokemon.save
     redirect_to trainer
   else
     flash[:error] = pokemon.errors.full_messages.to_sentence
     redirect_to new_path
   end
 end

end
