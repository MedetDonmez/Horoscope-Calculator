//
//  DateManager.swift
//  Horoscope Calculator
//
//  Created by Medet Dönmez on 29.08.2022.
//

import Foundation
import UIKit
struct DateManager{
    
    var years: UIDatePicker
    var times: UIDatePicker
    
    
    func getDateModel() ->DateModel?{
        let date1 = years.date
        let date2 = times.date

        let components = date1.get(.day, .month, .year)
        let components2 = date2.get(.day, .month, .hour)
        let hour = components2.hour
        let month = components.month
        let day = components.day
        let birthday = DateModel(month: month ?? 0, day: day ?? 0, hour: hour ?? 0)
        return birthday
    }
    
    //a function that takes a DateModel which includes info about our birthday then returns our Zodiac sign as a string. ->>
    func zodiacSign(a: DateModel!) ->String {
        var zodiac = ""
        let birthday = a
        if (birthday!.month == 1){
            if(birthday!.day < 21) {
                zodiac = "Capricorn"
            }
            else {
                zodiac = "Aquarius"
            }
        }
        if (birthday!.month == 2){
            if(birthday!.day < 19) {
                zodiac = "Aquarius"
            }
            else {
                zodiac = "Pisces"
            }
        }
        if (birthday!.month == 3){
            if(birthday!.day < 21) {
                zodiac = "Pisces"
            }
            else {
                zodiac = "Aries"
            }
        }
        if (birthday!.month == 4){
            if(birthday!.day < 20) {
                zodiac = "Aries"
            }
            else {
                zodiac = "Taurus"
            }
        }
        if (birthday!.month == 5){
            if(birthday!.day < 21) {
                zodiac = "Taurus"
            }
            else {
                zodiac = "Gemini"
            }
        }
        if (birthday!.month == 6){
            if(birthday!.day < 21) {
                zodiac = "Gemini"
            }
            else {
                zodiac = "Cancer"
            }
        }
        if (birthday!.month == 7){
            if(birthday!.day < 23) {
                zodiac = "Cancer"
            }
            else {
                zodiac = "Leo"
            }
        }
        if (birthday!.month == 8){
            if(birthday!.day < 23) {
                zodiac = "Leo"
            }
            else {
                zodiac = "Virgo"
            }
        }
        if (birthday!.month == 9){
            if(birthday!.day < 23) {
                zodiac = "Virgo"
            }
            else {
                zodiac = "Libra"
            }
        }
        if (birthday!.month == 10){
            if(birthday!.day < 23) {
                zodiac = "Libra"
            }
            else {
                zodiac = "Scorpio"
            }
        }
        if (birthday!.month == 11){
            if(birthday!.day < 22) {
                zodiac = "Scorpio"
            }
            else {
                zodiac = "Sagittarius"
            }
        }
        if (birthday!.month == 12){
            if(birthday!.day < 22) {
                zodiac = "Sagittarius"
            }
            else {
                zodiac = "Capricorn"
            }
        }
        return zodiac
    }
    
    
//function that takes our zodiac sign and birthday's hour then returns rising sign as a String.
    func risingSign(zodiacSign: String, hour:Int )-> String{
        
        let horoscopes = ["Aquarius","Pisces","Aries","Taurus","Gemini","Cancer","Leo","Virgo","Libra","Scorpio","Sagittarius","Capricorn"]
        
        var signOrder = horoscopes.firstIndex(of: zodiacSign)!
        //rising sign calculation by birthday time.
        switch hour {
        case 6...7:
             signOrder += 1
        
        case 8...9:
            signOrder += 2
            
        case 10...11:
            signOrder += 3
            
        case 12...13:
            signOrder += 4
            
        case 14...15:
            signOrder += 5
            
        case 16...17:
            signOrder += 6
        
        case 18...19:
            signOrder += 7
            
        case 20...21:
            signOrder += 8
            
        case 22...23:
            signOrder += 9
                        
        case 2...3:
            signOrder += 11
            
        case 4...5:
            signOrder += 0
            
        default:
            signOrder += 10
        }
        if (signOrder>11){
            signOrder = signOrder%12 //mod 12 to avoid out of index error.
        }
        let n = horoscopes[signOrder]
        return n
    }

}

