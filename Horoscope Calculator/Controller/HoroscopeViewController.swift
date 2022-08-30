//
//  ViewController.swift
//  Horoscope Calculator
//
//  Created by Medet Dönmez on 29.08.2022.
//

import UIKit

class HoroscopeViewController: UIViewController {
    
    
    
    var zodiacImage = #imageLiteral(resourceName: "Leo")
    var risingImage = #imageLiteral(resourceName: "Leo")
    let horoscopes = ["Aquarius","Pisces","Aries","Taurus","Gemini","Cancer","Leo","Virgo","Libra","Scorpio","Sagittarius","Capricorn"]
    
    //image array according to horoscope order
    let images = [#imageLiteral(resourceName: "Aquarius"), #imageLiteral(resourceName: "Balık"), #imageLiteral(resourceName: "Aries"), #imageLiteral(resourceName: "Taurus"), #imageLiteral(resourceName: "Gemini"), #imageLiteral(resourceName: "Cancer"), #imageLiteral(resourceName: "Leo"), #imageLiteral(resourceName: "Virgo"), #imageLiteral(resourceName: "Libra"), #imageLiteral(resourceName: "Scorpius"), #imageLiteral(resourceName: "Sagittarius"), #imageLiteral(resourceName: "Capricorn")]
    
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        
        let mainDate = DateManager(years: datePicker!, times: timePicker!)
        let birthday = mainDate.getDateModel()
        
        //calculating our zodiac by birthday then picking image by it's index.
        let zodiac = mainDate.zodiacSign(a: birthday)
        let zodiacOrder = horoscopes.firstIndex(of: zodiac)!
        zodiacImage = images[zodiacOrder]
        
        //calculating our zodiac by birthday's hour and zodiac sign
        //then picking image by the index.
        let rising = mainDate.risingSign(zodiacSign: zodiac, hour: birthday!.hour)
        let risingOrder = horoscopes.firstIndex(of: rising)!
        risingImage = images[risingOrder]
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        datePicker = sender
    }
    
    @IBAction func hourPickerChanged(_ sender: UIDatePicker) {
        timePicker = sender
    }
    
    override func viewDidLoad() {
        cityText.delegate = self
        super.viewDidLoad()
        }
    
//segue to our result screen.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            //sending our UIImage values that we calculate to destinationVC.
            destinationVC.zodiac = zodiacImage
            destinationVC.rising = risingImage
        }
    }
    

}
//MARK: - Date extension for taking components of selected date.

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

//MARK: - UITextFieldDelegate

extension HoroscopeViewController: UITextFieldDelegate {
    
    @IBAction func searchPressed(_ sender: UIButton) {
        cityText.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cityText.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if cityText.text != "" {
            return true
        } else {
            cityText.placeholder = "Type something"
            return false
        }
    }

}


