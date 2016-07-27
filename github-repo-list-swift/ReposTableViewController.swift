//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
   let dataStore = ReposDataStore.sharedInstance
   var gitHubData = [GithubRepository]()
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.tableView.accessibilityLabel = "tableView"
      self.tableView.delegate = self
      
      dataStore.getRepositoriesWithCompletion {
         self.gitHubData = self.dataStore.repositories
         dispatch_async(dispatch_get_main_queue()) {
            // your code that touches the UI here, like, maybe:
            self.tableView.reloadData()
         }
      }
   }
   
   // MARK: - Table view data source
   
   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return gitHubData.count
   }
   
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
      
      cell.textLabel?.text = gitHubData[indexPath.row].fullName
      return cell
   }
   
}

