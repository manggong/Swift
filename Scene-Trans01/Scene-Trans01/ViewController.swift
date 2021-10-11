//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by 김지환 on 2021/10/11.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveNextPage(_ sender: Any) {
    
        let uvc = self.storyboard!.instantiateViewController(identifier: "SecondVC")
        
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        self.present(uvc, animated: true)
    }
    
}
