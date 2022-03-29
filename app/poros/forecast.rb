class Forecast
  def initialize(data)
    @date = data[:attributes][:date]
    @sunrise = data[:attributes][:sunrise]
    @sunset = data[:attributes][:sunset]
    @high = data[:attributes][:high]
    @low = data[:attributes][:low]
    @humidity = data[:attributes][:humidity]
    @wind = data[:attributes][:wind]
    @weather = data[:attributes][:weather]
  end
end
