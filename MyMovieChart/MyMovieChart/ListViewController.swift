//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 김지환 on 2021/11/15.
//

import UIKit

class ListViewController: UITableViewController {
    
    var dataset = [
        ("Dark knight", "This is Dark knight", "2008-09-04", 8.95),
        ("Avengers", "This is Avengers", "2008-09-04", 8.95),
        ("Joker", "This is Joker", "2008-09-04", 8.95)
    ]
    
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        for (title, desc, opendate, rating) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            
            datalist.append(mvo)
        }
        return datalist
    }()

    override func viewDidLoad() {
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        cell.textLabel?.text = row.title
        cell.detailTextLabel?.text = row.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행은\(indexPath.row)번째 입니다.")
    }

}
