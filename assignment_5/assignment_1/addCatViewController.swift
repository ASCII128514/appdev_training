//
//  addCatViewController.swift
//  assignment_1
//
//  Created by luhanfeng on 2019/9/26.
//  Copyright © 2019 luhanfeng. All rights reserved.
//

var age:Int = -1
var name:String = ""
var type:String = ""
import UIKit

class addCatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func checking() -> Void {
        submitbtn.isEnabled = age != -1 && name != "" && type != ""
    }

    var isopen:Bool = false
    @IBOutlet weak var addCatTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addCatTableView.delegate = self
        addCatTableView.dataSource = self
        submitbtn.isEnabled = false
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func submit(_ sender: Any) {
        Cat.addCat(name: name, image: #imageLiteral(resourceName: "download"), age: age, type: type)
        name = ""
        type = ""
        age = -1
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var submitbtn: UIBarButtonItem!
    
    @IBAction func clear(_ sender: Any) {
        name = ""
        type = ""
        age = -1
           dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0)
        {
            return 2
        } else {
            return isopen ? 2:1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addCatTableView.dequeueReusableCell(withIdentifier: "AddCatCell") as! AddCatTableViewCell
        cell.tv.textContainer.maximumNumberOfLines = 1
        cell.tv.textContainer.lineBreakMode = .byTruncatingTail
        cell.tv.isHidden = false
        cell.pv.isHidden = true
        cell.tv.tag = indexPath.row
        cell.addCat = self
        if (indexPath.section != 0) {
            if (indexPath.row == 0) {
                cell.tv.isSelectable = false
                cell.tv.isScrollEnabled = false
                cell.tv.isHidden = false
                cell.pv.isHidden = true
                if (age == -1) {
                    cell.tv.text = "age"
                } else {
                    cell.tv.text = "age " + String(age)
                }

                cell.tv.isUserInteractionEnabled = false
            } else {
                cell.tv.isHidden = true
                cell.pv.isHidden = false
            }
        } else {
            cell.tv.isEditable = true
            cell.tv.textColor = UIColor.gray
            cell.tv.isScrollEnabled = false
            if (indexPath.row == 0) {
                cell.tv.text = "Name"
            } else {
                cell.tv.text = "Type"
            }
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 50
        } else {
            if (indexPath.row == 0) {
                return 50
            } else {
                return 100
            }
        }
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 1 && indexPath.row == 0) {
            isopen = !isopen
        }
        addCatTableView.reloadSections(IndexSet.init(integer: 1), with: .automatic)
    }
    
}
