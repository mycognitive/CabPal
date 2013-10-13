package cabpal

class Booking {

    String sourceAddress
    String destinationAddress

    String phone
    String clientName

    Date journeyTime = new Date()
    Date createdTime = new Date()

    static belongsTo = [company: Company]

    boolean isConfirmed = false
    int estimatedTime = 0
    int cost = 0

    boolean isComplete = false

    static constraints = {
        sourceAddress nullable: false, unique: false, blank: false
        destinationAddress nullable: true, unique: false, blank: true
        clientName nullable: false, unique: false, blank: false
        journeyTime nullable: false, unique: false, blank: false
        createdTime nullable: false, unique: false, blank: false
        isConfirmed nullable: false, unique: false, blank: false
        estimatedTime nullable: true,   unique: false, blank: false
        cost nullable: true, unique: false, blank: false
        isComplete nullable: false, unique: false, blank:false
        phone nullable: false, unique: false, blank:false, matches: "[0-9]*"
    }
}