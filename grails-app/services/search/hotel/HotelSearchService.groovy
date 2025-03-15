package search.hotel

import grails.gorm.transactions.Transactional

@Transactional
class HotelSearchService {

    List<Hotels> searchHotels(String searchQuery, Long countryId, Map paginationParams) {
        return Hotels.where {
            if (searchQuery) {
                name =~ "%${searchQuery}%"
            }
            if (countryId) {
                country.id == countryId
            }
        }.list(paginationParams + [sort: 'stardom', order: 'desc']).sort { a, b ->
            a.stardom == b.stardom ? a.name <=> b.name : b.stardom <=> a.stardom
        }
    }

    Long count(String searchQuery, Long countryId) {
        return Hotels.where {
            if (searchQuery) {
                name =~ "%${searchQuery}%"
            }
            if (countryId) {
                country.id == countryId
            }
        }.count()
    }
}