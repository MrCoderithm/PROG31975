//
//  ViewController.swift
//  W4Tables2
//
//  Created by Ali Muhammad on 2019-09-23.
//  Copyright © 2019 Ali Muhammad. All rights reserved.
//

import UIKit
import WebKit

class ViewSiteViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView : WKWebView!
    @IBOutlet var activity : UIActivityIndicatorView!

    // Start animating activity indicator
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.isHidden = false
        activity.startAnimating()
    }
    
    // Stop animating indicator
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.isHidden = true
        activity.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get team url from app delegate
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let urlAddress = URL(string: mainDelegate.selectedURL)
        let url = URLRequest(url: urlAddress!)
        webView.load(url)
        webView.navigationDelegate = self
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
