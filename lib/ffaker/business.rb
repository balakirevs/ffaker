require 'date'

module FFaker
  module Business
    extend ModuleUtils
    extend self

    def credit_card_number
      fetch_sample(CREDIT_CARD_NUMBERS)
    end

    def credit_card_expiry_date
      ::Date.today + (365 * (rand(4) + 1))
    end

    def credit_card_type
      fetch_sample(CREDIT_CARD_TYPES)
    end

  end
end
