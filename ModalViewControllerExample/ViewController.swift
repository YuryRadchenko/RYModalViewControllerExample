//
//  ViewController.swift
//  ModalViewControllerExample
//
//  Created by Yury Radchenko on 22.01.17.
//  Copyright © 2017 Yury Radchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func moveFromButtonTap(_ sender: UIButton) {
        
        if let modalVC = RYMyModalViewController.storyboardInstance() {
            modalVC.az_modalTransition = RYMyTransition()
            self.present(modalVC, animated: false, completion: nil)
        }
    }
}

