
class Components::ModalComponent < Components::Base
  include Components::JexComponent
  register_element :jex_modal

  def html_template
    jex_modal(id:, class: "modal") do
      modal_template
    end
  end

  def id
    self.class.name.underscore
  end

  def js_template
    <<~js
      class JexModal extends HTMLElement {
        show() {
          this.classList.add("show");
        }
        hide() {
          this.classList.add("show");
        }
      }
      customElements.define("jex-modal", JexModal)
    js
  end

  def css_template
    <<~css
      .modal {
          display: none;
      }
      .modal.show {
          display: block;
      }
    css
  end
end
