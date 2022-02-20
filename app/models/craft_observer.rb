# frozen_string_literal: true

class CraftObserver < ActiveRecord::Observer
  def before_save(craft)
    craft_params = { segment: craft.segment,
                     kind: craft.kind,
                     season: craft.season,
                     year: craft.year,
                     exclusivity: ActiveModel::Type::Boolean.new.cast(craft.exclusivity) }

    craft.reference = Reference.new(craft_params).generate
  end
end
