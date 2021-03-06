//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by Ao Li on 2021-10-08.
//

import Foundation
import SwiftUI
import UIKit

struct DailyScrum: Identifiable{
    let id: UUID
    var title: String
    var attendees: [String]
    var lengthInMinutes: Int
    var color: Color
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, color: Color) {
            self.id = id
            self.title = title
            self.attendees = attendees
            self.lengthInMinutes = lengthInMinutes
            self.color = color
        }
}

extension DailyScrum {
    static var data: [DailyScrum] {
        [
            DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, color: Color.yellow),
            DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, color: Color.orange),
            DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 1, color: Color.red)
        ]
    }
}

extension DailyScrum {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var lengthInMinutes: Double = 5.0
        var color: Color = .pink
    }
    
    var data: Data {
            return Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), color: color)
    }
}
