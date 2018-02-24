//
//  ViewController.swift
//  AsyncExample
//
//  Created by Teacher on 2/10/18.
//  Copyright © 2018 Teacher. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var statusLabel1: UILabel!
  @IBOutlet weak var statusLabel2: UILabel!
  @IBOutlet weak var statusLabel3: UILabel!
  @IBOutlet weak var statusLabel4: UILabel!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func runThreadsButtonTouched(_ sender: Any)
  {
//    firstWay()
    
//    secondWay()
    
//    thirdWay()
  }
    
    func seconWay()
    {
        
    }
    
    func thridWay()
    {
        let operation1 = MyOperation(label: statusLabel1)
        let operation1 = MyOperation(label: statusLabel2)
        let operation1 = MyOperation(label: statusLabel3)
        let operation1 = MyOperation(label: statusLabel4)
        
        let operationQueue = OperationQueue()
        operationQueue.addOperation
    }
    
    class MyOperation :Operation
    {
        var label: UILabel!
        
        init(label:UILabel)
        {
            self.label = label
        }
        
        override func main()
        {
            for l in 0..<5
            {
                print("l is \(l)")
                DispatchQueue.main.async
                {
                    self.label.text = "Processing Index \(l)"
                }
                sleep(1)
            }
        }
    }
    
    
}
