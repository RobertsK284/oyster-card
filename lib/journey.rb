class Journey
 attr_reader :entry_station, :exit_station

 def initialize(entry_station: nil)
   @entry_station = entry_station
   @complete = false
 end
end
