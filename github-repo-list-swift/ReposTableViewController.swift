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
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      self.tableView.accessibilityLabel = "tableView"
      self.tableView.delegate = self
      
      dataStore.getRepositoriesWithCompletion {
         dispatch_async(dispatch_get_main_queue()) {
            self.tableView.reloadData()
         }
      }
   }
   
   // MARK: - Table view data source
   
   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return dataStore.repositories.count
   }
   
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
      
      cell.textLabel?.text = dataStore.repositories[indexPath.row].fullName
      return cell
   }
   
}

