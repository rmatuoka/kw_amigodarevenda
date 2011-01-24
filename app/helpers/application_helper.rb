# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def data_atual_extenso
    return Date.today.strftime("%d").to_s + " de " + busca_mes(Date.today.strftime("%m").to_i) + " de " +  Date.today.strftime("%y").to_s
  end
  
  def hora_atual_resumida
    return Time.now.strftime("%H") + "h" + Time.now.strftime("%M") + "m"
  end
  
  def busca_mes(mes)
        meses = Array.new  
        meses = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"]  
        return meses[mes - 1]
    end
end
