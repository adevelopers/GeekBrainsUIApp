//
//  User.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 30.11.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import Foundation


struct User {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
    let avatar: String
    let sex: Sex
    let location: String?
}


extension User {
    var name: String {
        return "\(lastName) \(firstName)".trimmingCharacters(in: [" "])
    }
}


extension User {
    static let items = [
        User(id: "1", firstName: "Дмитрий", lastName: "Глуховский", email: "dima@mail.ru", phone: "+7 903 000-00-00", avatar: "dima", sex: .male, location: "Москва"),
        User(id: "2", firstName: "Сандрин", lastName: "Лимс", email: "sandrin.lims@mail.ru", phone: "+7 903 000-00-00", avatar: "lena", sex: .female, location: "Москва"),
        User(id: "3", firstName: "Эон", lastName: "Флакс", email: "eon.flux@mail.ru", phone: "+7 903 000-00-00", avatar: "jana", sex: .female, location: nil),
        User(id: "4", firstName: "Игорь", lastName: "Ботов", email: "botov@mail.ru", phone: "+7 917 000-00-00", avatar: "igor", sex: .male, location: "Санкт-Петербург"),
        User(id: "5", firstName: "Мария", lastName: "Нарусова", email: "narusova@mail.ru", phone: "+7 903 000-00-00", avatar: "mary", sex: .female, location: "Екатеринбург"),
        User(id: "6", firstName: "Захар", lastName: "", email: "zevs@mail.ru", phone: "+7 903 000-00-00", avatar: "zahar", sex: .female, location: "Москва"),
        User(id: "1", firstName: "Дмитрий", lastName: "Глуховский", email: "dima@mail.ru", phone: "+7 903 000-00-00", avatar: "dima", sex: .male, location: "Москва"),
        User(id: "2", firstName: "Сандрин", lastName: "Лимс", email: "sandrin.lims@mail.ru", phone: "+7 903 000-00-00", avatar: "lena", sex: .female, location: "Москва"),
        User(id: "3", firstName: "Эон", lastName: "Флакс", email: "eon.flux@mail.ru", phone: "+7 903 000-00-00", avatar: "jana", sex: .female, location: nil),
        User(id: "4", firstName: "Игорь", lastName: "Ботов", email: "botov@mail.ru", phone: "+7 917 000-00-00", avatar: "igor", sex: .male, location: "Санкт-Петербург"),
        User(id: "1", firstName: "Дмитрий", lastName: "Глуховский", email: "dima@mail.ru", phone: "+7 903 000-00-00", avatar: "dima", sex: .male, location: "Москва"),
        User(id: "2", firstName: "Сандрин", lastName: "Лимс", email: "sandrin.lims@mail.ru", phone: "+7 903 000-00-00", avatar: "lena", sex: .female, location: "Москва"),
        User(id: "3", firstName: "Эон", lastName: "Флакс", email: "eon.flux@mail.ru", phone: "+7 903 000-00-00", avatar: "jana", sex: .female, location: nil),
        User(id: "4", firstName: "Игорь", lastName: "Ботов", email: "botov@mail.ru", phone: "+7 917 000-00-00", avatar: "igor", sex: .male, location: "Санкт-Петербург"),
        User(id: "1", firstName: "Дмитрий", lastName: "Глуховский", email: "dima@mail.ru", phone: "+7 903 000-00-00", avatar: "dima", sex: .male, location: "Москва"),
        User(id: "2", firstName: "Сандрин", lastName: "Лимс", email: "sandrin.lims@mail.ru", phone: "+7 903 000-00-00", avatar: "lena", sex: .female, location: "Москва"),
        User(id: "3", firstName: "Эон", lastName: "Флакс", email: "eon.flux@mail.ru", phone: "+7 903 000-00-00", avatar: "jana", sex: .female, location: nil),
        User(id: "4", firstName: "Игорь", lastName: "Ботов", email: "botov@mail.ru", phone: "+7 917 000-00-00", avatar: "igor", sex: .male, location: "Санкт-Петербург"),
    ]
}
