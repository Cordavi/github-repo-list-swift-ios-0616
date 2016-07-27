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
      self.repositoryID = checkRepositoryID(dictionary)
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
      let htmlURLObject = dictionary["html_url"]
      guard let htmlURL = htmlURLObject where String(htmlURLObject) != nil else {
         return NSURL()
      }

      let htmlURLNSURL = NSURL(string: String(htmlURL))
      guard let htmlRepoURL = htmlURLNSURL else {
         return NSURL()
      }
      return htmlRepoURL
   }
   
   func checkRepositoryID(dictionary: [String: AnyObject]) -> String {
      let repoIDObject = dictionary["id"]
      guard let repoID = repoIDObject where String(repoIDObject) != nil else {
         return ""
      }
      let repoIDString = String(repoID)
      return repoIDString
   }
}
