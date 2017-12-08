class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_receipt_email(order)
    @order = order
    mail(to: @order.email, subject: 'Your Jungle Order ID', template_path: 'user_mailer', template_name: 'order_receipt_email')

  end


end
