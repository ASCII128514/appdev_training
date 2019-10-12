//
//  CatDetailViewController.swift
//  assignment_1
//
//  Created by luhanfeng on 2019/9/17.
//  Copyright © 2019 luhanfeng. All rights reserved.
//

import UIKit

class CatDetailViewController: UIViewController {

    @IBOutlet weak var catImage: UIImageView!

    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var breed: UILabel!

    @IBOutlet weak var year: UILabel!

    
    var catName = ""
    var age = 0
    var type = ""
    var image:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("in detail")
        super.viewDidLoad()
        name.text = "The cat's name is \(catName)"
        breed.text = "it's a \(type)"
        year.text = "it's \(age) year(s) old"
        catImage.image = image
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
