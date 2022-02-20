# frozen_string_literal: true

module Messages
  def self.errors
    {
      required_fields: I18n.t('messages.errors.required_field')
    }
  end
end
