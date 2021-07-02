=begin
С этого занятия мы будем создавать объектную модель (классы и методы) для гипотетического приложения управления железнодорожными станциями, которое позволит управлять станциями, принимать и отправлять поезда, показывать информацию о них и т.д.

Требуется написать следующие классы:

Класс Station (Станция):
+ Имеет название, которое указывается при ее создании
+ Может принимать поезда (по одному за раз)
+ Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).
+ Может возвращать список всех поездов на станции, находящиеся в текущий момент
+ Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
=end

class Station
  attr_accessor :trains
  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    self.trains << train  
  end

  def delete_train(train)
    @trains = @trains.reject {|item| item.number == train.number}
    @trains
  end
  
  def all_trains_by_type(type)
    self.trains.filter { |train| train.type == type }
  end
  
  def type_count(type)
    self.train_by_type(type).size
  end

end