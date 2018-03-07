require 'pry'
require 'spec_helper'
require './lib/commands.rb'
require './lib/controls.rb'
require './lib/mars.rb'

describe Commands do

  context 'normal behaviour' do
    let(:position)  { ["1", "2", "E"] }
    let(:controls)  { "MMLMRMMRRMML" }
    let(:command)   { Commands.new }
    let(:mars)      { command.mars_creation }

    it 'should create mars' do
      expect(mars.instance_variable_get(:@x_axis)).to eq(5)
      expect(mars.instance_variable_get(:@y_axis)).to eq(5)
    end

    it 'should send instructions to rover' do
      result = command.send_instructions_to_rover(position, controls)
      expect(result.class).to eq(String)
    end
  end

end