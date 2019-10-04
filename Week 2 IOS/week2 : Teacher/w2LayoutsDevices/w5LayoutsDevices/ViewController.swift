//
//  ViewController.swift
//  w5LayoutsDevices
//
//  Created by Jawaad Sheikh on 2017-06-07.
//  Copyright © 2017 Jawaad Sheikh. All rights reserved.
//

import UIKit

// Step 4a - add "UIWebViewDelegate" to enable hiding / 
//unhiding of activity indicator
// Step 5 - add "UITextfieldDelegate" to hide / unhide keyboard
class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    // Step 1 - create storyboard as setup for iPad as shown.
    // leave autolayout constraints for later.
    
    // Step 2 - declare the following variables and connect them
    @IBOutlet var tfName : UITextField!
    @IBOutlet var tfEmail : UITextField!
    
    @IBOutlet var lbName : UILabel!
    @IBOutlet var lbEmail : UILabel!
    
    @IBOutlet var webView : UIWebView!
    @IBOutlet var activity : UIActivityIndicatorView!

    
    // Step 5b - add this method to get keyboard to unhide
    // Step 5c - connect each textfield's delegate to View 
    // Controller in storyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
        
    }
    
    // Step 4b - declare didStartLoad to unhide and animate
    // the activity indicator
    func webViewDidStartLoad(_ webView: UIWebView) {
        activity.isHidden = false
        activity.startAnimating()
    }
    
    // Step 4c - declare didFinishLoad to hide and stop
    // the activity i ndicator
    // Step 4d - connect webview's delegate to View Controller
    // in storyboard
    func webViewDidFinishLoad(_ webView: UIWebView) {
        activity.isHidden = true 
        activity.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Step 8 - disable the webview for non-iPad devices
        // Step 8b - add constraints of Autolayout to allow
        // items to resize to iPhone view in storyboard.
        if(UIDevice.current.userInterfaceIdiom == .pad)
        {
            // Step 3 - declare the following to get 
            // webview to display Google
            let urlAddress = URL(string: "https://www.google.ca")
            let url = URLRequest(url: urlAddress!)
            webView?.loadRequest(url as URLRequest)
        }
        else
        {
            webView.isHidden = true
            activity.isHidden = true
        }

    }

    // Step 6 - declare event handler to save data
    // and pop up alert "are you sure?"
    @IBAction func updateLabels(_ sender : Any)
    {
        
        // declare an alert box object
        let alert = UIAlertController(title: "Warning", message: "Do you wish to save?", preferredStyle: .alert)
        
        // declare alert buttons
        
        // note the yes button has a handler declared inline
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: {(alert: UIAlertAction!) in
            self.doTheUpdate()
            self.dismiss(animated: true, completion: nil)
            
        })
        
        let noAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        // join button to alert box
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        // Picard - "make it so"
        present(alert, animated: true)
    }
    
    // Step 7 - declare a method to save the data into a 
    // seperate object
    // Step 7b - create a new file of type NSObject 
    func doTheUpdate()
    {
        let data : Data = .init()

        data.initWithStuff(theName: tfName.text!, theEmail: tfEmail.text!)
        
        lbName.text = data.savedName
        lbEmail.text = data.savedEmail
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

