//
//  TableViewCell.swift
//  StudentHomework
//
//  Created by Tanya on 15.09.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let idCell = "studentCell"
    @IBOutlet weak var imageCell: UIImageView!
    
    @IBOutlet weak var nameCell: UILabel!
    
    @IBOutlet weak var bioCell: UILabel!
    
    @IBOutlet weak var cellView: TableViewCell!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(true, animated: true)
        
    }

}
