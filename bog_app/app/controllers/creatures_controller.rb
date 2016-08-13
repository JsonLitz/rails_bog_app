class CreaturesController < ApplicationController

  def index
    @creatures = Creature.all
    render :index
  end

  def new
    @creature = Creature.new
    render :new
  end

  def create
    # whitelist params and save them to a variable
    creature_params = params.require(:creature).permit(:name, :description)
    # create a new creature from `creature_params`
    creature = Creature.new(creature_params)
    # if creature saves, redirect to route that displays
    # ONLY the newly created creature
    if creature.save
      redirect_to creature_path(creature)
      # redirect_to creature_path(creature) is equivalent to:
      # redirect_to "/creatures/#{creature.id}"
    end
  end

  def show
    # get the creature id from the url params
    creature_id = params[:id]
    # use `creature_id` to find the creature in the database
    # and save it to an instance variable
    @creature = Creature.find_by_id(creature_id)
    # render the show view (it has access to instance variable)
    render :show
  end

  def edit
    # get the creature id from the url params
    creature_id = params[:id]
    # use `creature_id` to find the creature in the database
    # and save it to an instance variable
    @creature = Creature.find_by_id(creature_id)
    # render the edit view (it has access to instance variable)
    render :edit
  end

  def update
       # get the creature id from the url params
       creature_id = params[:id]
       # use `creature_id` to find the creature in the database
       # and save it to an instance variable
       creature = Creature.find_by_id(creature_id)
       # whitelist params and save them to a variable
       creature_params = params.require(:creature).permit(:name, :description)
       # update the creature
       creature.update_attributes(creature_params)
       # redirect to show page for the updated creature
       redirect_to creature_path(creature)
       # redirect_to creature_path(creature) is equivalent to:
       # redirect_to "/creatures/#{creature.id}"
     end
   end
