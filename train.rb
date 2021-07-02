=begin
Класс Train (Поезд):
+ Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
+ Может набирать скорость
+ Может возвращать текущую скорость
+ Может тормозить (сбрасывать скорость до нуля)
+ Может возвращать количество вагонов
+ Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
+ Может принимать маршрут следования (объект класса Route). 
+ При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
+ Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
+ Возвращать предыдущую станцию, текущую, следующую, на основе маршрута

В качестве ответа приложите ссылку на репозиторий с решением.
=end

class Train
  attr_accessor :current_speed, :carriages
  attr_reader :number, :type

  def initialize(number, type)
    @number = number
    @type = type
    @current_speed = 0
    @carriages = []
    puts "Train #{number} created. Type: #{type}. Current speed: #{current_speed}"
  end

  def current_speed     # Может возвращать текущую скорость
    @current_speed
  end

  def speed_up(number)  # Может набирать скорость
    @current_speed += number
  end

  def brake             # Может тормозить до 0.
    @current_speed = 0
  end

  def add_carriage(carriage)   
    self.carriages << carriage if type == carriage.type && current_speed.zero?
  end

  def delete_carriage(carriage)
    if current_speed.zero?
      self.carriages = carriages.reject {|item| item.number == carriage.number}
    end
    carriages
  end

  def train_add_route(route)
    route.set_train(self)
  end

  def change_to_next_station(route)
    route.change_station(self, 'next')
  end

  def change_to_prew_station(route)
    route.change_station(self, 'prew')
  end

  def show_current_prew_next_stations(route)
    route.show_stations_nearby(self)
  end

  def move_next_station
    if next_station != nil
      self.station = next_station unless next_station
    end
  end
  
  def move_previous_station
    if self.station != self.route.stations.first
      self.station = previous_station unless previous_station
    end
  end
end