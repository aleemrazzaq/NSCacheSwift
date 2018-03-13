# NSCacheSwift
NSCache holds the item in memory and is used for optimal performance. But it takes up memory (RAM) and you really should make sure that if you use NSCache that you respond to memory warnings and purge the NSCache in those cases. And when the app terminates, the NSCache is lost.
