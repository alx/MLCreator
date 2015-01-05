require 'rubygems'
require 'mailmanager'
require 'sinatra'
require "sinatra/config_file"

config_file './config/config.yml'

get '/' do
  mm = MailManager.init(settings.mailman_path)
  @domain = settings.domain
  @lists = mm.lists
  @members = mm.get_list(settings.main_ml).members.sort
  erb :index
end

post '/' do
  if !params[:listName].empty? && params[:members].size > 0
    mm = MailManager.init(settings.mailman_path)
    new_list = mm.create_list(
      :name => params[:listName],
      :admin_email => settings.admin_email,
      :admin_password => settings.admin_password
    )
    params[:members].each do |email|
      new_list.approved_add_member(email)
    end
  end
  redirect back
end
