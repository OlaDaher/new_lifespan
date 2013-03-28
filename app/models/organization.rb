class Organization < ActiveRecord::Base
  attr_accessible :name, :region, :phone
  Region_List = [['Al Assiry'],  ['Al Bidda'], ['Al Dafna'], ['Al Hilal'], ['Al Mamoura'], ['Al Markhiya'], ['Al Mirqab Al Jadeed'], ['Al Nasr'], ['Al Sadd'], ['Al Waab'], ['Bin Mahmoud'], ['Madinat Khalifa'], ['Old Airport'], ['Onaiza'], ['Qutaifiya'], ['Ras Abu Aboud'], ['Rumeilah'], ['Wadi Al Sail'], ['West Bay']]
  validates :name, :region, :phone, :presence => true
  has_many :medics
  validates :name, :region, :presence => true
  validates_format_of :phone, :with => /^(\+?\d{11}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 11 digits (country code needed) delimited with dashes only"
  before_save :format_phone
  
  private
  
    def format_phone
     phone = self.phone.to_s
     phone.gsub!(/[^0-9]/,"")
      self.phone = phone
    end

end
