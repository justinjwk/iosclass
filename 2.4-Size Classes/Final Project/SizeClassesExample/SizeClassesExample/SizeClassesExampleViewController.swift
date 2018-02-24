//
//  SizeClassesExampleViewController.swift
//  Module2Master
//
//  Created by Teacher on 4/16/17.
//  Copyright © 2017 Teacher. All rights reserved.
//

import UIKit

class SizeClassesExampleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var gradeTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradeTable.delegate = self
        gradeTable.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = "Assignment \(indexPath.row+1)"
        cell.detailTextLabel?.text = "A"
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
