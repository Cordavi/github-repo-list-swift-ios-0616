//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
   var fullName = String()
   var htmlURL = NSURL()
   var repositoryID = String()
   
   init(dictionary: [String: AnyObject]) {
      self.fullName = checkFullName(dictionary)
      self.htmlURL = checkhtmlURL(dictionary)
      self.repositoryID = String(dictionary["id"])
   }
   
   func checkFullName(dictionary: [String: AnyObject]) -> String {
      let fullNameObject = dictionary["full_name"]
      guard let fullName = fullNameObject where String(fullNameObject) != nil else {
         return ""
      }
      let fullNameString = String(fullName)
      return fullNameString
   }
   
   func checkhtmlURL(dictionary: [String: AnyObject]) -> NSURL {
      let repoURLObject = dictionary["html_url"]
      let htmlURL = String(repoURLObject)
      let repoURL = NSURL(string: htmlURL)
      guard let returnRepoURL = repoURL else {
         return NSURL()
      }
      return returnRepoURL
   }
   
   func
}
