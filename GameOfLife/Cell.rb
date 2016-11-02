class Cell
	attr_reader :state
	def initialize(state, neighbours)
	    @state = state # either 1 or 0 for alive or dead
	    @neighbours = neighbours # an array that represents the surrounding cells
	end

	def regenerate
	    totalcells = @neighbours.reduce(0) {|cells, neighbour| cells + neighbour}

	    if @state == 1
	    	(totalcells == 2 || totalcells == 3) ? @state = 1 : @state = 0
	    else
	    	(totalcells == 3) ? @state = 1 : @state = 0
	    end
	end
end