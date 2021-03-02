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
    
    var posX:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        posX = move.center.x
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
        UIView.animate(withDuration: 5, animations: {
            view.backgroundColor = color
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
    
    @IBAction func onClickReset(_ sender: Any) {
        fade.alpha = 1
        move.center.x = posX
        color.backgroundColor = .systemBlue
    }
    
}
