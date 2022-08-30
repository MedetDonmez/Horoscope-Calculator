//
//  ResultViewController.swift
//  Horoscope Calculator
//
//  Created by Medet Dönmez on 30.08.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    var zodiac = #imageLiteral(resourceName: "Virgo")
    var rising = #imageLiteral(resourceName: "Virgo")
    
    @IBOutlet weak var zodiacImage: UIImageView!
    @IBOutlet weak var risingImage: UIImageView!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        zodiacImage.image = zodiac
        risingImage.image = rising
        super.viewDidLoad()
    }


}
