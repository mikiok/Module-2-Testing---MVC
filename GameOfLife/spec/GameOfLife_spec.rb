require_relative "spec_helper"
require_relative "../Cell"
require_relative "../Board"

describe Cell do 

    describe '#regenerate' do
        it "regenerates a live cell from a live cell if it has 2 or 3 neighbours" do
            cell1 = Cell.new(1, [0,0,0,0,0,0,1,1])
            expect(cell1.regenerate).to eq(1)
        end
    end

    describe '#regenerate' do
        it "regenerates a dead cell from a dead cell if it has 0 neighbours" do
            cell1 = Cell.new(0, [0,0,0,0,0,0,0,0])
            expect(cell1.regenerate).to eq(0)
        end
    end

    describe '#regenerate' do
        it "regenerates a live cell from a live cell if it has 4 neighbours" do
            cell1 = Cell.new(0, [0,1,0,1,0,1,0,1])
            expect(cell1.regenerate).to eq(0)
        end
    end
end

describe Board do

    before :each do
        @board = Board.new "testing_board.txt"
    end

    describe '#load_grid?' do
        it "load the board from a non existing file. Should return false" do
            expect(@board.load_grid? "board.txt").to be false
        end
    end

    describe '#load_grid?' do
        it "load the board from an existing file. Should return true" do
            expect(@board.load_grid? "saved_board.txt").to be true
        end
    end

    describe "#empty_grid?" do
        it "Check if the grid has the same value in every item (should return true)" do
            board = Board.new "empty_board.txt"
            expect(board.empty_grid?).to be true
        end
    end

    describe "#empty_grid?" do
        it "Check if the grid has the same value in every item (should return false)" do
            expect(@board.empty_grid?).to be false
        end
    end

    describe "#horizontal_neighbours" do
        it "look for the horizontal neighbours of a given position(cell)" do
            expect(@board.horizontal_neighbours(@board.get_states, 1, 1)).to eq([1,1])
        end
    end

    describe "#vertical_neighbours" do
        it "look for the vertical neighbours of a given position(cell)" do
            expect(@board.vertical_neighbours(@board.get_states, 1, 1)).to eq([0,0])
        end
    end

    describe "#diagonal_neighbours" do
        it "look for the diagonal neighbours of a given position(cell)" do
            expect(@board.diagonal_neighbours(@board.get_states, 1, 1)).to eq([0,0,1,0])
        end
    end

    describe "#get_neighbours" do
        it "Get all the neighbours of a given position(cell)" do
            expect(@board.get_neighbours(@board.get_states, 1, 1)).to eq([1,1,0,0,0,0,1,0])
        end
    end

    describe "#get_states" do
        it "Get a grid with the states of the cells" do
            expect(@board.get_states).to eq([[0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
                                            [1, 1, 1, 0, 0, 0, 0, 0, 0, 0],
                                            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                                            [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]])
        end
    end
end