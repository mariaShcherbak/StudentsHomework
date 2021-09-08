

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, StudentsList {
    
    
    func makeStudentsList(student: Student) {
        studentsArray.append(student)
        
        
    }
     
let idCell = "studentCell"
    
    @IBOutlet weak var tableView: UITableView!
    var studentsArray = [Student(name: "Olivia", bio: "born in 1992", image:              UIImage(named: "OliviaKing.png")!),
                    Student(name: "Freddy", bio: "born in 1991", image: UIImage(named: "FreddyWalker.png")!),
                               Student(name: "Liam", bio: "born in 1993", image: UIImage(named: "LiamEvans.png")!),
                               Student(name: "Jacob", bio: "born in 1991", image: UIImage(named: "JacobRoberts.png")!),
                               Student(name: "Ethan", bio: "born in 1992", image: UIImage(named: "EthanMills.png")!),
                               Student(name: "Alexander", bio: "born in 1993", image: UIImage(named: "AlexanderLewis.png")!),
                               Student(name: "Valery", bio: "born in 1992", image: UIImage(named: "ValeryMorgan.png")!),
                               Student(name: "Vanessa", bio: "born in 1992", image: UIImage(named: "VanessaFlorence.png")!),
                               Student(name: "Wendy", bio: "born in 1993", image: UIImage(named: "WendyCampbell.png")!),
                               Student(name: "Amelia", bio: "born in 1993", image: UIImage(named: "AmeliaSmith.png")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        let myAddButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addStudent))
        navigationItem.rightBarButtonItem = myAddButton
        
        }
    @objc func addStudent () {
        let newVC = storyboard?.instantiateViewController(withIdentifier: "TextFieldViewController") as? TextFieldViewController
       navigationController?.pushViewController(newVC!, animated: true)
        newVC!.delegate = self
        
    }
    
    
    //количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    //название секции
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Students"
    }
    
    
    // количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsArray.count
        }
    
    
    // размер ячейки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    // заполнение ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: idCell)
        let model = studentsArray[indexPath.row]
        cell.textLabel?.text = model.name
        cell.detailTextLabel?.text = model.bio
        cell.imageView?.image = model.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)") // нажатие на ячейку
    }
    
    
   /*
    @IBAction func add(_ sender: Any) {
        let newVC = storyboard?.instantiateViewController(withIdentifier: "TextViewController")
       navigationController?.pushViewController(newVC!, animated: true)
    }
   */

}


struct Student {
    var name: String
    var bio: String
    var image: UIImage
}


