//
//  ARCache.swift
//  CacheSwift
//
//  Created by AR on 13/03/2018.
//  Copyright © 2018 Aleem. All rights reserved.
//

import Foundation


open class ARCache: NSObject {
  
  let cache : NSCache<AnyObject, AnyObject>
  static let sharedInstance = ARCache()
  
  //MARK:- Variable declerations
  override init() {
    cache = NSCache<AnyObject, AnyObject>()
  }
  
  func setObjectInCache(object:AnyObject, key:AnyObject) {
    cache.setObject(object, forKey: key)
  }
  
  func getObjectFromCache(key:AnyObject) -> AnyObject {
    var object : AnyObject = AnyObject.self as AnyObject
    
    if let cachedVersion = cache.object(forKey: key) {
      // use the cached version
      object = cachedVersion
    } else {

    }

    return object
  }
  
  func removeSingleObject(key:AnyObject) {
    cache.removeObject(forKey: key)
  }
  
  func destroyCache() {
    cache.removeAllObjects()
  }
}
