module ArtGarbage
  module Models
    class UserDetails < ActiveRecord::Base
      validates_format_of :phone, :with => /([0-9]+)/, :on => :create
      validates_length_of :fname, :in => 2..20, :allow_nil => false
      validates_length_of :lname, :in => 2..20, :allow_nil => false
      validates_presence_of :address

    end
  end
end