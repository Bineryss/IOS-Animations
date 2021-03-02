//
//  SimpleAnimations.swift
//  IOS-Animations
//
//  Created by Sebastian Otto on 02.03.21.
//

import UIKit

class SimpleAnimations: UIViewController {
    
    @IBOutlet weak var fade: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startFade(_ sender: Any) {
        animateFade(view: fade)
    }
    
    
    func animateFade(view: UIView) {
        UIView.animate(withDuration: 2, animations: {
            view.alpha = 0.0
        })
    }


}
