class DownloadsController < ApplicationController
  def index
    @downloads = Download.all(:conditions => ['published = 1'])
  end
end
