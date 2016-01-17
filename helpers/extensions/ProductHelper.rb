module Sinatra
  module ProductHelper
    def all_products
      Product.all
    end

    def find_product(id)
      Product.find(id)
    end

    def create_product(params)
      Product.create(params)
    end

    def update_product(params)
      params.delete_if { |key, value| value == '' }
      product = Product.find(params[:product][:id])
      return nil unless product.update(params[:product])

      product.categorys.clear
      params[:categorys_attributes].each do |category|
        product.categorys << Category.find(category[:id])
      end
    end

    def delete_product(id)
      Product.find(id).destroy
    end
  end

  helpers ProductHelper
end