class UserMailer < ActionMailer::Base
  default :from => "TESTE DE EMAIL<teste@korewa.com.br>"
  
  #Email enviado para o representante
  def transaction_completed(pedido)
    @pedido = pedido
    @produtos = @pedido.product_request_items.all
		mail(:to => @pedido.user.email, :bcc => "log@korewa.com.br", :subject => "SEU PEDIDO FOI ENVIADO")    
  end
  
  #Email enviado para Nautilus
  def transaction_completed_alert(pedido_alert)
    @pedido = pedido_alert
    @produtos = @pedido.product_request_items.all
		mail(:to => "bsilva@korewa.com.br", :bcc => "log@korewa.com.br", :subject => "UM NOVO PEDIDO FOI EFETUADO!")       
  end
end
