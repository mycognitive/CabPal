package cabpal

class Address {

    String line1
    String line2
    String postcode
    String city

    static constraints = {
        line1 nullable: false, blank: false, unique: false
        line2 nullable: true, blank: true, unique: false
        postcode nullable: false, blank: false, unique: false
    }
}
