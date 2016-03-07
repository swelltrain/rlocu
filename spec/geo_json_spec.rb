require 'spec_helper'
include Rlocu

RSpec.describe GeoJSON, '#new' do
  it "should raise ArgumentError if geo['type'] does not exist" do
    expect{ GeoJSON.new({}) }.to raise_error(ArgumentError)
  end

  it "should raise ArgumentError if geo['coordinates'] does not exist" do
    expect{ GeoJSON.new({'type' => 'Point'}) }.to raise_error(ArgumentError)
  end
end
