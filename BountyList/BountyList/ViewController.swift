//
//  ViewController.swift
//  BountyList
//
//  Created by 김지환 on 2021/10/18.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let bountyInfoList: [BountyInfo] = [
        BountyInfo(name: "brook", bounty: 3300000),
        BountyInfo(name: "chopper", bounty: 50),
        BountyInfo(name: "franky", bounty: 440000000),
        BountyInfo(name: "nami", bounty: 160000000),
        BountyInfo(name: "luffy", bounty: 300000000),
        BountyInfo(name: "robin", bounty: 80000000),
        BountyInfo(name: "sanji", bounty: 77000000),
        BountyInfo(name: "zoro", bounty: 120000000)
    ]
    
    // 세그웨이가 수행되기 이전에 수행 됨
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                
                let bountyInfo = bountyInfoList[index]
                vc?.bountyInfo = bountyInfo
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 몇개?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyInfoList.count
    }
    
    // 보여줄 셀
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        let bountyInfo = bountyInfoList[indexPath.row]
        cell.imgView.image = bountyInfo.image
        cell.nameLabel.text = bountyInfo.name
        cell.bountyLabel.text = "\(bountyInfo.bounty)"
        
        return cell
    }
    
    // 이벤트 액션
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }

}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
