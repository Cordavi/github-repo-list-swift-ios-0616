//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
   
   var gitHubData: [[String : AnyObject]] = []
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.tableView.accessibilityLabel = "tableView"
      self.tableView.delegate = self
      
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
            let responseData = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [[String: AnyObject]]
            if let responseData = responseData {
               self.gitHubData = responseData
            }
            self.tableView.reloadData()
//            print(responseData?[0]["name"])
         } catch {
            print(error)
         }
      }.resume()
   }
   
   // MARK: - Table view data source
   
   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return gitHubData.count
   }
   
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
      
      cell.textLabel?.text = gitHubData[indexPath.row]["name"] as? String
      return cell
   }
   
   
}
