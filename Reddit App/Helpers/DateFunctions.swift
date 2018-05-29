//
//  DateFunctions.swift
//  Related to date conversions and time intervals
//
//  Created by Jemimah Beryl M. Sai on 16/05/2018.
//  Copyright © 2018 Jemimah Beryl M. Sai. All rights reserved.
//

import Foundation

class MyDate { // converting date related values
    
    let calender = Calendar.autoupdatingCurrent
    let format = DateFormatter()
    var today: Date { return Date() } // current date
    
    
    func unixToDate (_ createdUTC: Double) -> Date { // convert unix time to a date
        
        let myDate = Date(timeIntervalSince1970: createdUTC)
        
        format.dateFormat = "yyyy-MM-dd hh:mm a"
        format.timeZone = TimeZone(identifier: TimeZone.current.identifier)
        
        return myDate
    }
    
    
    func compareDateByHour(_ createdDate:Date, _ currentDate:Date) -> Int { // count time interval of today's date and date when post was created
        
        return Calendar.current.dateComponents([.hour], from: createdDate, to: currentDate).hour!
    
    }
    
    
    func convertDate(_ hourInterval: Double) -> String {
        
        let min = hourInterval * 60 // for every 60min is 1hr
        let day = hourInterval / 24 // for every 24hr is 1d
        let week = day / 7 // for every 7d is 1w
        let month = week / 4.35 // for every 1m there is 4.35w as per computations
        let year = month / 12 // for every 1y there are 12m
        
        if min >= 1440 {
            
            if day < 7 {
                return "\(Int(day.rounded())) d" // by days
            } else {
                
                if week < 4.35 {
                    return "\(Int(week.rounded())) w" // by weeks
                } else {
                    
                    if month < 12 {
                        return "\(Int(month.rounded())) m" // by months
                    } else {
                        return "\(Int(year.rounded())) y" // by years
                    }
                }
                
            }
            
        } else if min >= 60 && min < 1440 {
            return "\(Int(hourInterval.rounded())) h" // by hours
        }  else if min > 1 && min < 60 {
            return "\(Int(min.rounded())) min" // by minutes
        } else {
            return "Now" // by seconds
        }
    }
    
}

