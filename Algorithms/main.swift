import Foundation

math{ $0 - $1 }
math(closure: -)
math(closure: ) { $0 - $1 }
math(closure: { $0 - $1 } )
math() {$0 - $1}

func math(closure: (Int,Int) -> Int ) -> Int {
    let result = closure(5,2)
    print(result)
    return result
}
