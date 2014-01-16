require 'spec_helper'
require 'piglatin'

describe Piglatin do
  describe "new" do
    it "should instantiate" do
      lambda {
        Piglatin.new
      }.should_not raise_exception
    end
  end
end
