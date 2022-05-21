//
//  DateConfigurator.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 25.04.2022.
//

import Foundation
class DateConfigurator {
    static func configureDate(date: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let dateFormatterPrint = DateFormatter()
        let locale = Locale.current
//        print("saklmdakldmalkdlkaslkdmamd\(locale.identifier)")
        dateFormatterPrint.dateFormat = DateFormatter.dateFormat(fromTemplate: "MMM.dd, HH:mm", options: 0, locale: locale)
        let date: Date? = dateFormatterGet.date(from: date)
        return dateFormatterPrint.string(from: date!)
    }
}
/*
formatdate("Mdyyyy") // "1/2/1984"
formatdate("yyyyMMdd") // "01/02/1984"
formatdate("yyyyMMMdd") // "Jan 02, 1984"
formatdate("yyyyMMMMdd") // "January 02, 1984"
formatdate("yyyyMMMMMdd") // "J 02, 1984"
formatdate("yyyyG") // "1984 AD"
formatdate("yyyyGGGG") // "1984 Anno Domini"
formatdate("yyyyMMMddE") // "Mon, Jan 02, 1984"
formatdate("yyyyMMMddEEEE") // "Monday, Jan 02, 1984"
formatdate("yyyyMMMddEEEEE") // "M, Jan 02, 1984"

formatdate("MdYYYY") // "1/2/1984"
formatdate("YYYYMMdd") // "01/02/1984"
formatdate("YYYYMMMdd") // "Jan 02, 1984"
formatdate("YYYYMMMMdd") // "January 02, 1984"
formatdate("YYYYMMMMMdd") // "J 02, 1984"
formatdate("YYYYG") // "1984 AD"
formatdate("YYYYGGGG") // "1984 Anno Domini"
formatdate("YYYYMMMddE") // "Mon, Jan 02, 1984"
formatdate("YYYYMMMddEEEE") // "Monday, Jan 02, 1984"
formatdate("YYYYMMMddEEEEE") // "M, Jan 02, 1984"
*/
