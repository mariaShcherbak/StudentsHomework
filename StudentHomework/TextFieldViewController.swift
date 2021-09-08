//
//  TextViewController.swift
//  StudentHomework
//
//  Created by Tanya on 25.08.2021.
//

import UIKit

protocol StudentsList {
    func makeStudentsList(student: Student)
}

class TextFieldViewController: UIViewController, UITextFieldDelegate{
   
    var delegate : StudentsList?
    var newStudent: Student?
    

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var bioTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mySaveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButton))
        navigationItem.rightBarButtonItem = mySaveButton
        }
    @objc func saveButton () {
        let newName = nameTextField.text ?? ""
        let newBio = bioTextField.text ?? ""
        let newImage = UIImage(named: "LiamEvans.png") ?? UIImage(named: "DefaultImage.png")!
        newStudent = Student(name: newName, bio: newBio, image: newImage)
        delegate?.makeStudentsList(student: newStudent!)
        
        let backVC = storyboard?.instantiateViewController(withIdentifier: "TableViewController")
       navigationController?.pushViewController(backVC!, animated: true)
        
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        true
    } // верните NO, чтобы запретить редактирование

    func textFieldDidBeginEditing(_ textField: UITextField) {}// became first responder

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {true}//

    func textFieldDidEndEditing(_ textField: UITextField) {}//

     func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {} // if implemented, called in place of textFieldDidEndEditing:

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {true}// return NO to not change text

func textFieldDidChangeSelection(_ textField: UITextField) {}

    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {true}// called when clear button pressed. return NO to ignore (no notifications)

func textFieldShouldReturn(_ textField: UITextField) -> Bool { true}// called when 'return' key pressed. return NO to ignore.

  /*  @IBAction func saveButton(_ sender: Any) {
        let newName = nameTextField.text ?? ""
        let newBio = bioTextField.text ?? ""
        let newImage = UIImage(named: "LiamEvans.png") ?? UIImage(named: "DefaultImage.png")!
        newStudent = Student(name: newName, bio: newBio, image: newImage)
        delegate?.makeStudentsList(student: newStudent!)
        
        }
        */
    }
    

    



    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


