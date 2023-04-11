//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Константин Натаров on 23.03.2023.
//

import UIKit

final class SettingsViewController: UIViewController {

//MARK: IBOutlets
    @IBOutlet weak var redValue: UILabel!
    @IBOutlet weak var greenValue: UILabel!
    @IBOutlet weak var blueValue: UILabel!
    
    @IBOutlet weak var shape: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setColor()
    }
    
//MARK: IBActions
   
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case redSlider:
            redValue.text = stringFormatting(for: redSlider)
        case greenSlider:
            greenValue.text = stringFormatting(for: greenSlider)
        default:
            blueValue.text = stringFormatting(for: blueSlider)
        }
    }
    
    
//MARK: Private methods
    private func setColor() {
        shape.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    
    private func stringFormatting(for slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setupUI() {
        shape.layer.cornerRadius = 15
        redValue.text = stringFormatting(for: redSlider)
        greenValue.text = stringFormatting(for: redSlider)
        blueValue.text = stringFormatting(for: redSlider)
        for label in [redValue, greenValue, blueValue] {
            label?.font = UIFont.monospacedDigitSystemFont(
                ofSize: UIFont.systemFontSize,
                weight: UIFont.Weight.regular)
        }
        
    }
}

