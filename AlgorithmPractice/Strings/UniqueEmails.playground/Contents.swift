import Foundation

func numUniqueEmails(_ emails: [String]) -> Int {
    var emailSet = Set<String>()
    for email in emails {
        let address = email.components(separatedBy: "@")
        let name = address[0].components(separatedBy: "+").first!.filter({$0 != "."})
        print(name)
        print(address[0].components(separatedBy: "+").first!)
        emailSet.insert(name+address.last!)
    }
    return 0
}

let emails = ["test.email+alex@leetcode.com", "test.e.mail+bob.cathy@leetcode.com", "testemail+david@lee.tcode.com"]
numUniqueEmails(emails)
