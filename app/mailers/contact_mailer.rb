class ContactMailer < ActionMailer::Base

  def contact_notification(contact)
  	@contact = contact
  	mail(to: "aaronjohnsonis@gmail.com", subject: "Contact Notification", from: contact.email)
  end

end
