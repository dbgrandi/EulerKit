//
// Using names.txt (right click and 'Save Link/Target As...'), a 46K text
// file containing over five-thousand first names, begin by sorting it into
// alphabetical order. Then working out the alphabetical value for each
// name, multiply this value by its alphabetical position in the list to
// obtain a name score.
//
// For example, when the list is sorted into alphabetical order, COLIN,
// which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the
// list. So, COLIN would obtain a score of 938 × 53 = 49714.
//
//
// What is the total of all the name scores in the file?
//

import Foundation

class Problem22: EulerProblem {
  
  func loadNames() -> [String] {
    //
    // TODO: Of course, you should set this to a path on your machine, or file
    // a PR to allow passing in args to problems. :)
    //
    let path = "/Users/dbgrandi/watched/dbgrandi/swiftEuler/euler/Assets/p022_names.txt"
    if !NSFileManager.defaultManager().fileExistsAtPath(path) {
        fatalError("Names file does not exist at \(path)")
    }
    let text:NSString = try! String(contentsOfFile:path, encoding: NSUTF8StringEncoding)

    let noQuotes = text.stringByReplacingOccurrencesOfString("\"", withString: "")
    var names = noQuotes.componentsSeparatedByString(",")
    
    names.sortInPlace({$0 < $1})
    return names
  }

  let letters = ["","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]

  func alphabeticalValue(s:String) -> Int {
    return Array(s.characters).map({ self.letters.indexOf((String($0)).uppercaseString)! }).reduce(0,combine: +)
  }

  override func run() {
    let names = loadNames()
    let total = (0..<names.count).map({ ($0+1) * self.alphabeticalValue(names[$0]) }).reduce(0,combine: +)

    print("total = \(total)")
  }
}
