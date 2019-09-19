//
//  Cat.swift
//  assignment_1
//
//  Created by luhanfeng on 2019/9/17.
//  Copyright © 2019 luhanfeng. All rights reserved.
//

import UIKit

class Cat: NSObject {

    struct catInstance {
        let name : String!
        let image : UIImage!
        let age : Int!
        let type : String!
        
    }

    static var catArray = [catInstance]()
    static var count : Int = 0
    
    class func addCat(name: String!, image: UIImage!, age: Int!, type: String!) -> Void {
        print("inside print cat")
        print(count)
        catArray.append(catInstance(name: name, image: image, age: age, type: type))
        print(catArray)
        count += 1
    }
    
    class func loadCat(completion: @escaping (Array<Dictionary<String, String>>) -> Void) -> Void {
        let url = URL(string: "http://www.chenziwe.com/cats")!
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, err)
            in
            if ((err) != nil) {
                print("loading unseccessful")
                return
            }
            
            let result = try? JSONSerialization.jsonObject(with: data!, options: []) as! Array<Dictionary<String, String>>

            completion(result!)
        }
        task.resume()
    }

}
