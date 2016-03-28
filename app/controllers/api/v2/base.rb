module API
  module V2
    class Base < Grape::API
      mount API::V2::Countries
      mount API::V2::Utils
    end
  end
end 