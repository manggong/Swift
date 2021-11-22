//
//  TheaterListController.swift
//  MyMovieChart
//
//  Created by 김지환 on 2021/11/22.
//

import UIKit

class TheaterListController: UITableViewController {
    
    var list = [NSDictionary]()
    var startPoint = 0

    override func viewDidLoad() {
        self.callTheaterAPI()
    }
    
    func callTheaterAPI() {
        
        let requestURI = "http://swiftapi.rubypaper.co.kr:2029/theater/list"
        let sList = 100
        let type = "json"
        
        let urlObj = URL(string: "\(requestURI)?s_page=\(self.startPoint)&s_list=\(sList)&type=\(type)")
        
        do {
            
            let stringData = try NSString(contentsOf: urlObj!, encoding: 0x80_000_422)
            let encData = stringData.data(using: String.Encoding.utf8.rawValue)
            
                do {
                
                    let apiArray = try JSONSerialization.jsonObject(with: encData!, options: []) as? NSArray
                    
                    for obj in apiArray! {
                        self.list.append(obj as! NSDictionary)
                    }
                } catch  {
                    let alert = UIAlertController(title: "fail", message: "failed parsing data", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "confirm", style: .cancel))
                    self.present(alert, animated: false)
                }
        } catch {
            let alert = UIAlertController(title: "fail", message: "failed parsing data", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "confirm", style: .cancel))
            self.present(alert, animated: false)
        
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let obj = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "tCell") as! TheaterCell
        
        cell.name?.text = obj["상영관명"] as? String
        cell.tel?.text = obj["연락처"] as? String
        cell.addr?.text = obj["소재지도로명주소"] as? String
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
