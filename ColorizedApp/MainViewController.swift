//
//  MainViewController.swift
//  ColorizedApp
//
//  Created by Константин Натаров on 11.04.2023.
//

import UIKit

final class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.viewBackgroundColor = view.backgroundColor
    }
}
