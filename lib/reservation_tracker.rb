module Hotel
class ReservationTracker

  attr_reader :reservations

  def initialize
    @reservations = []
  end

  def add_reservation(reservation)

    unless reservation.class == Hotel::Reservation
      raise ArgumentError, "Please input a valid reservation"
    end
    @reservations << reservation
  end

  def sortby_startdate
    @reservations.sort_by!{ |reservation| reservation.start_date }
  end

  def list_rooms
    return [*1..20]
  end

  def select_room
    return 1
  end

  def reservations_during_date(date)

    valid_reservations = @reservations.find_all do |reservation|
      reservation.date_within_reservation?(date)
    end

    return valid_reservations.empty? ? nil : valid_reservations
  end


end
end
