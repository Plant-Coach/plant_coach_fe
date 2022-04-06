class Plant
  attr_reader :id, :name, :plant_type, :days_relative_to_frost_date, :days_to_maturity, :hybrid_status
  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @plant_type = data[:attributes][:plant_type]
    @days_relative_to_frost_date = data[:attributes][:days_relative_to_frost_date]
    @days_to_maturity = data[:attributes][:days_to_maturity]
    @hybrid_status = data[:attributes][:hybrid_status]
  end
end
