module API
  module V2
    class Utils < Grape::API

      version 'v2', using: :path

      resource :utils do
        desc 'Set cookie.'
        params do
          requires :text, type: String, desc: 'Text to be set on the cookie'
        end
        post '/set_cookie' do
          cookies[:text] = params[:text]
          status 200
          { message: 'cookie set' }
        end

        desc 'Get cookie.'
        get '/get_cookie' do
          cookie = cookies[:text]
          status 200
          { message: cookie }
        end
      end
    end
  end
end