//
//  TextViewController.swift
//  StudentHomework
//
//  Created by Tanya on 25.08.2021.
//

import UIKit

protocol StudentsList: AnyObject {
    func makeStudentsList(student: Student)
}

class TextFieldViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    weak var delegate : StudentsList?
    var newStudent: Student?
    

    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var bioTextField: UITextField!
    
    
    
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

    @IBAction func saveButton(_ sender: Any) {
        let newName = nameTextField.text ?? ""
        let newBio = bioTextField.text ?? ""
        let newImage = photoImage.image ?? UIImage(named: "DefaultImage.png")!
        newStudent = Student(name: newName, bio: newBio, image: newImage)
    print(newStudent ?? "newStudent is nil")
    if newStudent?.name != "" && newStudent?.bio != "" {
        delegate?.makeStudentsList(student: newStudent!)
    } else {
        let alertController = UIAlertController(title: "Упс", message: "нужно заполнить все поля", preferredStyle: .alert)
        let action = UIAlertAction(title: "Понятно", style: .default) { (action) in
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
    navigationController?.popViewController(animated: true)
        }
    
    @IBAction func changePhoto(_ sender: UITapGestureRecognizer) {
        print("Tab")
        let picker = UIImagePickerController()
        picker.sourceType = .savedPhotosAlbum
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
        
    }
    func imagePickerController(_: UIImagePickerController, didFinishPickingMediaWithInfo: [UIImagePickerController.InfoKey : Any]) {
        print(UIImagePickerController.InfoKey.editedImage)
        photoImage.image = didFinishPickingMediaWithInfo[.editedImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    }
    

    



    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


