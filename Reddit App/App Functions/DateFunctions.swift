//
//  DateFunctions.swift
//  Related to date conversions and time intervals
//
//  Created by Jemimah Beryl M. Sai on 16/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation

class MyDate {
    let calender = Calendar.autoupdatingCurrent
    let format = DateFormatter()
    var today: Date { return Date() }
    
    func unixToDate (_ createdUTC: Double) -> Date {
        let myDate = Date(timeIntervalSince1970: createdUTC)
        format.dateFormat = "yyyy-MM-dd hh:mm a"
        format.timeZone = TimeZone(identifier: TimeZone.current.identifier )
        return myDate
    }
    
    func compareDateByHour(_ createdDate:Date, _ currentDate:Date) -> Int {
        return Calendar.current.dateComponents([.hour], from: createdDate, to: currentDate).hour!
    }
    
    func convertDate(_ hourInterval: Double) -> String {
        let min = hourInterval * 60 // for every 60min is 1hr
        let day = hourInterval / 24 // for every 24hr is 1d
        let week = day / 7 // for every 7d is 1w
        let month = week / 4.35
        let year = month / 12
        if min >= 1440 {
            if day < 7 {
                return "\(Int(day.rounded())) d"
            } else {
                if week < 4.35 {
                    return "\(Int(week.rounded())) w"
                } else {
                    if month < 12 {
                        return "\(Int(month.rounded())) m"
                    } else {
                        return "\(Int(year.rounded())) y"
                    }
                }
            }
        } else if min >= 60 && min < 1440 {
            return "\(Int(hourInterval.rounded())) h"
        }  else if min > 0 && min < 60 {
            return "\(Int(min.rounded())) min"
        } else {
            return "Just Now"
        }
    }
}

