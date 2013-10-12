package cabpal

class Client {

    String firstname
    String lastname
    String phone

    static constraints = {
        firstname nullable: false, blank: false, unique: false
        lastname nullable: true, blank: true, unique: false
        phone nullable: false, blank: false, unique: false, matches:"[0-9]"
    }
}
