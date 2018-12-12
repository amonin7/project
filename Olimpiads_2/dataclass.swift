//
//  dataclass.swift
//  Olimpiads_2
//
//  Created by Andrey Minin on 12/12/2018.
//  Copyright © 2018 Антон Шуплецов. All rights reserved.
//

import UIKit

class dataclass: UIViewController {
    var olmpArray = [Olymps]()
    let testContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
