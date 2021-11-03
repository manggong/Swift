//
//  ViewController.swift
//  Scene-CustomSegue
//
//  Created by 김지환 on 2021/11/03.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("before segue")
    }
}

