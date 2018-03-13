# NSCacheSwift
NSCache holds the item in memory and is used for optimal performance. But it takes up memory (RAM) and you really should make sure that if you use NSCache that you respond to memory warnings and purge the NSCache in those cases. And when the app terminates, the NSCache is lost. https://developer.apple.com/documentation/foundation/nscache

Cache Class:

ARCache.swift is wrapper singleton class has found methods

    func setObjectInCache(object:AnyObject, key:AnyObject) //Store object in cache
    func getObjectFromCache(key:AnyObject) -> AnyObject // Get Object from Cache
    func removeSingleObject(key:AnyObject) // Remove any single object
    func destroyCache() // Flush all caches
    
Usage:

    ARCache.sharedInstance.setObjectInCache(object: image, key: "key" as AnyObject) // to store
    ARCache.sharedInstance.getObjectFromCache(key: "key" as AnyObject) // to fetch from cache
