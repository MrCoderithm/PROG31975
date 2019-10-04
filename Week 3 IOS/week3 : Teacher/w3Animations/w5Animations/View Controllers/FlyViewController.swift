//
//  FlyViewController.swift
//  w5Animations
//
//  Created by Jawaad Sheikh on 2018-02-14.
//  Copyright © 2018 Jawaad Sheikh. All rights reserved.
//

import UIKit
import AVFoundation

class FlyViewController: UIViewController, AVAudioSessionDelegate, AVAudioPlayerDelegate {

    @IBOutlet var volSlider : UISlider!
    var soundPlayer : AVAudioPlayer?
    
    var flyLayer : CALayer?
    
    @IBAction func volumeDidChange(sender : UISlider)
    {
        soundPlayer?.volume = volSlider.value
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        let soundURL = Bundle.main.path(forResource: "song2", ofType: "mp3")
        let url = URL(fileURLWithPath: soundURL!)
        
        self.soundPlayer = try! AVAudioPlayer.init(contentsOf: url)
        self.soundPlayer?.currentTime = 0
        self.soundPlayer?.volume = self.volSlider.value
        self.soundPlayer?.numberOfLoops = -1
        self.soundPlayer?.play()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        soundPlayer?.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // add layer image to screen
        let flyImage = UIImage(named: "dunkee.png")
        flyLayer = CALayer.init()
        flyLayer?.contents = flyImage?.cgImage
        flyLayer?.bounds = CGRect(x: 0.0, y: 0.0, width: 150.0, height: 150.0)
        flyLayer?.position = CGPoint(x: 0, y: 0)
        self.view.layer.addSublayer(flyLayer!)
        
        // movement animation
        let moveAnimation = CABasicAnimation(keyPath: "position")
        // ease in and out movement
        moveAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        // starting location is 0,0
        moveAnimation.fromValue = NSValue.init(cgPoint: CGPoint(x: 0,y: 0))
        // end location is 700,500
        moveAnimation.toValue = NSValue.init(cgPoint: CGPoint(x: 700, y: 500))
        moveAnimation.isRemovedOnCompletion = false
        // takes 3 seconds to move
        moveAnimation.duration = 3.0
        // repeat forever
        moveAnimation.repeatCount=Float.infinity
        // attach animation to image layer
        flyLayer?.add(moveAnimation, forKey: nil)
        
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
