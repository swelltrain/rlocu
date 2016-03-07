require 'spec_helper'
include Rlocu

RSpec.describe GeoJSON, '#new' do
  it "should raise ArgumentError if geo['type'] does not exist" do
    expect{ GeoJSON.new({}) }.to raise_error(ArgumentError)
  end
end
