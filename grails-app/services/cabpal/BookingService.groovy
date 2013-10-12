package cabpal

import grails.transaction.Transactional

@Transactional
class BookingService {

    /** The Constant ACCOUNT_SID. Find it at twilio.com/user/account */
    public static final String ACCOUNT_SID = "ACb9ddd21a0383212ec56b2d209d819275"

    /** The Constant AUTH_TOKEN. Find it at twilio.com/user/account */
    public static final String AUTH_TOKEN = "a263dd37812b0ce7259142e589af20a2"

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
