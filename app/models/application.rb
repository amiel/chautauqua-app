class Application < ActiveRecord::Base
  TRANSPORTATION_OPTIONS = [ 'Will bring car', 'Bus from PT', 'Will get to tour and travel on bus', 'Other...' ]
  AMOUNT_OF_INVOLVEMENT_OPTIONS = [ 'full tour', 'part tour', 'not sure yet' ]
  POSSIBILITY_OF_INVOLVEMENT_OPTIONS = (1..4).collect{|i| "#{i*25}% sure" }
  
  
  has_bitmask_attributes :abilities do |c|
    c.attribute :performer,           0b0000000001
    c.attribute :workshop_leader,     0b0000000010
    c.attribute :band,                0b0000000100
    c.attribute :rover,               0b0000001000
    c.attribute :stagehand,           0b0000010000
    c.attribute :cook,                0b0000100000
    c.attribute :car_driver,          0b0001000000
    c.attribute :driver_with_cdl,     0b0010000000
    c.attribute :organizer,           0b0100000000
    c.attribute :other,               0b1000000000
  end
end
