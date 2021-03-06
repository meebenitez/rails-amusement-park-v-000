class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if self.user.tickets < self.attraction.tickets && self.user.height < self.attraction.min_height
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif self.user.tickets < self.attraction.tickets
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif self.user.height < self.attraction.min_height
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      self.user.update(:tickets => user.tickets - attraction.tickets,
                :nausea => user.nausea + attraction.nausea_rating,
                :happiness => user.happiness + attraction.happiness_rating)
      "Thanks for riding the #{self.attraction.name}!"
    end
  end

end
