package cabpal

class Booking {

    Address source
    Address destination
    Date journeyTime = new Date()
    Date createdTime = new Date()
    static belongsTo = [company: Company, client: Client]

    boolean isConfirmed = false
    Date estimatedTime = null
    Currency cost = null


    static constraints = {
        source nullable: false, unique: false, blank: false
        destination nullable: true, unique: false, blank: true
        journeyTime nullable: false, unique: false, blank: false
        createdTime nullable: false, unique: false, blank: false
        isConfirmed nullable: false, unique: false, blank: false
        estimatedTime nullable: true,   unique: false, blank: false
        cost nullable: true, unique: false, blank: false
    }
}
