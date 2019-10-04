//
//  GrowViewController.swift
//  w5Animations
//
//  Created by Jawaad Sheikh on 2018-02-14.
//  Copyright © 2018 Jawaad Sheikh. All rights reserved.
//

import UIKit
import AVFoundation
class FadeViewController: UIViewController, AVAudioPlayerDelegate, AVAudioSessionDelegate {

    @IBOutlet var volSlider : UISlider!
    var soundPlayer : AVAudioPlayer?
    
    var fadeLayer : CALayer?

    @IBAction func volumeDidChange(sender : UISlider)
    {
        soundPlayer?.volume = volSlider.value
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        let soundURL = Bundle.main.path(forResource: "song3", ofType: "mp3")
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
        let fadeImage = UIImage(named: "munkee.png")
        fadeLayer = CALayer.init()
        fadeLayer?.contents = fadeImage?.cgImage
        fadeLayer?.bounds = CGRect(x: 0.0, y: 0.0, width: 150.0, height: 150.0)
        fadeLayer?.position = CGPoint(x: 200, y: 200)
        self.view.layer.addSublayer(fadeLayer!)
        
        // fade animation
        let fadeAnimation = CABasicAnimation(keyPath: "opacity")
        // ease fade in and out
        fadeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        // from alpha of 1.0
        fadeAnimation.fromValue = NSNumber.init(value: 1.0)
        // to alpha of 0.0 - invisible
        fadeAnimation.toValue = NSNumber.init(value: 0.0)
        fadeAnimation.isRemovedOnCompletion = false
        // 3 seconds long fade
        fadeAnimation.duration = 3.0
        fadeAnimation.beginTime = 1.0
        fadeAnimation.isAdditive = false
        // fill both forwards and backwards
        fadeAnimation.fillMode =  kCAFillModeBoth
        // repeat forever
        fadeAnimation.repeatCount=Float.infinity
        // attach animation to layer image
        fadeLayer?.add(fadeAnimation, forKey: nil)
        
   
        
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
