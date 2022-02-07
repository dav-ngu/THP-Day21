require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
     erb :index, locals: {gossips: Gossip.all} 
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do #page formulaire pour nouveau gossip
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
                      #les params afficheront les inputs textes de la vue new_gossip.erb
    redirect '/'  #redirige vers la page d'accueil après le submit
  end

  # affichage dynamique du gossip par ID
  get '/gossips/:id' do
  erb :gossip, locals: {gossip: Gossip.all[params[:id].to_i], id: params[:id].to_i}
  end

end