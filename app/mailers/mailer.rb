class Mailer < ActionMailer::Base
  

  def acceptance(application, sent_at = Time.current)
    subject   'Your Chautauqua Application'
    recipients application.emails
    from       'amiel.martin@gmail.com'
    sent_on    sent_at
    
    body       :name => application.name
  end

  def wait_list(application, sent_at = Time.current)
    subject   'Your Chautauqua Application'
    recipients application.emails
    from       'amiel.martin@gmail.com'
    sent_on    sent_at
    
    body       :name => application.name
  end

end
