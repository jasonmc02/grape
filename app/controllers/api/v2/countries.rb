module API
  module V2
    class Countries < Grape::API

      version 'v2', using: :path

      helpers do
        params :pagination do
          optional :page, type: Integer
          optional :per_page, type: Integer
        end
      end

      resource :countries do
        desc 'Return the countries list.'
        params do
          use :pagination
        end
        get do
          coutries = Country.page(params[:page]).per(params[:per_page])
        end

        desc 'Return a country.'
        params do
          requires :name, type: String, desc: 'Country name.'
        end
        get '/:name' do
          return error! :not_found, 404 unless Country.exists?(:name => params[:name])
          Country.find_by_name(params[:name])
        end

        desc 'Create a country.'
        params do
          requires :name, type: String, desc: 'Country name.'
          requires :description, type: String, desc: 'Country short description.'
          requires :allowed, type: Boolean, desc: 'Allowed country.'
        end
        post do
          Country.create!({
            name: params[:name],
            description: params[:description],
            allowed: params[:allowed]
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