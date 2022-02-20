# frozen_string_literal: true

module Regex
  class << self
    def document
      %r{\A^([0-9]{3}\.?[0-9]{3}\.?[0-9]{3}-?[0-9]{2}|[0-9]{2}\.?[0-9]{3}\.?[0-9]{3}/?[0-9]{4}-?[0-9]{2})$\z}
    end

    def cpf
      /\A\d{3}.\d{3}.\d{3}-\d{2}\z/
    end

    def email
      /\A[a-z0-9._-]+@[a-z0-9]+.[a-z0-9.]+.[a-z0-9._-]*\z/
    end

    def postal_code
      /\A\d{5}-\d{3}\z/
    end

    def telephone
      /\A\([1-9]{2}\) [0-9]{4}\ [0-9]{4}\z/
    end

    def cellphone
      /\A\([1-9]{2}\) 9 [0-9]{4}\ [0-9]{4}\z/
    end
  end
end
