//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by 김지환 on 2021/11/09.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet var email: UITextField!
    @IBOutlet var refresh: UISwitch!
    @IBOutlet var interval: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        
//        let preVC = self.presentingViewController
//        guard let vc = preVC as? ViewController else {
//            return
//        }
//
//        vc.paramEmail = self.email.text
//        vc.paramRefresh = self.refresh.isOn
//        vc.paramInterval = self.interval.value
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        ad?.paramEmail = self.email.text
        ad?.paramRefresh = self.refresh.isOn
        ad?.paramInterval = self.interval.value
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
