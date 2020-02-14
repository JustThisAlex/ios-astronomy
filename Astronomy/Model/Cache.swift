//
//  Cache.swift
//  Astronomy
//
//  Created by Alexander Supe on 14.02.20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class Cache<Key: Hashable, Value> {
    var dictionary = [Key : Value]()
    let queue = DispatchQueue.init(label: "Cache")
    func cache(value: Value, for key: Key) {
        queue.async {
            self.dictionary.updateValue(value, forKey: key)
        }
    }
    
    func value(for key: Key) -> Value? {
        queue.sync {
            return self.dictionary[key]
        }
    }
}
