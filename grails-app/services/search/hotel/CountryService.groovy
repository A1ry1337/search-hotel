package search.hotel

import grails.gorm.transactions.Transactional

@Transactional
class CountryService {

    Countries get(Serializable id) {
        return Countries.get(id)
    }

    List<Countries> list(Map args) {
        return Countries.list(args)
    }

    Long count() {
        return Countries.count()
    }


    Map save(Countries country) {
        if (!country.validate()) {
            return [success: false, errors: country.errors]
        }
        country.save(flush: true)
        return [success: true, country: country]
    }

    void delete(Serializable id) {
        Countries country = Countries.get(id)
        if (country) {
            country.delete(flush: true)
        }
    }
}