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
    //        firstWay()
    
    //        secondWay()
    
    thirdWay()
  }
  
  func firstWay()
  {
    for i in 0 ..< 5
    {
      print("i is \(i)")
      statusLabel1.text = "Processing Index \(i)"
      sleep(1)
    }
    
    for j in 0 ..< 5
    {
      print("j is \(j)")
      statusLabel2.text = "Processing Index \(j)"
      sleep(1)
    }
    
    for k in 0 ..< 5
    {
      print("k is \(k)")
      statusLabel3.text = "Processing Index \(k)"
      sleep(1)
    }
    
    for l in 0 ..< 5
    {
      print("l is \(l)")
      statusLabel4.text = "Processing Index \(l)"
      sleep(1)
    }
    
  }
  
  func secondWay()
  {
    DispatchQueue.global(qos: .userInitiated).async {
      for i in 0 ..< 5
      {
        print("i is \(i)")
        DispatchQueue.main.async {
          self.statusLabel1.text = "Processing Index \(i)"
        }
        
        sleep(1)
      }
    }
    
    DispatchQueue.global(qos: .userInitiated).async {
      for i in 0 ..< 5
      {
        print("i is \(i)")
        DispatchQueue.main.async {
          self.statusLabel2.text = "Processing Index \(i)"
        }
        
        sleep(1)
      }
    }
    
    DispatchQueue.global(qos: .userInitiated).async {
      for i in 0 ..< 5
      {
        print("i is \(i)")
        DispatchQueue.main.async {
          self.statusLabel3.text = "Processing Index \(i)"
        }
        
        sleep(1)
      }
    }
    
    DispatchQueue.global(qos: .userInitiated).async {
      for i in 0 ..< 5
      {
        print(" is \(i)")
        DispatchQueue.main.async {
          self.statusLabel4.text = "Processing Index \(i)"
        }
        
        sleep(1)
      }
    }
  }
  
  func thirdWay()
  {
    let operation1 = MyLabelOperation(label: statusLabel1)
    let operation2 = MyLabelOperation(label: statusLabel2)
    let operation3 = MyLabelOperation(label: statusLabel3)
    let operation4 = MyLabelOperation(label: statusLabel4)
    
    operation1.addDependency(operation2)
    operation2.addDependency(operation3)
    operation3.addDependency(operation4)
    
    let operationQueue = OperationQueue()
    operationQueue.addOperation(operation1)
    operationQueue.addOperation(operation2)
    operationQueue.addOperation(operation3)
    operationQueue.addOperation(operation4)
  }
  
  class MyLabelOperation : Operation
  {
    var label: UILabel!
    
    init(label: UILabel)
    {
      self.label = label
    }
    
    override func main()
    {
      for i in 0 ..< 5
      {
        print(" is \(i)")
        DispatchQueue.main.async {
          self.label.text = "Processing Index \(i)"
        }
        
        sleep(1)
      }
    }
  }

}

