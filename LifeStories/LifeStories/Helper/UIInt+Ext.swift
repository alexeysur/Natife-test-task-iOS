//
//  UIInt+Ext.swift
//  LifeStories
//
//  Created by Alexey on 27.07.2021.
//

import Foundation

extension Int {
    func toDate() -> String {
        let epochTime = TimeInterval(self) / 1000
        let dateBack = Date(timeInterval: -epochTime, since: Date())
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "D"
        let daysAgo = dateFormatter.string(from: dateBack)
 
        dateFormatter.dateFormat = "HH:mm"
        let hoursAgo = dateFormatter.string(from: dateBack)
        return daysAgo + " д. " + hoursAgo
    }
}
