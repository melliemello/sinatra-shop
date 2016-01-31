module ArtGarbage
  module Models
    autoload :Picture, "#{APP_ROOT}/models/picture"
    autoload :Product, "#{APP_ROOT}/models/product"
    autoload :Category, "#{APP_ROOT}/models/category"
    autoload :Categoryassignment, "#{APP_ROOT}/models/category_assignment"
    autoload :User, "#{APP_ROOT}/models/user"
    autoload :UserDetails, "#{APP_ROOT}/models/user_details"
    autoload :Order, "#{APP_ROOT}/models/order"
    autoload :LineItem, "#{APP_ROOT}/models/line_items"
    autoload :PurchaseProcess, "#{APP_ROOT}/models/purchase_process"
    autoload :Mail, "#{APP_ROOT}/models/mail"
  end
end