//
//  ViewController.swift
//  w6DictionaryDelegate
//
//  Created by Jawaad Sheikh on 2017-06-08.
//  Copyright © 2017 Jawaad Sheikh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Step 4 - declare Outlets for SB
    @IBOutlet var lbTitle : UILabel!
    @IBOutlet var lbOp1 : UILabel!
    @IBOutlet var lbOp2 : UILabel!
    @IBOutlet var lbOp3 : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Step 5 - request access to AppDelegate
        // note we don't instantiate because its a singleton!
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // update Outlets with data from AppDelegate
        lbTitle.text = mainDelegate.title
        lbOp1.text = mainDelegate.options[0]
        lbOp2.text = mainDelegate.options[1]
        lbOp3.text = mainDelegate.options[2]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func unwindToHomeViewController(segue: UIStoryboardSegue)
    {
        
    }


}

