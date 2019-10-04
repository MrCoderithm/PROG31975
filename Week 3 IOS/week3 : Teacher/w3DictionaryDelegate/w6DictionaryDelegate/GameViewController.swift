//
//  GameViewController.swift
//  w6DictionaryDelegate
//
//  Created by Jawaad Sheikh on 2017-06-08.
//  Copyright © 2017 Jawaad Sheikh. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // Step 6 - declare outlets for second page
    @IBOutlet var lbTitle : UILabel!
    @IBOutlet var lbScore : UILabel!
    @IBOutlet var lbTime : UILabel!
    @IBOutlet var lbLevel : UILabel!
    @IBOutlet var lbHighScore : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Step 7 - request access to AppDelegate
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Step 8 update outlets with data from AppDelegate
        lbTitle.text = mainDelegate.title
        lbScore.text = mainDelegate.scores["Score"]
        lbTime.text = mainDelegate.scores["Time"]
        lbLevel.text = mainDelegate.scores["Level"]
        lbHighScore.text = mainDelegate.scores["High"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
