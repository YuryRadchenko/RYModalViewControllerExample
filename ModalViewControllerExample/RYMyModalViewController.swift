//
//  RYMyModalViewController.swift
//  ModalViewControllerExample
//
//  Created by Yury Radchenko on 22.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import UIKit

fileprivate let kDurationAnimation: TimeInterval = 0.4
fileprivate let kMessageViewTopConstraintStandart: CGFloat = 45.0
fileprivate var kGrayMaxBackgroundColor = UIColor.gray.withAlphaComponent(0.85)
fileprivate var kGrayMinBackgoundColor = UIColor.gray.withAlphaComponent(0.0)

class RYMyModalViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var messageViewTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var messageView: UIView! {
        didSet {
            messageView.backgroundColor = .white
            messageView.layer.masksToBounds = true
            messageView.layer.cornerRadius = 5.0
        }
    }
    
    fileprivate var transation = RYMyTransition()
    
    static func storyboardInstance() -> RYMyModalViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier:String(describing: self)) as? RYMyModalViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .clear
        self.view.isOpaque = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.backgroundView.backgroundColor = kGrayMinBackgoundColor
        self.messageViewTopConstraint.constant = UIScreen.main.bounds.height
        self.view.layoutIfNeeded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.messageViewTopConstraint.constant = UIScreen.main.bounds.height / 2.0 - self.messageView.frame.height / 2.0
        
        UIView.animate(withDuration: kDurationAnimation) {
            self.backgroundView.backgroundColor = kGrayMaxBackgroundColor
            self.view.layoutIfNeeded()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func okButtonTap(_ sender: UIButton) {
        self.closeVC()
    }
    
    fileprivate func closeVC() {
        
        self.messageViewTopConstraint.constant = UIScreen.main.bounds.height
        UIView.animate(withDuration: kDurationAnimation, animations: {
            self.backgroundView.backgroundColor = kGrayMinBackgoundColor
            self.view.layoutIfNeeded()
            
        }) { (completed) in
            self.dismiss(animated: false, completion: nil)
        }
    }
}
