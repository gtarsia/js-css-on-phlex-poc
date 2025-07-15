module Components::JexComponent
  class JexModel
    def initialize(id)
      @id = id
    end

    def method_missing(m, *args, &block)
      get_by_id + ".#{m}();"
    end

    private
      def get_by_id
        "document.getElementById('#{@id}')"
      end
  end

  extend ActiveSupport::Concern

  def view_template
    if respond_to?(:css_template) && !ctx.key?(:css)
      style do
        css_template
      end
      ctx[:css] = true
    end
    html_template
    if respond_to?(:js_template) && !ctx.key?(:js)
      script do
        raw safe(js_template)
      end
      ctx[:js] = true
    end
  end

  def ctx
    context[self] ||= {}
  end

  def js
    JexModel.new(id)
  end
end
