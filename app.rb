require 'sinatra'
require 'json'

post '/caracola' do
  if !params[:text].nil?
    response
  else
    respond_message 'Eso no es una pregunta'
  end
end

def response
  options = 'Algún día', 'Nada', 'Ni', 'Yo no lo creo', 'No', 'Si', 'Prueba preguntar otra vez'
  respond_message options.sample
end

def respond_message(message)
  content_type :json
  { response_type: 'in_channel',
    text: message,
    username: '5Rabbit Bot',
    mrkdwn: true }.to_json
end
