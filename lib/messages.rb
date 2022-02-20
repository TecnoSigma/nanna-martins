# frozen_string_literal: true

module Messages
  def self.errors
    {
      required_field: I18n.t('messages.errors.required_field'),
      invalid_quantity: I18n.t('messages.errors.invalid_quantity'),
      invalid_format: I18n.t('messages.errors.invalid_format')
    }
  end
end
