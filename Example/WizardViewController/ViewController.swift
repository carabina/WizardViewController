//
//  ViewController.swift
//  WizardViewController
//
//  Created by Pilipenko Dima on 10/20/2016.
//  Copyright (c) 2016 Pilipenko Dima. All rights reserved.
//

import UIKit
import WizardViewController

class ViewController: UIViewController {
    private var _wizardVC: WizardViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _wizardVC = WizardViewController()
        
        _wizardVC.pageIndicatorColors = { currentPageIndex in
            let value: UIColor
            switch currentPageIndex {
                case 1: value = .darkGray
                case 2: value = .gray
                default: value = .black
            }
            return (nil, value)
        }
        
        _wizardVC.setViewControllers([A(), A(), A(), A()])
        
        addChildViewController(_wizardVC)
        _wizardVC.didMove(toParentViewController: self)
        view.addSubview(_wizardVC.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print(_wizardVC.view.frame)
    }

    deinit {
        _wizardVC.clear()
        _wizardVC = nil
    }
}

final class A: UIViewController, WizardPageContent {
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: CGFloat(randOf(limit: 255))/255, green: CGFloat(randOf(limit: 255))/255, blue: CGFloat(randOf(limit: 255))/255, alpha: CGFloat(randOf(limit: 255))/255)
        
        label.textAlignment = .center
        view.addSubview(label)
    }
    
    override func viewWillLayoutSubviews() {
        label.frame.size = view.bounds.size
        label.font = UIFont.systemFont(ofSize: view.bounds.width, weight: UIFontWeightBlack)
        label.text = String(alphabet[alphabet.index(alphabet.startIndex, offsetBy: randOf(limit: alphabet.characters.count))])
    }
    
    func pageWillAppear(animated: Bool) {
        //label.font = UIFont.systemFont(ofSize: view.bounds.width, weight: UIFontWeightBlack)
        //label.text = String(alphabet[alphabet.index(alphabet.startIndex, offsetBy: randOf(limit: alphabet.characters.count))])
    }
    
    func pageWillDisappear(animated: Bool) {
        //label.font = UIFont.systemFont(ofSize: view.bounds.width*0.8, weight: UIFontWeightBlack)
    }
}

fileprivate func randOf(limit: Int) -> Int {
    return Int(arc4random_uniform(UInt32(limit)))
}
