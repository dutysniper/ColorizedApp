//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Константин Натаров on 23.03.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    @IBOutlet weak var shape: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeColor(_ sender: UISlider) {
        shape.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
        setValue(for: redValue)
        setValue(for: greenValue)
        setValue(for: blueValue)
        
    }
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValue: redValue.text = String(format: "%.2f", redSlider.value)
            case greenValue: greenValue.text = String(format: "%.2f", greenSlider.value)
            default: blueValue.text = String(format: "%.2f", blueSlider.value)
            }
        }
    }
}

