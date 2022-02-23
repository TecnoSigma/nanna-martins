# frozen_string_literal: true

class CraftObserver < ActiveRecord::Observer
  def before_save(craft)
    craft_params = { description: craft.description,
                     kind: craft.type,
                     season: craft.season,
                     year: craft.year,
                     exclusivity: ActiveModel::Type::Boolean.new.cast(craft.exclusivity) }

    craft.reference = Reference.new(craft_params).generate
  end
end
