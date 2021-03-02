import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circle: UIView!
    @IBOutlet weak var border: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func onAnimationStart(_ sender: Any) {
        UIView.animateKeyframes(withDuration: 5, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.circle.transform = CGAffineTransform(scaleX: 1/2, y: 1/2)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.circle.center = CGPoint(x: self.circle.center.x + 100, y: self.circle.center.y - 200)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.circle.center = CGPoint(x: self.circle.center.x - 200, y: self.circle.center.y + 100)
            }

            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.15) {
                self.circle.center = CGPoint.init(x: self.circle.center.x + 100, y: self.circle.center.y + 100)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.25) {
                self.circle.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
        })
    }
    
}
