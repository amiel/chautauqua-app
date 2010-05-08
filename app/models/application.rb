class Application < ActiveRecord::Base
  TRANSPORTATION_OPTIONS = [ 'Will bring car', 'Bus from PT', 'Will get to tour and travel on bus', 'Other...' ]
  AMOUNT_OF_INVOLVEMENT_OPTIONS = [ 'full_tour', 'part_tour', 'not_sure_yet' ].collect{|item| [item.humanize, item]}
  POSSIBILITY_OF_INVOLVEMENT_OPTIONS = (1..4).collect{|i| "#{i*25}% sure" }
  
  named_scope :only_new, :conditions => { :been_on_tour => false }
  named_scope :part_time, :conditions => 'amount_of_involvement != "full_tour"'
  
  named_scope :newest_first, :order => 'created_at desc'
  named_scope :by_name, :order => 'name'
  
  named_scope :accepted, :conditions => { :status => 'accepted' }
  named_scope :wait_list, :conditions => { :status => 'wait_list' }
  
  
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :chautauqua_contributions

  def emails
    self.email.split(/[,\s]+/)
  end
  
  def deliver_email!
    case status
    when 'accepted'
      logger.error "SENDING AN ACCEPTANCE EMAIL TO #{emails.inspect}"
      
      Mailer.deliver_acceptance self
    when 'wait_list'
      Mailer.deliver_wait_list self
    else
      nil # noop
    end
  end

  
  has_bitmask_attributes :abilities do |c|
    c.attribute :performer,           0b000000000001
    c.attribute :workshop_leader,     0b000000000010
    c.attribute :band,                0b000000000100
    c.attribute :rover,               0b000000001000
    c.attribute :stagehand,           0b000000010000
    c.attribute :cook,                0b000000100000
    c.attribute :kitchen_crew,        0b000001000000
    c.attribute :car_driver,          0b000010000000
    c.attribute :driver_with_cdl,     0b000100000000
    c.attribute :truck_driver,        0b001000000000
    c.attribute :organizer,           0b010000000000
    c.attribute :other,               0b100000000000
  end
end
