//
//  SimpleAnimations.swift
//  IOS-Animations
//
//  Created by Sebastian Otto on 02.03.21.
//

import UIKit

class SimpleAnimations: UIViewController {
    
    @IBOutlet weak var fade: UIView!
    @IBOutlet weak var move: UIView!
    @IBOutlet weak var color: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Annimation in simpelster Form
    func animateFade(view: UIView) {
        UIView.animate(withDuration: 2, animations: {
            view.alpha = 0.0
        })
    }
    
    //Annimation als Clousure mitgegeben
    func animateMoveRight(view: UIView) {
        UIView.animate(withDuration: 5, delay: 2) {
            view.center.x = 300
        }
    }
    
    func animnateColorChange(view: UIView, color: UIColor) {
        UIView.animate(withDuration: 10, animations: {
            view.backgroundColor = color
        })
    }
    
    //Animation mit aktion, nach den diese durchgelaufen ist
    func animateMoveRightWithCompletion(view: UIView) {
        UIView.animate(withDuration: 5, animations: {
            view.center.x += 300
        }, completion: {finished in
            //noetig, wenn animation pausiert werden kann
            if(finished) {
                view.center.x -= 300
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
    
    func animateMoveRightCompletion(view: UIView) {
        UIView.animate(withDuration: 1, animations: {
            view.center.x -= 300;
        })
    }
    
    func animationWithSpring(view: UIView) {
        UIView.animate(withDuration: 5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 2, options: .curveLinear, animations: {
            view.center.x += 200
        })
    }

    
    //Button connection
    @IBAction func onClickStartFade(_ sender: Any) {
        animateFade(view: fade)
    }
    
    @IBAction func onClickAnimateMove(_ sender: Any) {
        animateMoveRight(view: move)
    }
    
    @IBAction func onClickColorChange(_ sender: Any) {
        animnateColorChange(view: color, color: .purple)
    }
    

}
