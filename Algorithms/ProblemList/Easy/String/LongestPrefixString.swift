// MARK: IM NOT READY FOR THIS ONE

class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEnd = false
}

class Trie {
    let root = TrieNode()
    
    func insert(_ word: String) {
        var node = root
        for char in word {
            if node.children[char] == nil {
                node.children[char] = TrieNode()
            }
            node = node.children[char]!
        }
        node.isEnd = true
    }
    
    func longestCommonPrefix() -> String {
        var node = root
        var prefix = ""
        
        while node.children.count == 1 && node.isEnd == false {
            if let (char, next) = node.children.first {
                prefix.append(char)
                node = next
            }
        }
    return prefix
    }
}

func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.isEmpty { return "" }
    
    let trie = Trie()
    for word in strs {
        trie.insert(word)
    }
    
    return trie.longestCommonPrefix()
}


// MARK: Standard soultion
//
//func longestCommonPrefix(_ strs: [String]) -> String {
//    if strs.isEmpty { return "" }
//    
//    var prefix = strs[0]
//    
//    for str in strs {
//        while !str.hasPrefix(prefix) {
//            prefix = String(prefix.dropLast())
//            if prefix.isEmpty { return "" }
//        }
//    }
//    
//    return prefix
//}
//
// strs = ["flower","flow","flight"]
