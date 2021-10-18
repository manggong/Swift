//
//  ViewController.swift
//  BountyList
//
//  Created by 김지환 on 2021/10/18.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 몇개?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // 보여줄 셀
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    // 이벤트 액션
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("-->\(indexPath)")
    }

}

