class Organization < ActiveRecord::Base
  attr_accessible :name, :region
<<<<<<< HEAD
  Region_List = [['Al Assiry'],  ['Al Bidda'], ['Al Dafna'], ['Al Hilal'], ['Al Mamoura'], ['Al Markhiya'], ['Al Mirqab Al Jadeed'], ['Al Nasr'], ['Al Sadd'], ['Al Waab'], ['Bin Mahmoud'], ['Madinat Khalifa'], ['Old Airport'], ['Onaiza'], ['Qutaifiya'], ['Ras Abu Aboud'], ['Rumeilah'], ['Wadi Al Sail'], ['West Bay']]
  validates :name, :region, :presence => true
  has_many :medics
=======
  validates :name, :region, :presence => true
>>>>>>> df89ba0e5ab66756c483aed6128f876d62ccdbf1
end
