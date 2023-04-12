//
//  ViewController.swift
//  ColorizedApp
//
//  Created by Константин Натаров on 23.03.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
//MARK: - IBOutlets
    @IBOutlet private var colorLabels: [UILabel]!
    
    @IBOutlet private var sliders: [UISlider]!
    
    @IBOutlet var colorValueTF: [UITextField]!
    
    
    @IBOutlet weak var shape: UIView!
    
//MARK: - Internal properties
    var viewBackgroundColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
//MARK: - Life-cycle vc
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        UITextField.appearance().inputAccessoryView = addToolBarToNumKeyboard()
    }
    
//MARK: - IBActions
    @IBAction private func sliderAction(_ sender: UISlider) {
        setColor()
        colorLabels[sender.tag].text = stringFormatting(for: sender)
        colorValueTF[sender.tag].text = stringFormatting(for: sender)
    }
    
    @IBAction func SaveButtonPressed() {
        delegate.setColor(shape.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

//MARK: - Private methods
extension SettingsViewController {
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
        for ((label, colorTF), (slider, color)) in
                zip(zip(colorLabels, colorValueTF), zip(sliders, colors)) {
            slider.value = Float(color)
            label.text = stringFormatting(for: slider)
            colorTF.text = stringFormatting(for: slider)
        }
        setColor()
        }
}

//MARK: - Keyboard setup
extension SettingsViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func addToolBarToNumKeyboard() -> UIToolbar{
        let numPadToolBar = UIToolbar()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let buttonTitle = "Done"
        let doneButton = UIBarButtonItem(
            title: buttonTitle,
            style: .done,
            target: self,
            action: #selector(onClickDoneButton)
        )
        numPadToolBar.setItems([space, doneButton], animated: false)
        numPadToolBar.sizeToFit()
        return numPadToolBar
    }
    
    @objc func onClickDoneButton() {
        view.endEditing(true)
    }
}

//MARK: - UITextFieldDelegate method
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let valueTF = textField.text else { return }
        if !(0...1).contains(Float(valueTF) ?? 5) {
            showAlert(tfTag: textField.tag)
        } else if valueTF.isEmpty {
            sliders[textField.tag].value = 0
        } else {
            guard let validValue = Float(valueTF) else { return }
            sliders[textField.tag].value = validValue
            colorLabels[textField.tag].text = String(validValue)
        }
    }
}

// MARK: - Alert Controller
extension SettingsViewController {
    func showAlert(tfTag: Int) {
        let alertMessage = UIAlertController(
            title: "Invalid format!",
            message: "Enter value from 0.0 to 1.0",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.colorValueTF[tfTag].text = ""
            self.colorValueTF[tfTag].becomeFirstResponder()
        }
        
        alertMessage.addAction(okAction)
        present(alertMessage, animated: true)
    }
}

