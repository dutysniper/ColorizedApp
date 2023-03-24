//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Константин Натаров on 23.03.2023.
//

import UIKit

final class ViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var redValue: UILabel! {
        didSet {
            redValue.font = UIFont.monospacedDigitSystemFont(
                ofSize: UIFont.systemFontSize,
                weight: UIFont.Weight.regular)
        }
    }
    @IBOutlet weak var greenValue: UILabel! {
        didSet {
            greenValue.font = UIFont.monospacedDigitSystemFont(
                ofSize: UIFont.systemFontSize,
                weight: UIFont.Weight.regular)
        }
    }
    @IBOutlet weak var blueValue: UILabel! {
        didSet {
            blueValue.font = UIFont.monospacedDigitSystemFont(
                ofSize: UIFont.systemFontSize,
                weight: UIFont.Weight.regular)
        }
    }
    @IBOutlet weak var shape: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shape.layer.cornerRadius = 15
        setColor()
    }
    
    //MARK: IBActions
    @IBAction func changeColorFromSlider() {
        setColor()
    }
    
   //MARK: Private methods
    private func setColor() {
        shape.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
        setValue(for: redValue, blueValue, greenValue)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redValue: redValue.text = stringFormatting(for: redSlider)
            case greenValue: greenValue.text = stringFormatting(for: greenSlider)
            default: blueValue.text = stringFormatting(for: blueSlider)
            }
        }
    }
    
    private func stringFormatting(for slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

