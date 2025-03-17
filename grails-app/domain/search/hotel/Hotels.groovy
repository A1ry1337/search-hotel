package search.hotel

class Hotels {
    String name
    Countries country
    int stardom
    String website

    static belongsTo = [country: Countries]

    static constraints = {
        name maxSize: 255, unique: true

        country nullable: false
        name nullable: false
        stardom nullable: false, range: 1..5
        website nullable: true, url: true
    }

    String toString() {
        name
    }
}
