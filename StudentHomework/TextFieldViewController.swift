//
//  TextViewController.swift
//  StudentHomework
//
//  Created by Tanya on 25.08.2021.
//

import UIKit

class TextFieldViewController: UIViewController, UITextFieldDelegate{
    var delegate : StudentsList?
    
    func createStudent(students: Student)  {
        let student: Student //  тут нужно писать что-то типа      Student(name: nameTextField.text, bio: bioTextField.text, image:              ,,,)  ?????
        delegate!.makeStudentsList(student: students)
    }
    func makeStudentsList(student: Student) {
        
    }

    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var bioTextField: UITextField!
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        true
    } // верните NO, чтобы запретить редактирование

    func textFieldDidBeginEditing(_ textField: UITextField) {}// became first responder

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {true}// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end

    func textFieldDidEndEditing(_ textField: UITextField) {}// may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

     func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {} // if implemented, called in place of textFieldDidEndEditing:

    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {true}// return NO to not change text

func textFieldDidChangeSelection(_ textField: UITextField) {}

    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {true}// called when clear button pressed. return NO to ignore (no notifications)

func textFieldShouldReturn(_ textField: UITextField) -> Bool { true}// called when 'return' key pressed. return NO to ignore.

    @IBAction func saveButton(_ sender: Any) {
        
    }
    
}
    



    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


