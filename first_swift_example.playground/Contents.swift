import UIKit

var str = "Hello, playgrounds"

let label = "The width is "
let width = 94
let widthLabel = label + String(width)


let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) apples."
let quotation = """
  I said I have \(apples) apples.
  And then I said I have \(apples + oranges) pieces of fruit.
 """
var shoppingList = ["catfish", "water", "tulips"]

var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.4
//reading3 = 9.5

if let reading1 = reading1,
   let reading2 = reading2,
   let reading3 = reading3
{
    (reading1 + reading2 + reading3) / 3.0
}else{
    print("A reading is missing.")
}

let nickname : String? = nil
let fullName : String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"


let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raising and make ants on a log")
case "cucumber","watercress":
    print("that would make a good tea sandwich")
case let x where x.hasSuffix("pepper"):
    print("is it a \(x)?")
    
default:
    print("Everything tastes good in soup")
}

//En büyük sayıyı yazdırır
let interestingNumbers = [
    "Prime" : [2,3,5,7,11,13],
    "Fibonacci" : [1,1,2,48,5,8],
    "Square" : [1,4,9,16,25],
    ]
var largest = 0
for(_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest{
            largest = number
        }
    }
}
print(largest)


var n = 2
while n < 100 {
    n *= 2
}
print(n)

var m = 2
repeat {
    m *= 2
} while m < 100
print(m)


var total = 0
for i in 0...4 {
    total += i
}
print(total)

//Functions and Closures
func greet(person : String,day:String)-> String{
    return "Hello \(person), today is \(day)."
}

var greetFunc = greet(person: "Bob", day: "Tuesday")
print(greetFunc)


func greet2( _ person:String, on day:String)-> String{
    return "Hello \(person), today is \(day)."
}
var greetFunc2 = greet2( "John",on: "Wednesday")
print(greetFunc2)

func calculateStatistics(scores : [Int]) -> (min: Int, max: Int, sum:Int) {
    
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        }else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [5,3,200,3,9])
print(statistics.sum)


func returnFifteen() -> Int {
    var y = 10
    
    func add(){
        y += 5
    }
    add()
 
    return y
}
returnFifteen()


func makeIncrement() -> ((Int) -> Int){
    func addOne(number: Int) -> Int{
        return 1 + number
    }
    return addOne
}
var increment = makeIncrement()
increment(7)


//Verilen sayı listesi 10 dan küçük eleman var ise true dönderir
func hasAnyMatches(list: [Int], contdition : (Int) -> Bool) -> Bool {
    
    for item in list {
        if contdition(item)
        {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int ) -> Bool {
    return number < 10
}

var numbers = [20,19,9,12]
hasAnyMatches(list: numbers, contdition: lessThanTen)

/*
numbers.map(
    { (number : Int ) -> Int in
                let result = 3 * number
                return result
})*/
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)


//Objects and Classes

class Shape{
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//*******

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

//**********

class Square: NamedShape{
    var sideLength : Double
    
    init(sideLength : Double,name : String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area()-> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
            return "A square with sides of length \(sideLength) . "
    }
}
let test = Square(sideLength: 5.2, name: "My Test Square")
test.area()
test.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLength : Double = 0.0
    
    init(sideLength: Double, name : String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    override func simpleDescription() -> String {
        return " An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)


class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double,name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "Large square")
print(triangleAndSquare.triangle.sideLength)


let optionalSquare: Square? =
    Square(sideLength: 2.5, name:  "optional square")
let sideLength = optionalSquare?.sideLength


//*************

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine,
         ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
        
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 3){
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades , hearts, diamonds, clubs
    
    func simpleDescription() -> String{
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
            
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

enum ServerResponse{
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
    case let .result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
    case let .failure(message):
        print("Failure... \(message)")
            
}

//*************

struct Card{
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
