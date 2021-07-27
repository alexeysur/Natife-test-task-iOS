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
        let date = Date(timeIntervalSince1970: epochTime)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let str = dateFormatter.string(from: date)
        return str
    }
}
