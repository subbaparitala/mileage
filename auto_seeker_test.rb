require "minitest/autorun"
require "./auto_seeker"
require 'byebug'

describe AutoSeeker do
  before do
    data = [
      [1,'Red',12999,20.0,'gas'],
      [2,'Blue',13999,25.0,'gas'],
      [3,'Teal',19000,27.0,'gas'],
      [4,'Red',14999,40.0,'diesel'],
      [33,'Teal',38641.87, nil,'hybrid']
    ]
    @seeker = AutoSeeker.new data
  end


  describe "#filter " do
    it "can filter by color " do
      result = @seeker.filter 'color', 'Red'
      result.collect(&:color).uniq.must_equal ['Red']
    end
  end

  describe ".median_mileage " do
    it "calculates median mileage for all autos" do
      # byebug
      AutoSeeker.median_mileage(@seeker.data).must_equal 25.0
    end

    it "calculates median mileage for filtered autos" do
      @seeker.filter 'color', 'Red'
      byebug
      AutoSeeker.median_mileage(@seeker.data).must_equal 30.0
    end
  end
end
