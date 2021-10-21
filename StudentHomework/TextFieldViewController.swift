//
//  TextViewController.swift
//  StudentHomework
//
//  Created by Tanya on 25.08.2021.
//

import UIKit

protocol StudentsList: AnyObject {
    func makeStudentsList(student: Student)
    func updateStudent(_ student: Student, atIndex: Int)
}

class TextFieldViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var studentIndex: Int?
    weak var delegate : StudentsList?
    var newStudent: Student?
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var bioTextField: UITextField!
    
    @IBOutlet weak var bioConstraintTopToView: NSLayoutConstraint!
    
    @IBAction func tabKeyAction(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func returnName(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func returnBio(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       registerForKeyboardNotification()
        
        photoImage.layer.cornerRadius = photoImage.frame.size.width / 2
        photoImage.clipsToBounds = true
        
        bioTextField.text = newStudent?.bio
        nameTextField.text = newStudent?.name
        photoImage.image = newStudent?.image
        nameTextField.placeholder = "  Name"
        bioTextField.placeholder = " Short bio"
     
        UIScrollView.KeyboardDismissMode.onDrag
     
        
    }

   deinit {
      removeKeyboardNotifications()
    }
   
    
    
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil )
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
     //удаление Notification
   func removeKeyboardNotifications() {
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
   
   
    
    //смещение на величину
    @objc func kbWillShow(_ notification: Notification) {
        
        let userInfosize = notification.userInfo
       
        guard let userInfo = notification.userInfo,
                      let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let keyBoardY = UIScreen.main.bounds.size.height - keyboardSize.height
        if keyBoardY < (bioConstraintTopToView.constant + bioTextField.frame.size.height*2) {
        
            // величина смещения контента
            let displace = UIScreen.main.bounds.size.height - (keyboardSize.height + bioConstraintTopToView.constant + bioTextField.frame.size.height)
            scrollView.frame.origin.y = displace
            
            //scrollView.contentOffset = CGPoint(x: 0, y: bioTextField.frame.size.height)
        }
        
    }
    
    
    @objc func kbWillHide () {
        
        self.scrollView.frame.origin.y = 0
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


    @IBAction func saveButton(_ sender: Any) {
        let newName = nameTextField.text ?? ""
        let newBio = bioTextField.text ?? ""
        let newImage = photoImage.image ?? UIImage(named: "DefaultImage.png")!
        newStudent = Student(name: newName, bio: newBio, image: newImage)
    print(newStudent ?? "newStudent is nil")
    if newStudent?.name != "" && newStudent?.bio != "" {
        if let index = studentIndex {
            delegate?.updateStudent(newStudent!, atIndex: index)
        } else {
            delegate?.makeStudentsList(student: newStudent!)
        }
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


