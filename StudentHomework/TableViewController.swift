

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
let idCell = "studentCell"
    
    @IBOutlet weak var tableViev: UITableView!
    var students: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViev.dataSource = self
        tableViev.delegate = self
        students.append(Student(name: "Olivia", surname: "King", image: #imageLiteral(resourceName: "Olivia King")))
        students.append(Student(name: "Freddy", surname: "Walker", image: #imageLiteral(resourceName: "Freddy Walker")))
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
        return students.count
        }
    
    
    // размер ячейки
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    // заполнение ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: idCell)
        let model = students[indexPath.row]
        cell.textLabel?.text = model.title
        //cell.detailTextLabel?.text = model.surname
        cell.imageView?.image = model.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)") // нажатие на ячейку
    }
    
   
}


struct Student {
    var name: String
    var surname: String
    var title: String {
    "\(name) \(surname)"
    }
    var image: UIImage
}

