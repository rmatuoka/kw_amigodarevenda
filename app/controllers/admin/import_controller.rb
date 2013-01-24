class Admin::ImportController < ApplicationController
  layout "blank"
  require 'fileutils'
  require 'faster_csv'  
  
  def index

  end

  def imp_sipais
    if File.exists?('public/import/new/SIPAIS.TXT')
      Sipais.delete_all
      FasterCSV.foreach("public/import/new/SIPAIS.TXT", :quote_char => '}', :col_sep =>'||', :row_sep =>:auto) do |row|
        Sipais.create!(  :cod_pais => row[0],
                        :pais => row[1])
      end
      novo_nome_arquivo = "SIPAIS_"+Date.today.strftime("%Y") + Date.today.strftime("%m") + Date.today.strftime("%d") + Time.now.strftime("%H") + Time.now.strftime("%M") + Time.now.strftime("%S")
      File.rename('public/import/new/SIPAIS.TXT', 'public/import/new/'+ novo_nome_arquivo +'.TXT')
      FileUtils.mv('public/import/new/'+ novo_nome_arquivo  +'.TXT', 'public/import/old/'+ novo_nome_arquivo +'.TXT')
      @Pais = Sipais.all
    end
  end


  def imp_siest
    if File.exists?('public/import/new/SIEST.TXT')
      Siest.delete_all
      FasterCSV.foreach("public/import/new/SIEST.TXT", :quote_char => '}', :col_sep =>'||', :row_sep =>:auto) do |row|
        Siest.create!(  :cod_pais => row[0],
                        :cod_estado => row[1],
                        :estado => row[2],
                        :uf => row[3])
      end
      novo_nome_arquivo = "SIEST_"+Date.today.strftime("%Y") + Date.today.strftime("%m") + Date.today.strftime("%d") + Time.now.strftime("%H") + Time.now.strftime("%M") + Time.now.strftime("%S")
      File.rename('public/import/new/SIEST.TXT', 'public/import/new/'+ novo_nome_arquivo +'.TXT')
      FileUtils.mv('public/import/new/'+ novo_nome_arquivo  +'.TXT', 'public/import/old/'+ novo_nome_arquivo +'.TXT')
      @Estados = Siest.all
    end
  end
  
  
  
  def imp_sicid
    if File.exists?('public/import/new/SICID.TXT')
      Sicid.delete_all
      FasterCSV.foreach("public/import/new/SICID.TXT", :quote_char => '}', :col_sep =>'||', :row_sep =>:auto) do |row|
        Sicid.create!(  :cod_pais => row[0],
                        :cod_estado => row[1],
                        :cod_cidade => row[2],
                        :cidade => row[3])
      end
      novo_nome_arquivo = "SICID_"+Date.today.strftime("%Y") + Date.today.strftime("%m") + Date.today.strftime("%d") + Time.now.strftime("%H") + Time.now.strftime("%M") + Time.now.strftime("%S")
      File.rename('public/import/new/SICID.TXT', 'public/import/new/'+ novo_nome_arquivo +'.TXT')
      FileUtils.mv('public/import/new/'+ novo_nome_arquivo  +'.TXT', 'public/import/old/'+ novo_nome_arquivo +'.TXT')
      @Cidades = Sicid.all
    end
  end
  

  def imp_sizona
    if File.exists?('public/import/new/SIZONA.TXT')
      Sizona.delete_all
      FasterCSV.foreach("public/import/new/SIZONA.TXT", :quote_char => '}', :col_sep =>'||', :row_sep =>:auto) do |row|
        Sizona.create!(  :cod_pais => row[0],
                        :cod_estado => row[1],
                        :cod_cidade => row[2],
                        :cod_zona => row[3],
                        :zona => row[4])
      end
      novo_nome_arquivo = "SIZONA_"+Date.today.strftime("%Y") + Date.today.strftime("%m") + Date.today.strftime("%d") + Time.now.strftime("%H") + Time.now.strftime("%M") + Time.now.strftime("%S")
      File.rename('public/import/new/SIZONA.TXT', 'public/import/new/'+ novo_nome_arquivo +'.TXT')
      FileUtils.mv('public/import/new/'+ novo_nome_arquivo  +'.TXT', 'public/import/old/'+ novo_nome_arquivo +'.TXT')
      @Zonas = Sizona.all
    end
  end
  
  
  
  def imp_sibai
    if File.exists?('public/import/new/SIBAI.TXT')
      Sibai.delete_all
      FasterCSV.foreach("public/import/new/SIBAI.TXT", :quote_char => '}', :col_sep =>'||', :row_sep =>:auto) do |row|
        Sibai.create!(  :cod_pais => row[0],
                        :cod_estado => row[1],
                        :cod_cidade => row[2],
                        :cod_zona => row[3],
                        :cod_bairro => row[4],
                        :bairro => row[5])
      end
      novo_nome_arquivo = "SIBAI_"+Date.today.strftime("%Y") + Date.today.strftime("%m") + Date.today.strftime("%d") + Time.now.strftime("%H") + Time.now.strftime("%M") + Time.now.strftime("%S")
      File.rename('public/import/new/SIBAI.TXT', 'public/import/new/'+ novo_nome_arquivo +'.TXT')
      FileUtils.mv('public/import/new/'+ novo_nome_arquivo  +'.TXT', 'public/import/old/'+ novo_nome_arquivo +'.TXT')
      @Bairros = Sibai.all
    end
  end  



  def imp_sirev
    if File.exists?('public/import/new/SIREV.TXT')
      text = File.read('public/import/new/SIREV.TXT')
      File.open('public/import/new/SIREV.TXT', 'w') { |f| f << text.gsub("'", "''") }

      #Sirev.delete_all
      FasterCSV.foreach('public/import/new/SIREV.TXT', :quote_char => '}', :col_sep =>'||', :row_sep =>:auto) do |row|
        
        statement = %{
          
        INSERT INTO `sirevs`
        (`cod_revenda`, `revenda`, `fantasia`, `cod_pais`, `cod_estado`, `cod_cidade`, `cod_zona`, `cod_bairro`,
         `endereco`, `nr`, `cep`, `telefone`, `email1`, `email2`, `cod_repre`, `cod_trans`, `flag_ati`,`updated_at`, `created_at`) 
        VALUES 
        ('#{row[0]}', '#{row[1]}', '#{row[2]}', '#{row[3]}', '#{row[4]}', '#{row[5]}', '#{row[6]}', '#{row[7]}', '#{row[8]}',
         '#{row[9]}', '#{row[10]}', '#{row[11]}', '#{row[12]}', '#{row[13]}', '#{row[14]}', '#{row[15]}', '#{row[16]}', utc_timestamp, utc_timestamp)  
        ON DUPLICATE KEY UPDATE
        `revenda` = '#{row[1]}',
        `fantasia` = '#{row[2]}', 
        `cod_pais` = '#{row[3]}', 
        `cod_estado` = '#{row[4]}', 
        `cod_cidade` = '#{row[5]}', 
        `cod_zona` = '#{row[6]}', 
        `cod_bairro` = '#{row[7]}',
        `endereco` = '#{row[8]}',
        `nr` = '#{row[9]}', 
        `cep` = '#{row[10]}', 
        `telefone` = '#{row[11]}', 
        `email1` = '#{row[12]}', 
        `email2` = '#{row[13]}', 
        `cod_repre` = '#{row[14]}',
        `cod_trans` = '#{row[15]}', 
        `flag_ati` = '#{row[16]}',
        `updated_at` = utc_timestamp
        }.squish!
        Sirev.connection.insert_sql(statement)
      end
      novo_nome_arquivo = "SIREV_"+Date.today.strftime("%Y") + Date.today.strftime("%m") + Date.today.strftime("%d") + Time.now.strftime("%H") + Time.now.strftime("%M") + Time.now.strftime("%S")
      File.rename('public/import/new/SIREV.TXT', 'public/import/new/'+ novo_nome_arquivo +'.TXT')
      FileUtils.mv('public/import/new/'+ novo_nome_arquivo  +'.TXT', 'public/import/old/'+ novo_nome_arquivo +'.TXT')
     
      #@Revendas = Sirev.all(:joins => :sirepre) #Lista todas os representantes que tem relacionamento valido com a Revenda
      #@Revendas = Sirev.all #Todas as Revendas
      @Revendas = Sirev.all(:joins => :sitrans)
    end
  end
  
  def imp_sirepre
    if File.exists?('public/import/new/SIREPRE.TXT')
      text = File.read('public/import/new/SIREPRE.TXT')
      File.open('public/import/new/SIREPRE.TXT', 'w') { |f| f << text.gsub("'", "''") }

      FasterCSV.foreach('public/import/new/SIREPRE.TXT', :quote_char => '}', :col_sep =>'||', :row_sep =>:auto) do |row|

        statement = %{

        INSERT INTO `sirepres`
        (`cod_repre`, `representante`, `fantasia`,`updated_at`, `created_at`) 
        VALUES 
        ('#{row[0]}', '#{row[1]}', '#{row[2]}', utc_timestamp, utc_timestamp)  
        ON DUPLICATE KEY UPDATE
        `representante` = '#{row[1]}',
        `fantasia` = '#{row[2]}', 
        `updated_at` = utc_timestamp
        }.squish!
        Sirepre.connection.insert_sql(statement)

      end
      novo_nome_arquivo = "SIREPRE_"+Date.today.strftime("%Y") + Date.today.strftime("%m") + Date.today.strftime("%d") + Time.now.strftime("%H") + Time.now.strftime("%M") + Time.now.strftime("%S")
      File.rename('public/import/new/SIREPRE.TXT', 'public/import/new/'+ novo_nome_arquivo +'.TXT')
      FileUtils.mv('public/import/new/'+ novo_nome_arquivo  +'.TXT', 'public/import/old/'+ novo_nome_arquivo +'.TXT')
      @Representantes = Sirepre.all
    end
  end
  
  def imp_trans 
    if File.exists?('public/import/new/SITRANS.TXT')
      text = File.read('public/import/new/SITRANS.TXT')
      File.open('public/import/new/SITRANS.TXT', 'w') { |f| f << text.gsub("'", "''") }

      FasterCSV.foreach('public/import/new/SITRANS.TXT', :quote_char => '}', :col_sep =>'||', :row_sep =>:auto) do |row|

        statement = %{

          INSERT INTO `sitrans`
          (`cod_trans`, `transportadora`, `fantasia`, `cod_pais`, `cod_estado`, `cod_cidade`, `cod_zona`, `cod_bairro`,
           `endereco`, `nr`, `cep`, `telefone`, `email1`,`updated_at`, `created_at`) 
          VALUES 
          ('#{row[0]}', '#{row[1]}', '#{row[2]}', '#{row[3]}', '#{row[4]}', '#{row[5]}', '#{row[6]}', '#{row[7]}', '#{row[8]}',
           '#{row[9]}', '#{row[10]}', '#{row[11]}', '#{row[12]}', utc_timestamp, utc_timestamp)  
          ON DUPLICATE KEY UPDATE
          `transportadora` = '#{row[1]}',
          `fantasia` = '#{row[2]}', 
          `cod_pais` = '#{row[3]}', 
          `cod_estado` = '#{row[4]}', 
          `cod_cidade` = '#{row[5]}', 
          `cod_zona` = '#{row[6]}', 
          `cod_bairro` = '#{row[7]}',
          `endereco` = '#{row[8]}',
          `nr` = '#{row[9]}', 
          `cep` = '#{row[10]}', 
          `telefone` = '#{row[11]}', 
          `email1` = '#{row[12]}', 
          `updated_at` = utc_timestamp
          }.squish!
        Sitrans.connection.insert_sql(statement)

      end
      novo_nome_arquivo = "SITRANS_"+Date.today.strftime("%Y") + Date.today.strftime("%m") + Date.today.strftime("%d") + Time.now.strftime("%H") + Time.now.strftime("%M") + Time.now.strftime("%S")
      File.rename('public/import/new/SITRANS.TXT', 'public/import/new/'+ novo_nome_arquivo +'.TXT')
      FileUtils.mv('public/import/new/'+ novo_nome_arquivo  +'.TXT', 'public/import/old/'+ novo_nome_arquivo +'.TXT')
      @Transportadora = Sitrans.all
    end
  end
    
  def imp_sigru 
    if File.exists?('public/import/new/SIGRU.TXT')
      text = File.read('public/import/new/SIGRU.TXT')
      File.open('public/import/new/SIGRU.TXT', 'w') { |f| f << text.gsub("'", "''") }

      FasterCSV.foreach('public/import/new/SIGRU.TXT', :quote_char => '}', :col_sep =>'||', :row_sep =>:auto) do |row|

        statement = %{

        INSERT INTO `sirepres`
        (`cod_repre`, `representante`, `fantasia`,`updated_at`, `created_at`) 
        VALUES 
        ('#{row[0]}', '#{row[1]}', '#{row[2]}', utc_timestamp, utc_timestamp)  
        ON DUPLICATE KEY UPDATE
        `representante` = '#{row[1]}',
        `fantasia` = '#{row[2]}', 
        `updated_at` = utc_timestamp
        }.squish!
        Sirepre.connection.insert_sql(statement)

      end
      novo_nome_arquivo = "SIGRU_"+Date.today.strftime("%Y") + Date.today.strftime("%m") + Date.today.strftime("%d") + Time.now.strftime("%H") + Time.now.strftime("%M") + Time.now.strftime("%S")
      File.rename('public/import/new/SIGRU.TXT', 'public/import/new/'+ novo_nome_arquivo +'.TXT')
      FileUtils.mv('public/import/new/'+ novo_nome_arquivo  +'.TXT', 'public/import/old/'+ novo_nome_arquivo +'.TXT')
      @Grupos = Sirepre.all
    end
  end      
end
