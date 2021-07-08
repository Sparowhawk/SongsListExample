//
//  DateFormatter.swift
//  MusicList (iOS)
//
//  Created by Dylan Nienberg on 7/8/21.
//

import Foundation

class DateUtils : NSObject {
    
    func convertDateFormatFromStartingFormatToEndingFormat(date:String, startingFormat:String, endingFormat:String) -> String{
        if let date = dateFormatter(dateFormat: startingFormat, timeZone: "UTC").date(from: date) {
            return dateFormatter(dateFormat: endingFormat, timeZone: "UTC").string(from: date)
        }else{
            return date
        }
    }
    
    func dateFormatter(dateFormat:String, timeZone:String) -> DateFormatter{
        let df = DateFormatter()
        df.dateFormat = dateFormat
        switch timeZone {
        case "UTC":
            df.timeZone = NSTimeZone(abbreviation: "UTC") as TimeZone?
            break
        default:
            df.timeZone = NSTimeZone(name: timeZone) as TimeZone?
        }
        return df
    }
}
