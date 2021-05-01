require 'twitter'
require 'memoizable'

module Twitter
  module Entities
    def quoted_status_permalink
      Twitter::Entity::Permalink.new(@attrs.fetch(:quoted_status_permalink)) if @attrs.fetch(:quoted_status_permalink)
    end
    memoize :quoted_status_permalink
  end
end

module Twitter
  class Entity
    class Permalink < Twitter::Entity
      uri_attr_reader :uri
      define_attribute_method(:expanded)
      define_predicate_method(:expanded)
      define_attribute_method(:display)
      define_predicate_method(:display)
    end
  end
end
