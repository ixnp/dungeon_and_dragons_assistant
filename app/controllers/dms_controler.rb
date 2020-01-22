class DmsController < ApplicationController
    
    # TODO: Test out Polymorphic Associatin, build form
    def new
        @dm = Dm.new
    end
  
end