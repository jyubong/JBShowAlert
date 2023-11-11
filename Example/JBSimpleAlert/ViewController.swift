//
//  ViewController.swift
//  JBSimpleAlert
//
//  Created by jyubong on 11/11/2023.
//  Copyright (c) 2023 jyubong. All rights reserved.
//

import UIKit
import JBSimpleAlert

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func showAlert(_ sender: UIButton) {
        JBSimpleAlert(title: "Is this simple?", confirm: "Yes") {
            print("It is so simple.")
        }.show(in: view)
    }

}

