class PublicController < ApplicationController
  def index
    @dogs = Dog.count
    @fleas = Flea.count
    @circuses = Circus.count
  end
end
