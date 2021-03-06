package me.d19.nineteen

import org.mindrot.jbcrypt.BCrypt

class HashingService {
	static transactional = false

    def hash(def str) {
        BCrypt.hashpw(str, BCrypt.gensalt(9))
    }
    
    def hash(def str, def it) {
        BCrypt.hashpw(str, BCrypt.gensalt(it.toInteger()))
    }
    
    def matches(def hash, def str) {
        BCrypt.checkpw(str, hash)
    }
}
