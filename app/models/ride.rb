class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  @message = ""

  def go_for_a_ride
    new_tickets = self.user.tickets - self.attraction.tickets
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    user.update(tickets: new_tickets, happiness: new_happiness, nausea: new_nausea)

    "Thanks for riding the #{self.attraction.name}!"
  end

  def take_ride
    if tall_enough? && !enough_tickets?
      "Sorry. You do not have enough tickets for the #{self.attraction.name}."
    elsif enough_tickets? && !tall_enough?
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    elsif !enough_tickets? && !tall_enough?
      "Sorry. You do not have enough tickets for the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif tall_enough? && enough_tickets?
      go_for_a_ride
    end
  end

  def tall_enough?
    self.user.height >= self.attraction.min_height
  end

  def enough_tickets?
    self.user.tickets > self.attraction.tickets
  end
end
