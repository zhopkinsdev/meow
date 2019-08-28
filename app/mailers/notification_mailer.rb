class NotificationMailer < ApplicationMailer
  default from: "no-reply@nomsterapp.com"


  def comment_added(comment)
    @cat = comment.cat
    @cat_owner = @cat.user
    mail(to: @cat_owner.email, subject: "A comment has been added to #{@cat.name}")
  end
end
