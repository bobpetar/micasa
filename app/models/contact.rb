class Contact < MailForm::Base
  attribute :name
  attribute :date
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "MiCasa Email",
      :to => "brp22@cornell.edu",
      :from => %("#{name}" <#{email}>)
    }
  end
end