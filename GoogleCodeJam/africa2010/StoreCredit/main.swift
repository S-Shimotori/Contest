import Foundation

func binarySearch(tuples:[(Int,Int)],search:Int)->(Int,Int)?{
    var left = 0
    var right = tuples.count-1
    
    while left<=right{
        var mid = (left+right)/2
        if tuples[mid].1==search{
            return tuples[mid]
        }else if search - tuples[mid].1>0{
            left = mid + 1
        }else{
            right = mid - 1
        }
    }
    
    return nil
}

let arguments:[AnyObject] = NSProcessInfo.processInfo().arguments
let fileName = arguments[1] as String

if let sr = StreamReader(path:fileName){
    if let sw = StreamWriter(path:"answer.txt"){
        let numberOfQuestions = sr.nextLine()!.toInt()!
        for i in 1 ... numberOfQuestions{
            sw.print("Case #\(i): ")
            
            let money = sr.nextLine()!.toInt()!
            let numberOfItems = sr.nextLine()!.toInt()!
            let items = split(sr.nextLine()!){$0 == " "}
            
            var prices:[(key:Int,value:Int)] = []
            for i in 0..<items.count{
                prices.append(key:i+1,value:items[i].toInt()!)
            }
            let sortedPrices = sorted(prices,{s1,s2 in return s1.value<s2.value})
            
            for i in 0..<sortedPrices.count{
                let price = sortedPrices[i]
                if i>0{
                    let sub = [(Int,Int)](sortedPrices[0...i-1])
                    if let pair = binarySearch(sub,money-price.1){
                        sw.println("\(pair.0) \(price.0)")
                        break
                    }
                }
            }
        }
        sr.close()
        sw.close()
    }
}
