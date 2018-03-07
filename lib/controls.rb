class Controls

  DIRECTIONS = {
                  N: { degrees: 0   },
                  E: { degrees: 90  },
                  S: { degrees: 180 },
                  W: { degrees: 270 }
               }

  def initialize( position, controls )
    @x    	   = position[0].to_i
    @y    	   = position[1].to_i
    @degrees   = DIRECTIONS[position.last.to_sym][:degrees]
    @controls  = controls.split("")
  end

  def follow!
    @controls.each do |request|
      case request
      when "M"
        movement
      when "L"
        direct_left
      when "R"
        direct_right
      end
    end

    result
  end

  private

  def degrees_to_direction
    # Handle less/greater than values cardinal loop
    if @degrees < -360
      @degrees += 360
    elsif @degrees > 360
      @degrees -= 360
    end

    # Throw error when totally out of cardinal loop
    raise "Oop's too many consistant turns, you are now out of the cardinal loop, Please reset controls!" if @degrees < -360 || @degrees > 360

    # Convert negative values to get cardinal direction
    @degrees += 360 if @degrees.negative?

    DIRECTIONS.select {|k,v| v[:degrees] == @degrees}.keys.first.to_s
  end

  def movement
    direction = degrees_to_direction
    case direction
    when "N"
      @y += 1
    when "E"
      @x += 1
    when "S"
      @y -= 1
    when "W"
      @x -= 1
    end
  end

  def direct_right
    @degrees += 90
  end

  def direct_left
    @degrees -= 90
  end

  def result
    [@x, @y, degrees_to_direction]
  end

end