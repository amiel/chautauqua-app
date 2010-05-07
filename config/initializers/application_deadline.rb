# APPLICATION_DEADLINE = Time.zone.parse 'March 31st, 2010 23:59:59'
APPLICATION_DEADLINE = Time.zone.parse 'May 31st, 2010 23:59:59'
module ApplicationDeadline
  def self.before_deadline?
    Time.current < APPLICATION_DEADLINE
  end
end
