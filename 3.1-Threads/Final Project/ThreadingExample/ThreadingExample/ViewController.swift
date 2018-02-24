//
//  ViewController.swift
//  ThreadingExample
//
//  Created by Teacher on 7/29/17.
//  Copyright © 2017 Teacher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    var thread:Thread!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thread = Thread(target: self, selector: #selector(runLoop), object: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func runLoop()
    {
        for i in 0 ..< 1000000
        {
//            print("i is \(i)")
//            statusLabel.text = "Processing Index \(i)"
//            sleep(1)
            
            performSelector(onMainThread: #selector(updateLabel(i:)), with: NSNumber.init(value:i), waitUntilDone: false)
            sleep(1)
            if thread.isCancelled
            {
                thread = nil
                break
            }
        }

    }
    
    func updateLabel(i: NSNumber)
    {
        statusLabel.text = "Processing Index \(i)"
    }

    @IBAction func startButtonAction(_ sender: Any)
    {
//        for i in 0 ..< 1000000
//        {
//            print("i is \(i)")
//            statusLabel.text = "Processing Index \(i)"
//            sleep(1)
//        }
        if thread.isExecuting
        {
            thread.cancel()
            startButton.setTitle("Start", for: .normal)
        }
        else
        {
            thread.start()
            startButton.setTitle("Cancel", for: .normal)
        }
        
    }

}

