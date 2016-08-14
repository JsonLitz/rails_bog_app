class CreaturesController < ApplicationController
  def index
    @creatures = Creatures.all
    render :index
  end
  def new
    @creatures = Creature.new
     render :new
  end

end
