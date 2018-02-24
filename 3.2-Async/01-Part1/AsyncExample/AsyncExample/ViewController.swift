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
    firstWay()
    
//    secondWay()
    
//    thirdWay()
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
  
  
}
