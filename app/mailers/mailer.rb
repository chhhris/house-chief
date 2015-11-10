class Mailer < ApplicationMailer

  def invitation(to_user, from_user, property = nil)
    @to_user, @from_user, @property = to_user, from_user, property

    mail(
      to: @to_user.email,
      subject: "#{@from_user.name} addded you to their property"
    )
  end
end
