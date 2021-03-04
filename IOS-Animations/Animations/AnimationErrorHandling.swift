//
//  AnimationErrorHandling.swift
//  IOS-Animations
//
//  Created by Sebastian Otto on 02.03.21.
//

import UIKit

class AnimationErrorHandling: UIViewController {
    
    @IBOutlet weak var withBool: UIView!
    @IBOutlet weak var withoutBool: UIView!
    
    var originX:CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        originX = withBool.center.x
        // Do any additional setup after loading the view.
    }
    
    private func animationWithBool(view:UIView) {
        UIView.animate(withDuration: 10, animations: {
            view.center.x += 200
        }, completion: {isFinished in
            if isFinished {
                view.center.x = self.originX
            }
        })
    }
    
    private func animationWithoutBool(view:UIView) {
        UIView.animate(withDuration: 10, animations: {
            view.center.x += 200
        }, completion: {_ in
                view.center.x = self.originX
        })
    }
    
    @IBAction func onClickBool(_ sender: Any) {
        animationWithBool(view: self.withBool)
    }
    
    @IBAction func onClickNoBool(_ sender: Any) {
        animationWithoutBool(view: self.withoutBool)
    }
    
    @IBAction func onClickStartAll(_ sender: Any) {
        animationWithBool(view: self.withBool)
        animationWithoutBool(view: self.withoutBool)
    }
    
    @IBAction func onClickStop(_ sender: Any) {
        withBool.layer.removeAllAnimations()
        withoutBool.layer.removeAllAnimations()
    }
    
    @IBAction func onClickReset(_ sender: Any) {
        self.withBool.center.x = originX
        self.withoutBool.center.x = originX
    }
    
    
}
