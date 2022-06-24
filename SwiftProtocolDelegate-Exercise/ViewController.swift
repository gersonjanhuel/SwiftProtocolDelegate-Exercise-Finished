//
//  ViewController.swift
//  SwiftProtocolDelegate-Exercise
//
//  Created by Gerson Janhuel on 22/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var paintingImageView: UIImageView!
    @IBOutlet weak var paintingNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func openSettings(_ sender: Any) {
        let settingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        
        // assign self (ViewController) as the delegate
        settingVC.delegate = self
        
        // present settingVC modally
        navigationController?.present(UINavigationController(rootViewController: settingVC), animated: true)
    }
}

extension ViewController: SettingsViewControllerDelegate {
    func didSelectPainting(_ painting: String) {
        paintingImageView.image = UIImage(named: painting)
        paintingNameLabel.text = painting
    }
}

