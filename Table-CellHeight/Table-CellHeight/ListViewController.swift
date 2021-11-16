//
//  ListViewController.swift
//  Table-CellHeight
//
//  Created by 김지환 on 2021/11/16.
//

import UIKit

class ListViewController: UITableViewController {
    
    var list = [String]()
    
    
    @IBAction func add(_ sender: Any) {
        
        let alert = UIAlertController(title: "input", message: "plz input the text", preferredStyle: .alert)
        
        alert.addTextField() {
            (tf) in tf.placeholder = "plz input the text"
        }
        
        let ok = UIAlertAction(title: "OK", style: .default) { (_) in
            if let title = alert.textFields?[0].text {
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (_) in
            
        }
        
        alert.addAction(ok)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell()
        
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 50
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        let row = self.list[indexPath.row]
//
//        let height = CGFloat(60 + (row.count / 30) * 20)
//        return height
//    }
}
