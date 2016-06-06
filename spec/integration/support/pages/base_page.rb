class BasePage
  include PageObject

  div(:flash_message, id: 'flash-message-box')
end
