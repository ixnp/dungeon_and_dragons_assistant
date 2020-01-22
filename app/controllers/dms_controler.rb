class DmsController < ApplicationController
    def new
        @dm = Dm.new
    end 
end