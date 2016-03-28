module API
  module V1
    class Countries < Grape::API

      version 'v1', using: :path

      resource :countries do
        desc 'Return the countries list.'
        get do
          Country.all
        end

        desc 'Return a country.'
        params do
          requires :id, type: Integer, desc: 'Country id.'
        end
        get '/:id' do
          set_country
        end

        desc 'Create a country.'
        params do
          requires :name, type: String, desc: 'Country name.'
          requires :description, type: String, desc: 'Country short description.'
        end
        post do
          Country.create!({
            name: params[:name],
            description: params[:description]
          })
        end

        desc 'Destroy the given country.'
        params do
          requires :id, type: Integer, desc: 'Country id.'
        end
        delete '/:id' do
          set_country.destroy
        end
      end
    end
  end
end