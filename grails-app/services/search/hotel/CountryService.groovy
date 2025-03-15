package search.hotel

import grails.gorm.services.Service

@Service(Countries)
interface CountryService {

    Countries get(Serializable id)

    List<Countries> list(Map args)

    Long count()

    Countries save(Countries country)

    void delete(Serializable id)
}