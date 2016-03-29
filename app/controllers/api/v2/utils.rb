module API
  module V2
    class Utils < Grape::API

      version 'v2', using: :path

      helpers do
        def store_visit
          Visit.create({ ip: env["REMOTE_ADDR"] })
        end
      end

      before do
        store_visit
      end

      resource :utils do
        desc 'Set cookie.'
        params do
          requires :text, type: String, desc: 'Text to be set on the cookie'
        end
        post '/set_cookie' do
          cookies[:text] = params[:text]
          status 201
          { message: 'cookie set' }
        end

        desc 'Get cookie.'
        get '/get_cookie' do
          cookie = cookies[:text]
          status 200
          { message: cookie }
        end

        desc 'Get visits.'
        get '/get_visits' do
          visits = Visit.where(:ip => env["REMOTE_ADDR"])
          { visits_count: visits.size, last_visit: visits.last }
        end
      end
    end
  end
end