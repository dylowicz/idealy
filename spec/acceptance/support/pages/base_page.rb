class BasePage
  include PageObject

  div(:flash_message, id: 'flash-message-box')

  def wait_for(element)
    wait_until { element.visible? }
  end
end
