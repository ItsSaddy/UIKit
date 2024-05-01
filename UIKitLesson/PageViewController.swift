//
//  PageViewController.swift
//  UIKitLesson
//
//  Created by Boboev Saddam on 01/05/24.
//

import UIKit

class PageViewController: UIPageViewController {

    let presentScreenContent = ["Первая страница!",
                                "Вторая страница!",
                                "Третья страница!",
                                "Четвёртая страница!"]
    
    let emojiArray = ["1️⃣", "2️⃣", "3️⃣", "4️⃣"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        guard index >= 0 else { return nil }
        guard index < presentScreenContent.count else {
            dismiss(animated: true)
            return nil
        }
        guard let contentViewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else { return nil }
        
        contentViewController.presentText = presentScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numbersOfPage = presentScreenContent.count
                
        return contentViewController
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber += 1
        
        return showViewControllerAtIndex(pageNumber)
    }
}
