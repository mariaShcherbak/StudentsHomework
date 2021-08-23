

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
let idCell = "studentCell"
    
    @IBOutlet weak var tableView: UITableView!
    var students = [Student(name: "Olivia", surname: "King", image:              UIImage(named: "Olivia King.png")!),
                               Student(name: "Freddy", surname: "Walker", image: UIImage(named: "Freddy Walker.png")!),
                               Student(name: "Liam", surname: "Evans", image: UIImage(named: "Liam Evans.png")!),
                               Student(name: "Jacob", surname: "Roberts", image: UIImage(named: "Jacob Roberts.png")!),
                               Student(name: "Ethan", surname: "Mills", image: UIImage(named: "Ethan Mills.png")!),
                               Student(name: "Alexander", surname: "Lewis", image: UIImage(named: "Alexander Lewis.png")!),
                               Student(name: "Valery", surname: "Morgan", image: UIImage(named: "Valery Morgan.png")!),
                               Student(name: "Vanessa", surname: "Florence", image: UIImage(named: "Vanessa Florence.png")!),
                               Student(name: "Wendy", surname: "Campbell", image: UIImage(named: "Wendy Campbell.png")!),
                               Student(name: "Amelia", surname: "Smith", image: UIImage(named: "Amelia Smith.png")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
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


