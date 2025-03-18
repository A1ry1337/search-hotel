package search.hotel

class Hotels {
    String name
    Countries country
    int stardom
    String website

    static belongsTo = [country: Countries]

    static constraints = {
        name maxSize: 255,
                validator: { val, obj ->
                    Hotels existingHotel = Hotels.findByNameAndCountry(val, obj.country)
                    if (existingHotel && existingHotel.id != obj.id) {
                        return ['unique.name.message']
                    }
                }

        country nullable: false
        name nullable: false
        stardom nullable: false, range: 1..5
        website nullable: true, url: true
    }

    String toString() {
        name
    }
}
