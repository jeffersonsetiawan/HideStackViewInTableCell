//
//  ViewController.swift
//  HideStackViewInTableCell
//
//  Created by Jefferson Setiawan on 26/06/18.
//  Copyright © 2018 Jefferson Setiawan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func goTapped(_ sender: Any) {
        let vc = ClassRoomViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

