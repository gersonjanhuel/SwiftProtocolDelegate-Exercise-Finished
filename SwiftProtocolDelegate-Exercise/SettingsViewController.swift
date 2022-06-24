//
//  SettingsViewController.swift
//  SwiftProtocolDelegate-Exercise
//
//  Created by Gerson Janhuel on 22/06/22.
//

import UIKit


protocol SettingsViewControllerDelegate: AnyObject {
    func didSelectPainting(_ painting: String)
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var paintingPicker: UIPickerView!
    
    var paintingsResource: [String] = ["Abstract - Steve Johnson",
                                       "Birds - McGill",
                                       "Botanical - Europeana"]
    
    weak var delegate: SettingsViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Settings"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveSettings))
        
        paintingPicker.dataSource = self
        paintingPicker.delegate = self
    }
    
    @objc func saveSettings() {
        
        // dismiss modal
        dismiss(animated: true)
    }
    
}

// MARK: - UIPickerView DataSource & Delegate

extension SettingsViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return paintingsResource.count
    }
}

extension SettingsViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return paintingsResource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let painting = paintingsResource[row]
        delegate?.didSelectPainting(painting)
    }
}
