//
//  firstView.swift
//  StudentHomework
//
//  Created by Tanya on 23.08.2021.
//

import UIKit

class FirstViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func start(_ sender: Any) {
        let newVC = storyboard?.instantiateViewController(withIdentifier: "TableViewController")
       navigationController?.pushViewController(newVC!, animated: true)
    }
    
  
    
}

