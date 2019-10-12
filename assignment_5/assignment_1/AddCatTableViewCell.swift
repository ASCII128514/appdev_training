//
//  AddCatTableViewCell.swift
//  assignment_1
//
//  Created by luhanfeng on 2019/10/8.
//  Copyright © 2019 luhanfeng. All rights reserved.
//

import UIKit

//var age:Int = -1
class AddCatTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate{

    var addCat:addCatViewController?

    @IBOutlet weak var tv: UITextView!
    
    
    @IBOutlet weak var pv: UIPickerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        pv.delegate = self
        pv.dataSource = self
        tv.delegate = (self as UITextViewDelegate)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 20
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row)
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            age = row
            addCat?.checking()
        addCat?.addCatTableView.reloadRows(at: [IndexPath(row: 0, section: 1)], with: .automatic)
//        addCat?.addCatTableView.reloadSections(IndexSet.init(integer: 1), with: .automatic)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if (tv.tag == 0)
        {
            name = tv.text
        } else {
            type = tv.text
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(tv.textColor == UIColor.gray)
        {
            tv.text = ""
            tv.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if (tv.text == "")
        {
            tv.textColor = UIColor.gray
            if (tv.tag == 0)
            {
                tv.text = "Name"
            } else {
                tv.text = "Type"
            }
        }
        addCat?.checking()
    }
}
