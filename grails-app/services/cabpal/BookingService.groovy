package cabpal

import grails.transaction.Transactional

@Transactional
class BookingService {

    def clientBooking(params) {
        Booking booking = new Booking(params)
        //Trillio call comes here.


    }

    def bookingResponse(long bookingId, boolean isConfirmed, int timeInMinutes, Currency cost){

        Booking booking = Booking.get(bookingId)
        booking.setIsConfirmed(isConfirmed)
        booking.setEstimatedTime(new Date(date.getTime() + timeInMinutes))


    }
}
