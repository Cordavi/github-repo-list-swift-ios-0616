//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.tableView.accessibilityLabel = "tableView"
      
      let urlString = "https://api.github.com/repositories?client_id=" + "\(APIKeys.clientID)" + "&client_secret=" + "\(APIKeys.clientSecret)"
      
      guard let url = NSURL(string: urlString) else {
         return
      }
      
      let urlSession = NSURLSession.sharedSession()
      urlSession.dataTaskWithURL(url) {data, response, error in
         guard let data = data where error == nil else {
            return
         }
         
         do {
            let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: [.AllowFragments]) as? [[String : AnyObject]]
            print(responseData)
         } catch {
            print(error)
         }
      }.resume()
      
   }
   
   // MARK: - Table view data source
   
   
}
