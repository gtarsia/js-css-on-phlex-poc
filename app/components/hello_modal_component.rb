class Components::HelloModalComponent < Components::ModalComponent
  def modal_template
    div do
      plain "This is the modal"
    end
  end
end
