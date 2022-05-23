class FrostDates
  attr_reader :zip_code, :location_name, :lat, :lon, :spring_frost, :fall_frost
  def initialize(data)
    @zip_code = data[:data][:attributes][:zip_code]
    @location_name = data[:data][:attributes][:location_name]
    @lat = data[:data][:attributes][:lat]
    @lon = data[:data][:attributes][:lon]
    @spring_frost = date_check(data[:data][:attributes][:spring_frost])
    @fall_frost = date_check(data[:data][:attributes][:fall_frost])
  end

  def date_check(date_data)
    if date_data == "0000"
      return "You don't get frost - lucky you!"
    else
      return date_data.to_date
    end
  end
end
