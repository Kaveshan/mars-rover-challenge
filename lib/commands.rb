class Commands

  def initialize
    move_rover!
  end

  def move_rover!
    File.open("commands.txt", "r") do |file_handler|
      @surface = file_handler.gets.split[0, 2]

      while !file_handler.eof
        position = file_handler.gets.split[0, 3]
        controls = file_handler.gets.split[0]
 
        self.mars_creation
        self.send_instructions_to_rover(position, controls)
      end
    end
  end

  def mars_creation
    @mars = Mars.new( @surface[0].to_i, @surface[1].to_i )
  end

  def send_instructions_to_rover(position, controls)
    instructions = Controls.new( position, controls )
    result = instructions.follow!

    message = @mars.landing_layer(result[0], result[1]) ? "Rover is within Mars surface, co-ordinates: #{result[0]} #{result[1]} #{result[2]}" :
                                                         "Rover is NOT within Mars surface, co-ordinates #{result[0]} #{result[1]} #{result[2]}"

    p message
  end

end