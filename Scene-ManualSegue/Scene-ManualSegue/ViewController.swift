//
//  ViewController.swift
//  Scene-ManualSegue
//
//  Created by 김지환 on 2021/11/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func wind(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualWind", sender: self)
    }
    
    @IBAction func unwindToVC(_ segue: UIStoryboardSegue) {
        
    }
}

