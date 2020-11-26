//
//  TableViewController.swift
//  Birthdays
//
//  Created by Лера Тарасенко on 01.11.2020.
//

import UIKit

class TableViewController: UITableViewController {
    
    private let cellIdentifier = "datesCell"
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var events: [Event] = [Event(icon: nil,
                                         nameEvent: "День рождения Леры Тарасенко Андреевны",
                                         date: "16.09.1998",
                                         daysBeforeTheEvent: 200),
    Event(nameEvent: "Свадьба мамы", date: "30.09.2020", daysBeforeTheEvent: 300),
    Event(icon: nil, nameEvent: "Юбилей", date: "12.07.2019", daysBeforeTheEvent: 54)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - setup navigationBar
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Marker Felt", size: 25.0)!];
        navigationItem.title = "Даты"
        navigationItem.searchController = searchController
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0,
                                                         y: 0,
                                                         width: tableView.frame.size.width,
                                                         height: 1)) //убираем разлиновку пустых строк
        
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DateCell
        
        
        let event = events[indexPath.row]
        
        let image: UIImage?
        
        if let icon = event.icon {
            image = UIImage(data: icon)
        } else {
            image = UIImage(systemName: "photo.fill.on.rectangle.fill")
        }
        
        cell.iconImage.image = image
        cell.nameEventLabel.text = event.nameEvent
        cell.dateLabel.text = event.date
        cell.daysBeforeTheEventLabel.text = "\(event.daysBeforeTheEvent) \n дн."
        
        return cell
    }
    
    
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
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "segueDetail" {
             guard let indexPath = tableView.indexPathForSelectedRow else { return }
             let event = events[indexPath.row]
             let detailEventVC = segue.destination as! DetailTableViewController
            detailEventVC.currentEvent = event
         }
     }
     
    
}
