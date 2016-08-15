class CreaturesController < ApplicationController
  def index
    @creatures = Creature.all
    render :index
  end

  def create
    creature_params = params.require(:creature).permit(:name, :description)
    creature = Creature.new(creature_params)
    if creature.save
      redirect_to creatures_path
    end
  end

  def new
    @creature = Creature.new
    render :new
  end

  def show
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)
    render :show
  end

  def edit
    creature_id = params[:id]
    @creature = Creature.find_by_id(creature_id)
    render :show    
  end

end
