require 'pgxn'
require 'rspec'

describe Pgxn do
  describe "::version" do
    # If you update pgxnclient, expect this test to need updating.
    it "returns the correct pgxn version" do
      Pgxn.version.should == 'pgxnclient 1.0.1'
    end
  end
end
