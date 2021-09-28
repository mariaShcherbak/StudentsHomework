

import UIKit


class TableViewController: UIViewController, UITableViewDelegate, StudentsList {
    
    
    func makeStudentsList(student: Student) {
        studentsArray.append(student)
        print("makeStudentsList!!!")
        myTableView.reloadData()
    }
   /* func bidNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    */
    
    @IBOutlet weak var myTableView: UITableView!
    
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
     //   bidNavigationBar()
        myTableView.rowHeight = 94
        let search = UISearchController(searchResultsController: nil)
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
        myTableView.dataSource = self
        //myTableView.delegate = self
        
        //myTableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.idCell)
        
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
        return ""
    }
    
    
    
    
    
    // размер ячейки
    private func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)") // нажатие на ячейку
    }


}


struct Student {
    var name: String
    var bio: String
    var image: UIImage
}


extension TableViewController : UITableViewDataSource {
    // количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsArray.count
        //
        }
    
    // заполнение ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "studentCell") as! TableViewCell
        
        let model = studentsArray[indexPath.row]
        cell.nameCell?.text = model.name
        cell.bioCell?.text = model.bio
        cell.imageCell?.image = model.image
        cell.imageCell.layer.cornerRadius = cell.imageCell.frame.size.height / 2
        cell.imageCell.clipsToBounds = true
        return cell
    }
    
}
