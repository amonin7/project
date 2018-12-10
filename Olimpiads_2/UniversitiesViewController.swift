//
//  UniversitiesViewController.swift
//  Olimpiads_2
//
//  Created by Антон Шуплецов on 08/12/2018.
//  Copyright © 2018 Антон Шуплецов. All rights reserved.
//

import UIKit

class UniversitiesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        left.direction = .left
        self.view.addGestureRecognizer(left)
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        right.direction = .right
        self.view.addGestureRecognizer(right)
    }
    @objc func swipeLeft() {
        let total = self.tabBarController!.viewControllers!.count - 1
        tabBarController!.selectedIndex = min(total, tabBarController!.selectedIndex + 1)
        
    }
    
    @objc func swipeRight() {
        tabBarController!.selectedIndex = max(0, tabBarController!.selectedIndex - 1)
    }


}
