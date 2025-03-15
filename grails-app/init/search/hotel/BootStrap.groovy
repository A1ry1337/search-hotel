package search.hotel

class BootStrap {

    def init = { servletContext ->
        if (Countries.count() == 0) {
            // Добавляем страны
            def russia = new Countries(name: "Россия", cityCapital: "Москва").save(failOnError: true)
            def usa = new Countries(name: "США", cityCapital: "Вашингтон").save(failOnError: true)
            def china = new Countries(name: "Китай", cityCapital: "Пекин").save(failOnError: true)
            def france = new Countries(name: "Франция", cityCapital: "Париж").save(failOnError: true)
            def germany = new Countries(name: "Германия", cityCapital: "Берлин").save(failOnError: true)
            def japan = new Countries(name: "Япония", cityCapital: "Токио").save(failOnError: true)
            def brazil = new Countries(name: "Бразилия", cityCapital: "Бразилиа").save(failOnError: true)
            def india = new Countries(name: "Индия", cityCapital: "Нью-Дели").save(failOnError: true)
            def canada = new Countries(name: "Канада", cityCapital: "Оттава").save(failOnError: true)
            def italy = new Countries(name: "Италия", cityCapital: "Рим").save(failOnError: true)
            def spain = new Countries(name: "Испания", cityCapital: "Мадрид").save(failOnError: true)
            def uk = new Countries(name: "Великобритания", cityCapital: "Лондон").save(failOnError: true)


            new Hotels(name: "Отель Москва", country: russia, stardom: 5, website: "https://hotelmoscow.ru").save(failOnError: true)
            new Hotels(name: "Отель Санкт-Петербург", country: russia, stardom: 3).save(failOnError: true)


            new Hotels(name: "Отель Нью-Йорк", country: usa, stardom: 4, website: "https://hotelnewyork.com").save(failOnError: true)
            new Hotels(name: "Отель Лос-Анджелес", country: usa, stardom: 2).save(failOnError: true)


            new Hotels(name: "Отель Пекин", country: china, stardom: 3, website: "https://hotelbeijing.com").save(failOnError: true)
            new Hotels(name: "Отель Шанхай", country: china, stardom: 5).save(failOnError: true)


            new Hotels(name: "Отель Париж", country: france, stardom: 4, website: "https://hotelparis.com").save(failOnError: true)
            new Hotels(name: "Отель Лион", country: france, stardom: 2).save(failOnError: true)


            new Hotels(name: "Отель Берлин", country: germany, stardom: 4, website: "https://hotelberlin.com").save(failOnError: true)
            new Hotels(name: "Отель Мюнхен", country: germany, stardom: 1).save(failOnError: true)


            new Hotels(name: "Отель Токио", country: japan, stardom: 3, website: "https://hoteltokyo.com").save(failOnError: true)
            new Hotels(name: "Отель Осака", country: japan, stardom: 5).save(failOnError: true)


            new Hotels(name: "Отель Рио", country: brazil, stardom: 2, website: "https://hotelrio.com").save(failOnError: true)
            new Hotels(name: "Отель Сан-Паулу", country: brazil, stardom: 4).save(failOnError: true)


            new Hotels(name: "Отель Нью-Дели", country: india, stardom: 5, website: "https://hotelnewdelhi.com").save(failOnError: true)
            new Hotels(name: "Отель Мумбаи", country: india, stardom: 1).save(failOnError: true)


            new Hotels(name: "Отель Торонто", country: canada, stardom: 3, website: "https://hoteltoronto.com").save(failOnError: true)
            new Hotels(name: "Отель Ванкувер", country: canada, stardom: 4).save(failOnError: true)


            new Hotels(name: "Отель Рим", country: italy, stardom: 2, website: "https://hotelrome.com").save(failOnError: true)
            new Hotels(name: "Отель Милан", country: italy, stardom: 5).save(failOnError: true)


            new Hotels(name: "Отель Мадрид", country: spain, stardom: 4, website: "https://hotelmadrid.com").save(failOnError: true)
            new Hotels(name: "Отель Барселона", country: spain, stardom: 3).save(failOnError: true)


            new Hotels(name: "Отель Лондон", country: uk, stardom: 5, website: "https://hotellondon.com").save(failOnError: true)
            new Hotels(name: "Отель Эдинбург", country: uk, stardom: 1).save(failOnError: true)

            println "[BootStrap]Загружены начальные данные для стран и отелей."

        }
    }
    def destroy = {
    }
}
