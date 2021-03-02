import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {

    lazy var viewControllerList:[UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        return [
            sb.instantiateViewController(identifier: "StartView"),
        sb.instantiateViewController(identifier: "SimpleAnimations"),
        sb.instantiateViewController(identifier: "AdvancedAnimations"),
            sb.instantiateViewController(identifier: "AnimatiosnWithOptions"),
            sb.instantiateViewController(identifier: "AnimationErrorHandling"),
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if (view is UIPageControl) {
                view.backgroundColor = UIColor.clear
            }
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllerList.firstIndex(of: viewController) else {
           return nil
        }
        
        let prevIndex = viewControllerIndex - 1
        
        guard prevIndex >= 0 else {
            return viewControllerList.last
        }
        
        guard viewControllerList.count > prevIndex else {
            return nil
        }
        
        return viewControllerList[prevIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewControllerList.firstIndex(of: viewController) else {
           return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < viewControllerList.count else {
            return viewControllerList.first
        }
        
        guard viewControllerList.count > nextIndex else {
            return nil
        }
        
        return viewControllerList[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllerList.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = viewControllerList.firstIndex(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }
}
