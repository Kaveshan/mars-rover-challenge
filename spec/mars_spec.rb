require 'pry'
require 'spec_helper'
require './lib/mars.rb'

describe Mars do

  let(:mars) { Mars.new( 8, 8 ) }

  it 'should initialize' do
    expect(mars.instance_variable_get(:@x_axis)).to eq(8)
    expect(mars.instance_variable_get(:@y_axis)).to eq(8)
  end

  it 'should be safe to land' do
    expect(mars.landing_layer( 1, 2 )).to be_truthy
  end

  it 'should not be safe to land' do
    expect(mars.landing_layer( 9, 2 )).to be_falsey
  end

end