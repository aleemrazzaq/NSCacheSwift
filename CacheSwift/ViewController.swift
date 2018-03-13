//
//  ViewController.swift
//  CacheSwift
//
//  Created by AR on 13/03/2018.
//  Copyright © 2018 Aleem. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

  //MARK: Variables
  @IBOutlet weak var tableView: UITableView!
  var listOfURLs: Array = ["http://placehold.it/150/92c952"
,"http://placehold.it/150/771796"
    ,"http://placehold.it/150/24f355"
    ,"http://placehold.it/150/d32776"
    ,"http://placehold.it/150/f66b97"
    ,"http://placehold.it/150/56a8c2"
    ,"http://placehold.it/150/b0f7cc"
    ,"http://placehold.it/150/54176f"
    ,"http://placehold.it/150/51aa97"
    ,"http://placehold.it/150/810b14"
    ,"http://placehold.it/150/1ee8a4"
    ,"http://placehold.it/150/66b7d2"
    ,"http://placehold.it/150/197d29"
    ,"http://placehold.it/150/61a65"
    ,"http://placehold.it/150/f9cee5"
    ,"http://placehold.it/600/54176f"
    ,"http://placehold.it/600/51aa97"
    ,"http://placehold.it/600/810b14"
    ,"http://placehold.it/600/1ee8a4"
    ,"http://placehold.it/600/66b7d2"
    ,"http://placehold.it/600/197d29"
    ,"http://placehold.it/600/61a65"
    ,"http://placehold.it/600/f9cee5"
    ,"http://placehold.it/600/fdf73e"
    ,"http://placehold.it/600/9c184f"
    ,"http://placehold.it/600/1fe46f"
    ,"http://placehold.it/600/56acb2"
    ,"http://placehold.it/600/8985dc"
    ,"http://placehold.it/600/5e12c6"
    ,"http://placehold.it/600/45601a"
    ,"http://placehold.it/600/e924e6"
    ,"http://placehold.it/600/8f209a"
    ,"http://placehold.it/600/5e3a73"
    ,"http://placehold.it/600/474645"
    ,"http://placehold.it/600/c984bf"
    ,"http://placehold.it/600/392537"
    ,"http://placehold.it/600/602b9e"]
  
  
  //MARK: Life Cycles
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  //MARK: Utility Methods
  func initialization()
  {
 
  }
  
}
  
  extension ViewController : UITableViewDelegate {
    
  }

  extension ViewController : UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath as IndexPath)
      cell.textLabel!.text =  "\(indexPath.row) - downloading"
      
      let url = NSURL(string: listOfURLs[indexPath.row])
      
      if let cachedImage = ARCache.sharedInstance.getObjectFromCache(key: "key\(indexPath.row)" as AnyObject) as? UIImage {
        cell.imageView?.image = cachedImage
        cell.contentView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        cell.textLabel!.text =  "Cached"
        return cell
      }
      
      // if not, download image from url
      
      let request = URLRequest(url: url! as URL)
      URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
        if error != nil {
          print(error!)
          return
        }
        
        DispatchQueue.main.async {
          if let image = UIImage(data: data!) {

            ARCache.sharedInstance.setObjectInCache(object: image, key: "key\(indexPath.row)" as AnyObject)
            cell.textLabel!.text =  "downloaded"
            cell.contentView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            cell.imageView?.image = image
          }
        }
        
      }).resume()
      
      return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
      return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return listOfURLs.count
    }
    
  }

