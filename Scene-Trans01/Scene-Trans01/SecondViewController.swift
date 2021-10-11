//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by 김지환 on 2021/10/11.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
