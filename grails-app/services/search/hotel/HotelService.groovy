package search.hotel

import grails.gorm.transactions.Transactional
import grails.validation.ValidationException

@Transactional
class HotelService {

    Hotels get(Serializable id) {
        return Hotels.get(id)
    }

    List<Hotels> list(Map args) {
        return Hotels.list(args)
    }

    Long count() {
        return Hotels.count()
    }

    Map save(Hotels hotel) {
        if (!hotel.validate()) {
            return [success: false, errors: hotel.errors]
        }
        hotel.save(flush: true)
        return [success: true, hotel: hotel]
    }

    void delete(Serializable id) {
        Hotels hotel = Hotels.get(id)
        if (hotel) {
            hotel.delete(flush: true)
        }
    }
}
