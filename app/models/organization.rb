class Organization < ActiveRecord::Base
  attr_accessible :name, :region, :phone, :website, :email
  Region_List = [[''], ['Al Assiry'],  ['Al Bidda'], ['Al Dafna'], ['Al Hilal'], ['Al Mamoura'], ['Al Mansoura'], ['Al Markhiya'], ['Al Mirqab Al Jadeed'], ['Al Muntazah'], ['Al Nasr'], ['Al Rayyan'], ['Al Sadd'], ['Al Waab'], ['Bin Mahmoud'], ['Madinat Khalifa'], ['Old Airport'], ['Onaiza'], ['Qutaifiya'], ['Ras Abu Aboud'], ['Rumeilah'], ['Wadi Al Sail'], ['West Bay']]
  validates :name, :email, :region, :phone, :website, :presence => true
  has_many :medics
  validates_format_of :phone, :with => /^(\+?\d{8}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 8 digits (country code not required)"
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info|qa))$/i, :message => "is not a valid format"
  validates :email, uniqueness: true
  validates_format_of :website, :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix, :message => "is invalid ( ensure URL begins with  http://www.______ )"
  before_save :format_phone
 
  
  private
  
    def format_phone
     phone = self.phone.to_s
     phone.gsub!(/[^0-9]/,"")
      self.phone = phone
    end

end
