package search.hotel

import grails.gorm.services.Service

@Service(Hotels)
interface HotelService {
    Hotels get(Serializable id)

    List<Hotels> list(Map args)

    Long count()

    Hotels save(Hotels hotel)

    void delete(Serializable id)
}
