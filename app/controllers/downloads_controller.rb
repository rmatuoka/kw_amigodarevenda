class DownloadsController < ApplicationController
  def index
    @downloads = Download.all(:conditions => ['published = 1'])
  end
  
  def baixar
    @datafile = Download.find(params[:id])
    send_file(@datafile.file.path,:disposition => 'inline')
  end
end
