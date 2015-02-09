import Foundation

let arguments:[AnyObject] = NSProcessInfo.processInfo().arguments
let fileName = arguments[1] as String

let tenKeys = [
    "a":"2","b":"22","c":"222",
    "d":"3","e":"33","f":"333",
    "g":"4","h":"44","i":"444",
    "j":"5","k":"55","l":"555",
    "m":"6","n":"66","o":"666",
    "p":"7","q":"77","r":"777","s":"7777",
    "t":"8","u":"88","v":"888",
    "w":"9","x":"99","y":"999","z":"9999",
    " ":"0",
]

if let sr = StreamReader(path:fileName){
    if let sw = StreamWriter(path:"answer.txt"){
        let numberOfQuestions = sr.nextLine()!.toInt()!
        for i in 1 ... numberOfQuestions{
            sw.print("Case #\(i): ")
            var answer = ""
            var lastCharacter = ""
            let characters = sr.nextLine()!
            for c in characters{
                if let spelling = tenKeys[String(c)]{
                    let key = String(spelling[advance(spelling.startIndex,0)])
                    if lastCharacter==key{
                        answer+=" "
                    }
                    answer+=spelling
                    lastCharacter = key
                }
            }
            sw.println(answer)
        }
        sr.close()
        sw.close()
    }
}