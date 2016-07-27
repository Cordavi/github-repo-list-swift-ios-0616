//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
   
   static let sharedInstance = ReposDataStore()
   var repositories = [GithubRepository]()
   
   func getRepositoriesWithCompletion(completion: () -> Void) {
      GithubAPIClient.getRepositoriesWithCompletion { responseData in
         ReposDataStore.sharedInstance.repositories.removeAll()
         
         for repository in responseData {
            ReposDataStore.sharedInstance.repositories.append(GithubRepository(dictionary: repository))
         }
         completion()
      }
   }
}
