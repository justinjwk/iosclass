//
//  ViewController.swift
//  AnyRandomProject
//
//  Created by Justin Kim on 3/2/18.
//  Copyright © 2018 Justin Kim. All rights reserved.
//

import UIKit
import RandomGeneratorFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let randomString = RandomGenerator.string()
        let randomInteger = RandomGenerator.integer()
        
        print(randomString)
        print(randomInteger)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

