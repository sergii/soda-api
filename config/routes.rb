Rails.application.routes.draw do
  post '/words', to: 'words#create'
  get '/words/:word', to: 'words#show'
end
