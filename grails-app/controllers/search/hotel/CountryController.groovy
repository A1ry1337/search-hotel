package search.hotel

class CountryController {

    CountryService countryService

    def index(Integer max, Integer offset) {
        params.max = max ?: 10
        params.offset = offset ?: 0

        [countries: countryService.list(params), total: countryService.count()]
    }

    def show(Long id) {
        def country = countryService.get(id)
        if (!country) {
            flash.message = "Страна не найдена"
            redirect(action: "index")
            return
        }
        [country: country]
    }

    def create() {
        [country: new Countries()]
    }

    def save() {
        def country = new Countries(params)
        if (countryService.save(country)) {
            flash.message = "Страна успешно создана"
            redirect(action: "index")
        } else {
            render(view: "create", model: [country: country])
        }
    }

    def edit(Long id) {
        def country = countryService.get(id)
        if (!country) {
            flash.message = "Страна не найдена"
            redirect(action: "index")
            return
        }
        [country: country]
    }

    def update(Long id) {
        def country = countryService.get(id)
        if (!country) {
            flash.message = "Страна не найдена"
            redirect(action: "index")
            return
        }

        country.properties = params
        if (countryService.save(country)) {
            flash.message = "Страна успешно обновлена"
            redirect(action: "show", id: id)
        } else {
            render(view: "edit", model: [country: country])
        }
    }

    def delete(Long id) {
        if (countryService.get(id)) {
            countryService.delete(id)
            flash.message = "Страна успешно удалена"
        } else {
            flash.message = "Страна не найдена"
        }
        redirect(action: "index")
    }
}
