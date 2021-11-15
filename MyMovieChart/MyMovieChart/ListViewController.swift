//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 김지환 on 2021/11/15.
//

import UIKit

class ListViewController: UITableViewController {
    
    var list = [MovieVO]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var mvo = MovieVO()
        mvo.title = "Dark knight"
        mvo.description = "This is dark knight"
        mvo.opendate = "2008-09-04"
        mvo.rating = 8.95
        self.list.append(mvo)
        
        mvo = MovieVO()
        mvo.title = "Avengers"
        mvo.description = "This is Avengers"
        mvo.opendate = "2008-09-04"
        mvo.rating = 8.95
        self.list.append(mvo)
        
        mvo = MovieVO()
        mvo.title = "Joker"
        mvo.description = "This is Joker"
        mvo.opendate = "2008-09-04"
        mvo.rating = 8.95
        self.list.append(mvo)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
