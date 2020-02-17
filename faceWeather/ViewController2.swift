//
//  ViewController2.swift
//  faceWeather
//
//  Created by Dương chãng on 2/17/20.
//  Copyright © 2020 macshop. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupnavigation()
        // Do any additional setup after loading the view.
    }
    

    func setupnavigation() {
        let rightbotton = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(back))
        navigationItem.rightBarButtonItem = rightbotton
        
    }
    
    @objc func back(){
        dismiss(animated: true, completion: nil)
    }
    
}
