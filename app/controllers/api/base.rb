module API
  class Base < Grape::API

    prefix 'api'
    default_format :json
    format :json

    helpers do
      def set_country
        return error! :not_found, 404 unless Country.exists?(params[:id])
        Country.find(params[:id])
      end
    end

    mount API::V1::Base
    mount API::V2::Base
  end
end