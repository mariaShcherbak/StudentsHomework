

import UIKit


class TableViewController: UIViewController, UITableViewDelegate, StudentsList {
    
    
    func makeStudentsList(student: Student) {
        studentsArray.append(student)
        print("makeStudentsList!!!")
        myTableView.reloadData()
    }
    
    func updateStudent(_ student: Student, atIndex: Int) {
        studentsArray[atIndex] = student
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
    private var filteredStudentsArray = [Student]()
    
    private let search = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty : Bool {
        guard let text = search.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return search.isActive && !searchBarIsEmpty
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   bidNavigationBar()
        myTableView.rowHeight = 94
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search student"
        
        
        navigationItem.searchController = search
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        
        myTableView.dataSource = self
        myTableView.delegate = self
        
        
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
        let newVC = storyboard?.instantiateViewController(withIdentifier: "TextFieldViewController") as? TextFieldViewController
       navigationController?.pushViewController(newVC!, animated: true)
        newVC!.delegate = self
        
        var student : Student   // для открытия деталей отфильтрованой ячейки
        if isFiltering {
            student = filteredStudentsArray[indexPath.row]
        } else {
            student = studentsArray[indexPath.row]
        }
        newVC?.newStudent = student
        
        newVC?.studentIndex = indexPath.row
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
        if isFiltering {
           return filteredStudentsArray.count
        }
        return studentsArray.count
        }
    
    // заполнение ячеек
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "studentCell") as! TableViewCell
        
        var model: Student
        if isFiltering {
            model = filteredStudentsArray[indexPath.row]
        } else {
            model = studentsArray[indexPath.row]
        }
       
        cell.nameCell?.text = model.name
        cell.bioCell?.text = model.bio
        cell.imageCell?.image = model.image
        cell.imageCell.layer.cornerRadius = cell.imageCell.frame.size.height / 2
        cell.imageCell.clipsToBounds = true
        return cell
    }
}
extension TableViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearch(searchController.searchBar.text!)
    }
    func filterContentForSearch(_ searchText: String)  {
        filteredStudentsArray = studentsArray.filter( {(students: Student) -> Bool in
            return students.name.lowercased().contains(searchText.lowercased())
        })
        myTableView.reloadData()
    }
    
    
}
