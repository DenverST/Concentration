//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Denver Stove on 12/10/18.
//  Copyright © 2018 Denver Stove. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {


    let themes = [
        "Sports":"⚽️🏀🏈⚾️🎾🏐🏉🎱🏓🏸🏒🏑",
        "Halloween":"🎃👻🦇☃️⛄️🍭🍬🎩👹👺👿😈",
        "Tricky":"⌛️🤞✌️⏳⚒🛠🕐🕑◾️◼️🔡🔠",
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                if let cvc = segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }
}


