//
//  ViewController.swift
//  BountyList
//
//  Created by 김지환 on 2021/10/18.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let nameList = ["brook", "chopper", "franky", "nami", "luffy", "robin", "sanji", "zoro"]
    let bountyList = [3300000, 50, 440000000, 300000000, 160000000, 80000000, 77000000, 120000000]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 몇개?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
    // 보여줄 셀
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let img = UIImage(named: "\(nameList[indexPath.row])")
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        
        return cell
    }
    
    // 이벤트 액션
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("-->\(indexPath)")
    }

}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}

