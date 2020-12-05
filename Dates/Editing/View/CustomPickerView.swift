//
//  CustomPickerView.swift
//  Dates
//
//  Created by Лера Тарасенко on 05.12.2020.
//

import UIKit

class CustomPickerView: UIPickerView {
    
    var months: Array<String> = Calendar.current.monthSymbols
    

    //
    //
    //    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    //        return 2
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //       var number = 0
    //        if component == 1 {
    //            return 12
    //        } else if pickerView.numberOfComponents > 1 {
    //            let comps = Calendar.current.dateComponents([.day,.month, .year], from: Date())
    //
    //            let month: Int = pickerView.selectedRow(inComponent: 1)+1
    //            let year: Int = comps.year!
    //            var selectMothComps = DateComponents()
    //            selectMothComps.year = year
    //            selectMothComps.month = month
    //            selectMothComps.day = 1
    //
    //            var nextMothComps = DateComponents()
    //            nextMothComps.year = year
    //            nextMothComps.month = month+1
    //            nextMothComps.day = 1
    //
    //            let thisMonthDate = Calendar.current.date(from: selectMothComps)
    //            let nextMonthDate = Calendar.current.date(from: nextMothComps)
    //
    //            let difference = Calendar.current.dateComponents([.day], from: thisMonthDate!, to: nextMonthDate!)
    //            number = difference.day!
    //        }
    //        return number
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //        if component == 1 {
    //            pickerView.reloadComponent(0)
    //        }
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    //        if component == 0{
    //            return  String(format: "%d", row+1)
    //        } else {
    //            return months[row]
    //        }
    //    }
    //
    //
}

extension CustomPickerView: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
}

extension CustomPickerView: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
        return String(format: "%d", row+1)
        } else {
        return months[row]
        }
    }
    
}


