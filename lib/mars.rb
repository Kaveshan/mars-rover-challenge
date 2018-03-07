class Mars

  def initialize( x, y )
	@x_axis = x
	@y_axis = y
  end

  def landing_layer( x, y )
    x.between?(0, @x_axis) && y.between?(0, @y_axis)
  end

end