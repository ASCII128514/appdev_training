//
//  CatTableViewController.swift
//  assignment_1
//
//  Created by luhanfeng on 2019/9/15.
//  Copyright © 2019 luhanfeng. All rights reserved.
//

import UIKit

class CatTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        if (Cat.count == 0) {
            Cat.loadCat { (res) in
                for i in res {
                    let imgUrl = URL(string: i["image"]!)
                    let name = i["name"]
                    let img = UIImage(data: try! Data(contentsOf: imgUrl!))
                    
                    Cat.addCat(name: name, image: img, age: Int(i["age"]!), type: i["type"])
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            print("this is executed")
            print(Cat.catArray)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // if there an't any cat, add default cat
        
//            Cat.addCat(name: "Cat1", image: #imageLiteral(resourceName: "download"), age: 1, type: "corgi")
//            Cat.addCat(name: "Cat2", image: #imageLiteral(resourceName: "download-1"), age: 2, type: "husky")
//            print("in if ")
        
        
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Cat.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CatCell", for: indexPath) as! CatTableViewCell
        cell.name.text = Cat.catArray[indexPath.row].name
        cell.catImage.image = Cat.catArray[indexPath.row].image

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "CatDetail")
        {
            let destination = segue.destination as! CatDetailViewController
            let indexPath = self.tableView.indexPath(for: sender as! CatTableViewCell)
//            destination.
            destination.catName = Cat.catArray[(indexPath?.row)!].name
            destination.age = Cat.catArray[(indexPath?.row)!].age
            destination.image = Cat.catArray[(indexPath?.row)!].image
            destination.type = Cat.catArray[(indexPath?.row)!].type
        }
    }
 

}
