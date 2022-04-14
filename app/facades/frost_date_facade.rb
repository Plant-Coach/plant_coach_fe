class FrostDateFacade
  def self.get_frost_dates(jwt)
    frost_data = FrostDateService.get_frost_dates(jwt)
    result = FrostDates.new(frost_data)
  end
end
