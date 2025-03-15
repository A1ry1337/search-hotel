package search.hotel

class HotelController {
    HotelService hotelService
    HotelSearchService hotelSearchService
    CountryService countryService

    def index(Integer max, Integer offset) {
        params.max = max ?: 10
        params.offset = offset ?: 0
        [
                hotels: hotelService.list(params),
                total: hotelService.count(),
                countries : countryService.list([:])
        ]

    }

    def search(Integer max, Integer offset, String search, Long countryId) {
        params.max = max ?: 10
        params.offset = offset ?: 0

        [
                hotels: hotelSearchService.searchHotels(search, countryId, params),
                total: hotelSearchService.count(search, countryId),
                countries: countryService.list([:]),
                search: search,
                countryId: countryId
        ]
    }

    def show(Long id) {
        def hotel = hotelService.get(id)
        if (!hotel) {
            flash.message = "Отель не найден"
            redirect(action: "index")
            return
        }
        [hotel: hotel]
    }

    def create() {
        def countries = countryService.list([:])
        [hotel: new Hotels(), countries: countries]
    }

    def save() {
        def hotel = new Hotels(params)
        if (hotelService.save(hotel)) {
            flash.message = "Отель успешно создан"
            redirect(action: "index")
        } else {
            render(view: "create", model: [hotel: hotel])
        }
    }

    def edit(Long id) {
        def countries = countryService.list([:])
        def hotel = hotelService.get(id)
        if (!hotel) {
            flash.message = "Отель не найден"
            redirect(action: "index")
            return
        }
        [hotel: hotel, countries: countries]
    }

    def update(Long id) {
        def hotel = hotelService.get(id)
        if (!hotel) {
            flash.message = "Отель не найден"
            redirect(action: "index")
            return
        }

        hotel.properties = params
        if (hotelService.save(hotel)) {
            flash.message = "Отель успешно обновлён"
            redirect(action: "show", id: id)
        } else {
            render(view: "edit", model: [hotel: hotel])
        }
    }

    def delete(Long id) {
        if (hotelService.get(id)) {  // Проверяем, существует ли запись
            hotelService.delete(id)
            flash.message = "Отель успешно удалён"
        } else {
            flash.message = "Отель не найден"
        }
        redirect(action: "index")
    }


}
