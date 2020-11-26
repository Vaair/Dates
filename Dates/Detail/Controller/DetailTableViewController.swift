//
//  DetailTableViewController.swift
//  Birthdays
//
//  Created by Лера Тарасенко on 01.11.2020.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var currentEvent: Event!
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var daysBeforeTheDaysLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image: UIImage?
        
        if let icon = currentEvent.icon {
            image = UIImage(data: icon)
        } else {
            image = UIImage(systemName: "photo.fill.on.rectangle.fill")
        }
        
        self.iconImage.image = image
        self.eventLabel.text = currentEvent.nameEvent
        self.dateLabel.text = currentEvent.date
        self.daysBeforeTheDaysLabel.text = "через \(currentEvent.daysBeforeTheEvent) дней"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     
     // Configure the cell...
     
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
  
    
}
