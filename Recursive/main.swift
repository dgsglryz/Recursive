
import Foundation

func evaluate(_ expr: String) -> Int {
    var i = 0
    return evaluateHelper(expr, &i)
}

func evaluateHelper(_ expr: String, _ i: inout Int) -> Int {
    if i >= expr.count {
        return 0
    }
    
    if expr[expr.index(expr.startIndex, offsetBy: i)].isNumber {
        return Int(String(expr[expr.index(expr.startIndex, offsetBy: i)])) ?? 0
    }
    
    i += 1
    
    let left = evaluateHelper(expr, &i)
    
    i += 1
    
    let right = evaluateHelper(expr, &i)
    
    i += 1
    
    if i < expr.count && expr[expr.index(expr.startIndex, offsetBy: i - 1)] == "+" {
        return left + right
    } else {
        return left * right
    }
}


print(evaluate("7"))
print(evaluate("(2+2)"))
print(evaluate("(1+(2*4))"))
print(evaluate("((1+3)+((1+2)*5))"))



