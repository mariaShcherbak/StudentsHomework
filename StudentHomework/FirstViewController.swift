//
//  firstView.swift
//  StudentHomework
//
//  Created by Tanya on 23.08.2021.
//

import UIKit

class FirstViewController: UIViewController{
    
    @IBOutlet weak var startButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.frame = CGRect(x: 0, y: 0, width: 48, height: 16)
        startButton.layer.borderWidth = 1
        startButton.layer.borderColor = CGColor(red: 0, green: 0.478, blue: 1, alpha: 1)
        startButton.layer.cornerRadius = startButton.frame.size.height / 2
       
    }
    
    @IBAction func start(_ sender: Any) {
        let newVC = storyboard?.instantiateViewController(withIdentifier: "TableViewController")
       navigationController?.pushViewController(newVC!, animated: true)
    }
    
    
}

