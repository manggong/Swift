//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by 김지환 on 2021/11/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "선택", message: "항목을 선택해 주세요!!!", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel) {
            (_) in self.result.text = "clicked cancel"
        }
        let ok = UIAlertAction(title: "확인", style: .default) {
            (_) in self.result.text = "clicked ok"
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func login(_ sender: Any) {
        let title = "This is title"
        let message = "This is message"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) { (_) in
            if let tf = alert.textFields?[0] {
                print("Input text is \(tf.text!)")
            } else {
                print("Input not exist")
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        alert.addTextField(configurationHandler: {
            (tf) in
            tf.placeholder = "input"
            tf.isSecureTextEntry = true
        } )
        
        self.present(alert, animated: true)
    }
    
    @IBAction func auth(_ sender: Any) {
        let msg = "login"
        let alert = UIAlertController(title: nil, message: msg, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "cancel", style: .cancel)
        let ok = UIAlertAction(title: "ok", style: .default) {  (_) in
            let id = alert.textFields?[0].text
            let pw = alert.textFields?[1].text
            
            if id == "root" && pw == "1234" {
                self.result.text = "logIn ok" } else {
                    self.result.text = "logIn fail"
                    
                }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        alert.addTextField(configurationHandler: {
            (tf) in
            tf.placeholder = "ID"
            tf.isSecureTextEntry = true
        })
        alert.addTextField(configurationHandler: {
            (tf) in
            tf.placeholder = "PW"
            tf.isSecureTextEntry = true
        })
        
        self.present(alert, animated: true)
    }
}

