# frozen_string_literal: true

class Components::Base < Phlex::HTML
  extend Literal::Properties
  # Include any other rails helpers you want to be available across all components
  include Phlex::Rails::Helpers::Routes

  if Rails.env.development?
    def before_template
      comment { "Before #{self.class.name}" }
      super
    end
  end
end
