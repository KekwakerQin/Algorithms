func enumsDraftCheckingAboutProtocolInto() {
    protocol Action {
        func execute()
    }

    enum Login: Action {
        case login(username: String)
        case logout
        case showProfile
        
        func execute() {
            switch self {
            case .login(let name): print("Loggining to \(name)")
            case .logout: print("Logout from account")
            case .showProfile: print("| Profile |")
            }
        }
    }

    enum Values: Int, CaseIterable {
        case first = 1
        case second, third, forth
        
        static func caseName(_ raw: Int) -> String {
            guard let value = Values(rawValue: raw) else { return "unknown" }
            guard raw <= 3 else { return "unknown" }
            return String(describing: Values(rawValue: raw)!.rawValue)
        }
        
        func previous() -> Values? {
            guard let index = Values.allCases.firstIndex(of: self), index > 0 else { return nil }
            return Values.allCases[index - 1]
        }
        
        static func adding(_ a: Values, _ b: Values) -> Int? {
            print(a.rawValue + b.rawValue) // Разобрался
            let result = a.rawValue + b.rawValue
            print("adding result case of \(result) is \(String(describing: Values(rawValue: result)!))")
            return a.rawValue + b.rawValue
        }
    }

    for i in Values.allCases {
        print("The \(i) is \(i.rawValue)")
        
        if i.rawValue > 1 {
            print("[Calculate] \(i.previous()!.rawValue) and \(i.rawValue) = \(i.previous()!.rawValue + i.rawValue)" )
        }
    }

    let rawName = Values.caseName(2)
    print("[rawName]: \(rawName)")
    let value = Values.adding(.first, .second)
    print(".first and .second equal \(String(describing: value))")

    //let action: Action = Login.login(username: "Cassie")
    //action.execute()
}
