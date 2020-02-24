class Character < ApplicationRecord
  validates :pseudonym, presence: true
  validate :only_one_character_per_camp

  belongs_to :account
  belongs_to :camp

  def exhausted?
    false
  end

  private

  def only_one_character_per_camp
    return if camp.nil? || no_character_already_in_camp?

    errors.add(:camp, 'an account can only have one character per camp')
  end

  def no_character_already_in_camp?
    camp
      .characters
      .where(account: account)
      .reject { |c| c == self }
      .empty?
  end
end
