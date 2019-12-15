//
//  User.swift
//  GeekBrainsUIApp
//
//  Created by Kirill Khudiakov on 30.11.2019.
//  Copyright © 2019 Kirill Khudiakov. All rights reserved.
//

import Foundation


enum Sex {
    case unsetted, male, female
}

struct User {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
    let avatar: String
    let sex: Sex
    let location: String?
    let isOnline: Bool
}

extension User {
    var name: String {
        return "\(firstName) \(lastName)".trimmingCharacters(in: [" "])
    }
}


extension User {
    static let items = [
        User(id: "1", firstName: "Дмитрий", lastName: "Глуховский", email: "dima@mail.ru", phone: "+7 903 000-00-00", avatar: "dima", sex: .male, location: "Москва", isOnline: false),
        User(id: "2", firstName: "Сандрин", lastName: "Лимс", email: "sandrin.lims@mail.ru", phone: "+7 903 000-00-00", avatar: "lena", sex: .female, location: "Москва", isOnline: false),
        User(id: "3", firstName: "Эон", lastName: "Флакс", email: "eon.flux@mail.ru", phone: "+7 903 000-00-00", avatar: "jana", sex: .female, location: nil, isOnline: false),
        User(id: "4", firstName: "Игорь", lastName: "Ботов", email: "botov@mail.ru", phone: "+7 917 000-00-00", avatar: "igor", sex: .male, location: "Санкт-Петербург", isOnline: false),
        User(id: "5", firstName: "Мария", lastName: "Гурова", email: "narusova@mail.ru", phone: "+7 903 000-00-00", avatar: "mary", sex: .female, location: "Екатеринбург", isOnline: true),
        User(id: "6", firstName: "Захар", lastName: "Боровой", email: "zevs@mail.ru", phone: "+7 903 000-00-00", avatar: "zahar", sex: .male, location: "Москва", isOnline: false),
        User(id: "7", firstName: "Дарья", lastName: "Грач", email: "daria.grach@mail.ru", phone: "+7 903 000-00-00", avatar: "", sex: .female, location: "Москва", isOnline: false),
        User(id: "8", firstName: "Дарья", lastName: "Филатова", email: "zevs@mail.ru", phone: "+7 903 000-00-00", avatar: "jana", sex: .female, location: "Москва", isOnline: false),
        User(id: "9", firstName: "Анна", lastName: "Батистова", email: "anna.lims@mail.ru", phone: "+7 903 000-00-00", avatar: "lena", sex: .female, location: "Москва", isOnline: false),
    ]
}


extension User: Hashable {}
