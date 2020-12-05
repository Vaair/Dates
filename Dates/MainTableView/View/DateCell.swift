//
//  TableViewCell.swift
//  Birthdays
//
//  Created by Лера Тарасенко on 01.11.2020.
//

import UIKit

class DateCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
//    {
//        didSet {
//            iconImage.layer.cornerRadius = iconImage.frame.size.height / 2 //скругление image view
//            iconImage.clipsToBounds = true //обрезка изображения
//        }
//    }
    
    @IBOutlet weak var nameEventLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var daysBeforeTheEventLabel: UILabel!

}
