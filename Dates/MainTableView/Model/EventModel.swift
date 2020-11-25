//
//  EventModel.swift
//  Dates
//
//  Created by Лера Тарасенко on 25.11.2020.
//

import Foundation

struct EventModel {
    var icon: Data?
    var event: String
    var date: Date
    var daysBeforeTheEventLabel: Int
    var days = "дн."
}
