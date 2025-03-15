package search.hotel

class Countries {
    String name
    String cityCapital

    static constraints = {
        name maxSize: 255
        cityCapital maxSize: 128

        name nullable: false
        cityCapital nullable: false
    }

    String toString() {
        name
    }
}
