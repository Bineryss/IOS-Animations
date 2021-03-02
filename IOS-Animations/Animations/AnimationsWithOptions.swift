//
//  AnimationsWithOptions.swift
//  IOS-Animations
//
//  Created by Sebastian Otto on 02.03.21.
//

import UIKit

class AnimationsWithOptions: UIViewController {
    
    @IBOutlet weak var easeInOut: UIView!
    @IBOutlet weak var linear: UIView!
    @IBOutlet weak var autoreverse: UIView!
    
    var isRunning:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func animateWithOptions(view: UIView, options: UIView.AnimationOptions) {
        if options.contains(.repeat) {
            isRunning = true
        }
        
        UIView.animate(withDuration: 5, delay: 0, options: options, animations: {
            view.center.x += 300
        }, completion: {_ in view.center.x -= 300})
    }
    
    
    @IBAction func onClickPlayAll(_ sender: Any) {
        animateWithOptions(view: easeInOut, options: .curveEaseInOut)
        animateWithOptions(view: linear, options: .curveLinear)
        if !isRunning {
            animateWithOptions(view: autoreverse, options: [.repeat, .autoreverse])
        }
    }
    
    @IBAction func onClickStoppAll(_ sender: Any) {
        easeInOut.layer.removeAllAnimations()
        linear.layer.removeAllAnimations()
        autoreverse.layer.removeAllAnimations()
        isRunning = false
    }
}
