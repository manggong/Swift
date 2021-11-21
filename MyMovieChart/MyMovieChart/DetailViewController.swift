//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by 김지환 on 2021/11/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var wv: WKWebView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var mvo: MovieVO!
    
    override func viewDidLoad() {
        self.view.bringSubviewToFront(self.spinner)
        self.wv.navigationDelegate = self
//        self.wv.uiDelegate = self
        
        let navibar = self.navigationItem
        navibar.title = self.mvo.title
        
        if let url = self.mvo.detail {
            if let urlObj = URL(string: url) {
                let req = URLRequest(url: urlObj)
                self.wv.load(req)
            } else {
                let alert = UIAlertController(title: "Error", message: "Wrong URL", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "confirm", style: .cancel) {
                    (_) in _ = self.navigationController?.popViewController(animated: true)
                }
                alert.addAction(cancelAction)
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            let alert = UIAlertController(title: "Error", message: "Missing required", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "confirm", style: .cancel) {
                (_) in _ = self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension DetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        self.spinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.spinner.stopAnimating()
        
        let alert = UIAlertController(title: "Error", message: "Missing Page", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "confirm", style: .cancel) {
            (_) in _ = self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}
