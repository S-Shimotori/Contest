import Foundation

let arguments:[AnyObject] = NSProcessInfo.processInfo().arguments
let fileName = arguments[1] as String

if let sr = StreamReader(path:fileName){
    if let sw = StreamWriter(path:"answer.txt"){
        let numberOfQuestions = sr.nextLine()!.toInt()!
        for i in 1 ... numberOfQuestions{
            sw.print("Case #\(i):")
            
            
            let words = split(sr.nextLine()!){$0 == " "}.reverse()
            var answer = ""
            for word in words{
                answer += " "+word
            }
            
            
            sw.println(answer)
        }
        sr.close()
        sw.close()
    }
}