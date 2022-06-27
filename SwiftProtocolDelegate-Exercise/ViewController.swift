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
        
        // Assign self (ViewController) as the delegate
        
        
        // present settingVC modally
        navigationController?.present(UINavigationController(rootViewController: settingVC), animated: true)
    }
}
