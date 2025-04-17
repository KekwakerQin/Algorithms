func lengthOfLastWord(_ s: String) -> Int {
    return s.trimmingCharacters(in: .whitespaces).split(separator: " ").last!.count
}
