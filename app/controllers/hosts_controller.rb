class HostsController < ApplicationController
  def show
    @host = Host.find()
  end
end
