# frozen_string_literal: true

module CustomersHelper
  def change_color_status(customer)
    return '' if customer.pendent?

    customer.activated? ? 'status-activated'  : 'status-deactivated'
  end
end
