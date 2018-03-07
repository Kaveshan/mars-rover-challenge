require 'pry'
require 'spec_helper'
require './lib/controls.rb'

describe Controls do
  let(:positions)    { ["1", "2", "E"] }
  let(:controls)     { "MMLMRMMRRMML" }
  let(:instructions) { Controls.new( positions, controls ) }

  it 'should initialize' do
    expect(instructions.instance_variable_get(:@x)).to eq(1)
    expect(instructions.instance_variable_get(:@y)).to eq(2)
    expect(instructions.instance_variable_get(:@degrees)).to eq(90)
    expect(instructions.instance_variable_get(:@controls)).to eq(controls.split(""))
  end

  it 'should convert degrees to direction' do
    expect(instructions.send(:degrees_to_direction)).to eq("E")
  end

  it 'should follow instructions' do
    expect(instructions).to receive(:movement).exactly(7).times
    expect(instructions).to receive(:direct_left).exactly(2).times
    expect(instructions).to receive(:direct_right).exactly(3).times

    instructions.follow!
  end

  it 'should allow + movement on the x-axis' do
    controls     = "M"
    instructions = Controls.new( positions, controls )

    instructions.follow!
    expect(instructions.instance_variable_get(:@x)).to eq(2)
  end

  it 'should allow + movement on the y-axis' do
    controls 	   = "M"
    positions    = ["1", "2", "N"]
    instructions = Controls.new( positions, controls )

    instructions.follow!
    expect(instructions.instance_variable_get(:@y)).to eq(3)
  end

  it 'should allow - movement on the x-axis' do
    controls 	   = "M"
    positions    = ["1", "2", "W"]
    instructions = Controls.new( positions, controls )

    instructions.follow!
    expect(instructions.instance_variable_get(:@x)).to eq(0)
  end

  it 'should allow - movement on the y-axis' do
    controls 	   = "M"
    positions    = ["1", "2", "S"]
    instructions = Controls.new( positions, controls )

    instructions.follow!
    expect(instructions.instance_variable_get(:@y)).to eq(1)
  end

  it 'should direct left - 90 degrees' do
    controls 	   = "L"
    instructions = Controls.new( positions, controls )

    instructions.follow!
    expect(instructions.instance_variable_get(:@degrees)).to eq(0)
  end

  it 'should direct right + 90 degrees' do
    controls 	   = "R"
    instructions = Controls.new( positions, controls )

    instructions.follow!
    expect(instructions.instance_variable_get(:@degrees)).to eq(180)
  end

  it 'should allow conversion of a negative degree' do
    positions    = ["1", "2", "N"]
    controls     = "LL"
    instructions = Controls.new( positions, controls )

    instructions.follow!
    expect(instructions.instance_variable_get(:@degrees)).to eq(180)
    expect(instructions.send(:degrees_to_direction)).to eq("S")
  end

  it 'should raise an error when out of cardinal range on negative values' do
    positions    = ["1", "2", "N"]
    controls     = "LLLLLLLLLL"
    instructions = Controls.new( positions, controls )

    expect{instructions.follow!}.to raise_error(RuntimeError)
  end

  it 'should raise an error when out of cardinal range on positive values' do
    positions    = ["1", "2", "N"]
    controls     = "RRRRRRRRRR"
    instructions = Controls.new( positions, controls )

    expect{instructions.follow!}.to raise_error(RuntimeError)
  end
end