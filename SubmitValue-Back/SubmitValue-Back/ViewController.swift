//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by 김지환 on 2021/11/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultRefresh: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    var paramEmail: String?
    var paramRefresh: Bool?
    var paramInterval: Double?

    override func viewWillAppear(_ animated: Bool) {
//        if let email = paramEmail {
//            resultEmail.text = email
//        }
//        if let refresh = paramRefresh {
//            resultRefresh.text = refresh == true ? "자동갱신" : "자동갱신안함"
//        }
//        if let interval = paramInterval {
//            resultInterval.text = "\(Int(interval))분마다"
//        }
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        if let email = ad?.paramEmail {
            resultEmail.text = email
        }
        if let refresh = ad?.paramRefresh {
            resultRefresh.text = refresh == true ? "자동갱신" : "자동갱신안함"
        }
        if let interval = ad?.paramInterval {
            resultInterval.text = "\(Int(interval))분마다"
        }

    }
}

