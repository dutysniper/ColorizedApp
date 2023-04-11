//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Константин Натаров on 23.03.2023.
//

import UIKit

final class SettingsViewController: UIViewController {

//MARK: IBOutlets
    @IBOutlet private var colorLabels: [UILabel]!
    
    @IBOutlet private var sliders: [UISlider]!
    
    @IBOutlet weak var shape: UIView!
    
    var viewBackgroundColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
//MARK: IBActions
   
    @IBAction private func sliderAction(_ sender: UISlider) {
        setColor()
        switch sender {
        case sliders[0]:
            colorLabels[0].text = stringFormatting(for: sliders[0])
        case sliders[1]:
            colorLabels[1].text = stringFormatting(for: sliders[1])
        default:
            colorLabels[2].text = stringFormatting(for: sliders[2])
        }
    }
    
    
//MARK: Private methods
    private func setColor() {
        shape.backgroundColor = UIColor(
            red: CGFloat(sliders[0].value),
            green: CGFloat(sliders[1].value),
            blue: CGFloat(sliders[2].value),
            alpha: 1)
    }
    
    
    private func stringFormatting(for slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    private func setupUI() {
        shape.layer.cornerRadius = 15
        guard let colors = viewBackgroundColor?.cgColor.components else { return }
        
        for label in colorLabels {
            label.font = UIFont.monospacedDigitSystemFont(
                ofSize: UIFont.systemFontSize,
                weight: UIFont.Weight.regular)
        }
        for (label, (slider, color)) in zip(colorLabels, zip(sliders, colors)) {
            slider.value = Float(color)
            label.text = stringFormatting(for: slider)
        }
        setColor()
        }

    }

