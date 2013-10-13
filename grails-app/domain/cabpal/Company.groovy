package cabpal

class Company {

    String name
    String phone
    String email
    static hasMany = [bookings: Booking]

    static constraints = {
        name nullable: false, unique: false, blank: false
        phone nullable: false, unique: false, blank:false, matches: "[0-9]*"
        email nullable: false, unique: true, blank: false, email: true
    }
}