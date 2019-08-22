class CatsController < ApplicationController

  def index
    @cat = Cat.all
  end

end
