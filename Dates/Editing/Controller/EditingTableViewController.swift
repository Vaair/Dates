//
//  EditingTableViewController.swift
//  Birthdays
//
//  Created by Лера Тарасенко on 01.11.2020.
//

import UIKit

class EditingTableViewController: UITableViewController {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var eventsNameTextField: UITextField!
    @IBOutlet weak var pickerViewWithoutYears: CustomPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    let dateFormatter = DateFormatter()
    
    let currentDate = Calendar.current.dateComponents([.day, .month, .year], from: Date())
    
    var months: Array<String> = []
    
    let maxValue = 1000
    let lengthFirst = 12
    //var lengthSecond = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentDay = currentDate.day ?? 1
        let currentMonth = currentDate.month ?? 1
        
        dateFormatter.locale = Locale(identifier: "ru_RU")
        self.months = dateFormatter.monthSymbols 
        
        pickerViewWithoutYears.delegate = self
        pickerViewWithoutYears.dataSource = self
        pickerViewWithoutYears.tag = 1
        
        pickerViewWithoutYears.selectRow((currentDay - 1), inComponent: 0, animated: true)
        pickerViewWithoutYears.selectRow(((maxValue / 2) * lengthFirst) + (currentMonth - 1), inComponent: 1, animated: true)
        
        datePicker.maximumDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//       //Dispose of any resources that can be recreated.
//    }
    
    @IBAction func hideYear(_ sender: UISwitch) {
        datePicker.isHidden = !datePicker.isHidden
        pickerViewWithoutYears.isHidden = !pickerViewWithoutYears.isHidden
        
    
    }
    
    
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    //
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        // #warning Incomplete implementation, return the number of rows
    //        return 0
    //    }
    
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
    
    
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension EditingTableViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return String(format: "%d", (row+1))
        } else {
            return months[row % lengthFirst]
        }
    }
}

extension EditingTableViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var number = 0
        
        if component == 1 {
            return maxValue * lengthFirst
        } else if pickerView.numberOfComponents > 1{
            
            let comps = Calendar.current.dateComponents([.day, .month, .year], from: Date())
            
            let month: Int = pickerView.selectedRow(inComponent: 1) + 1
            let year: Int = comps.year!
            
            var selectMothComps = DateComponents()
            selectMothComps.year = year
            selectMothComps.month = month
            selectMothComps.day = 1
            
            var nextMothComps = DateComponents()
            nextMothComps.year = year
            nextMothComps.month = month + 1
            nextMothComps.day = 1
            
            let thisMonthDate = Calendar.current.date(from: selectMothComps)
            let nextMonthDate = Calendar.current.date(from: nextMothComps)
            
            let difference = Calendar.current.dateComponents([.day], from: thisMonthDate!, to: nextMonthDate!)
            number = difference.day!
            
            
        }
        return number
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 1 {
            pickerView.reloadComponent(0)
        }
    }
}
