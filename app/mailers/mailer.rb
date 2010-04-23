class Mailer < ActionMailer::Base
  

  def acceptance(application, sent_at = Time.current)
    subject   'Your Chautauqua Application'
    recipients application.emails
    from       '"Who-Am-Us" <amiel.martin+whoamus@gmail.com>'
    sent_on    sent_at
    
    application.logger.error "SENDING AN ACCEPTANCE EMAIL TO #{application.emails.inspect}"
    
    body       :name => application.name
  end

  def wait_list(application, sent_at = Time.current)
    subject   'Your Chautauqua Application'
    recipients application.emails
    from       '"Who-Am-Us" <amiel.martin+whoamus@gmail.com>'
    sent_on    sent_at
    
    application.logger.error "SENDING A WAIT LIST EMAIL TO #{application.emails.inspect}"
    
    body       :name => application.name
  end

end
