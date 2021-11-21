//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by 김지환 on 2021/11/15.
//

import UIKit

class ListViewController: UITableViewController {
    
    @IBOutlet weak var moreBtn: UIButton!
    
    var page = 1
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()
        return datalist
    }()
 
    @IBAction func more(_ sender: Any) {
        
        self.page += 1
        self.callMovieAPI()
        self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        self.callMovieAPI()
    }
    
    func callMovieAPI() {
        
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=10&genreId=&order=releasedateasc"
        let apiURI: URL! = URL(string: url)
        let apiData = try! Data(contentsOf: apiURI)
        let log = NSString(data: apiData, encoding: String.Encoding.utf8.rawValue) ?? ""

        NSLog("API Result=\(log)")
        
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apiData, options: []) as! NSDictionary
            
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
            
            for row in movie {
                let r = row as! NSDictionary
                let mvo = MovieVO()
                
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = ((r["ratingAverage"] as! NSString).doubleValue)
                
                let url: URL! = URL(string: mvo.thumbnail!)
                let imageData = try! Data(contentsOf: url)
                mvo.thumbnailImage = UIImage(data: imageData)
                
                self.list.append(mvo)
                
                if(self.list.count >= totalCount) {
                    self.moreBtn.isHidden = true
                }
               
            }
        } catch  {
            
        }
        
    }
    
    func getThumbnailImage(_ index: Int) -> UIImage {
        let mvo = self.list[index]
        
        if let savedImage = mvo.thumbnailImage {
            return savedImage
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData)
            
            return mvo.thumbnailImage!
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = self.list[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        DispatchQueue.main.async(execute: {
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        })
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택된 행은\(indexPath.row)번째 입니다.")
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}

extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_detail" {
            let cell = sender as! MovieCell
            let path = self.tableView.indexPath(for: cell)
            let movieInfo = self.list[path!.row]
            let detailVC = segue.destination as? DetailViewController
            detailVC?.mvo = movieInfo
        }
    }
}
