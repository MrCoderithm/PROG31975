//
//  SpinViewController.swift
//  w5Animations
//
//  Created by Jawaad Sheikh on 2018-02-14.
//  Copyright © 2018 Jawaad Sheikh. All rights reserved.
//

import UIKit

// Step 6, import AV Foundation
import AVFoundation

// Step 5, in project settings, add AVFoundation
// and QuartzCore frameworks

// Step 7 - add the following delegates
class SpinViewController: UIViewController, AVAudioSessionDelegate, AVAudioPlayerDelegate {

    // Step 8 add the following variables
    // Step 8b, connect the variables in the storyboard
    @IBOutlet var volSlider : UISlider!
    var soundPlayer : AVAudioPlayer?
    
    var spinLayer : CALayer?
    
    
    // step 9, add the following event handler for volume control
    @IBAction func volumeDidChange(sender : UISlider)
    {
        soundPlayer?.volume = volSlider.value
    }
    
    // step 10, get sound going in viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        
        // sound file exists in the bundle, retrieve it
        let soundURL = Bundle.main.path(forResource: "song1", ofType: "mp3")
        let url = URL(fileURLWithPath: soundURL!)
      
        // soundPlayer connects to url of file
        self.soundPlayer = try! AVAudioPlayer.init(contentsOf: url)
        self.soundPlayer?.currentTime = 0
        self.soundPlayer?.volume = self.volSlider.value
        // repeat forever
        self.soundPlayer?.numberOfLoops = -1
        self.soundPlayer?.play()
        
    }
    
    // step 10b, implement viewDidDisappear to
    // turn off music when leaving the view
    override func viewDidDisappear(_ animated: Bool) {
        soundPlayer?.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // step 11, implement getting image to display
        // using CALayer
        
        let spinImage = UIImage(named: "munkee.png")
        spinLayer = CALayer.init()
        spinLayer?.contents = spinImage?.cgImage
        // hardcode location and size
        spinLayer?.bounds = CGRect(x: 0.0, y: 0.0, width: 150.0, height: 150.0)
        spinLayer?.position = CGPoint(x: 200, y: 200)
        // add image layer to view
        self.view.layer.addSublayer(spinLayer!)
        
    
        // begin animation
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        // ease rotation in and out
        rotateAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        // from 0 degrees
        rotateAnimation.fromValue = 0
        // to 360 degrees
        rotateAnimation.toValue = 2 * Double.pi
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = 1.0
        // repeat forever
        rotateAnimation.repeatCount=Float.infinity
        // attach animation to layer image
        spinLayer?.add(rotateAnimation, forKey: nil)
        
        // step 12, repeat for FlyViewController
        // FlyViewController moves object
        // step 13, repeat for FadeViewController
        // FadeViewController fades image
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
