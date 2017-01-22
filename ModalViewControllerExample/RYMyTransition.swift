//
//  RYMyTransition.swift
//  ModalViewControllerExample
//
//  Created by Yury Radchenko on 22.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import UIKit

fileprivate let kAnimationDuration: TimeInterval = 0.01

class RYMyTransition: CustomModalTransition {
    override init() {
        super.init(duration: kAnimationDuration)
    }
    
    func performTransition(interactive: Bool) {
        
        self.presentedViewController.view.alpha = 1.0
        self.finishAnimation(completion: nil)
    }
    
    func performDismissingTransition(interactive: Bool) {
        
        self.presentedViewController.view.alpha = 0.0
        UIApplication.shared.keyWindow?.addSubview(self.presentingViewController.view) //https://youtu.be/4FNyV_4my1U?t=13m13s
        self.finishAnimation(completion: nil)
    }
}
