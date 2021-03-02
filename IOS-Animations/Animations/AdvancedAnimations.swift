//
//  AdvancedAnimations.swift
//  IOS-Animations
//
//  Created by Sebastian Otto on 02.03.21.
//

import UIKit

class AdvancedAnimations: UIViewController {
    
    @IBOutlet weak var first: UIView!
    @IBOutlet weak var second: UIView!
    @IBOutlet weak var third: UIView!
    
    var posX:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posX = third.center.x
    }
    
    //Animation mit aktion, nach dem diese durchgelaufen ist
    func animateFadeWithRemove(view: UIView) {
        UIView.animate(withDuration: 5, animations: {
            view.alpha = 0
        }, completion: {finished in
            //noetig, wenn animation pausiert werden kann
            if(finished) {
                //Beispiel Code:
                //self.view .removeFromSuperview()
            }})
    }
    
    func animateMoveRightAnimateBack(view: UIView) {
        UIView.animate(withDuration: 5, animations: {
            view.center.x += 300
        }, completion: {_ in
            //es koennen auch methoden in .animation aufgerufen werden
            self.animateMoveRightCompletion(view: view)
        })
    }
    
    private func animateMoveRightCompletion(view: UIView) {
        UIView.animate(withDuration: 1, animations: {
            view.center.x -= 300;
        })
    }
    
    func animationWithSpring(view: UIView) {
        UIView.animate(withDuration: 5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveLinear, animations: {
            view.center.x += 200
        })
    }
    
    
    @IBAction func onClickAnimateFirst(_ sender: Any) {
        animateFadeWithRemove(view: first)
    }
    
    @IBAction func onClickAnimateSecond(_ sender: Any) {
        animateMoveRightAnimateBack(view: second)
    }
    
    @IBAction func onClickAnimateThird(_ sender: Any) {
        animationWithSpring(view: third)
    }
    
    @IBAction func onClickReset(_ sender: Any) {
        first.alpha = 1
        third.center.x = posX
    }
    
    
}
