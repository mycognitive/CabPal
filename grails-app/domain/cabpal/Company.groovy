package cabpal

class Company {

    String name
    String phone
    Address address
    String email

    static constraints = {
        name nullable: false, unique: false, blank: false
        phone nullable: false, unique: true, blank: false
        address nullable: false, unique: true, blank: false
        email nullable: false, unique: true, blank: false, email: true
    }
}
