package search.hotel

class Countries {
    String name
    String cityCapital

    static hasMany = [hotels: Hotels]

    static constraints = {
        name maxSize: 255,
                validator: { val, obj ->
                    Countries existingCountry = Countries.findByName(val)
                    if (existingCountry && existingCountry.id != obj.id) {
                        return ['unique.name.message']
                    }
                }
        cityCapital maxSize: 128

        name nullable: false
        cityCapital nullable: false
    }

    static mapping = {
        hotels cascade: "all-delete-orphan"
    }

    String toString() {
        name
    }
}
