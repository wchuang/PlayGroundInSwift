//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)
print("Hello World \(str)")

var vegetable = "red pepper"
vegetable = "watercress pepper"

switch vegetable {
case "celery":
    print("it's a celery.")
case "cucumber", "watercress":
    print("Good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("It contains pepper.")
default:
    print("Default vegetable")
}


func greet(person: String, day: String) -> String {
    
    return "Hello, \(person), today is \(day)"
}

func greet(_ person: String, on day: String) -> String {
    
    return "Hello, \(person), today is \(day)"
}

func greet(_ person: String, _ day: String) -> String {
    
    return "Hello, \(person), today is \(day)"
}

greet(person: "Frank", day: "Monday")
greet("Frank", on: "Mondy")
greet("Frank", "Mondy")

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}


let statistics = calculateStatistics(scores: [10, 9, 3, 2, 5])
print(statistics.max)
print(statistics.min)

func sumOf(_ numbers: Int...) -> Int {
    
    var sum = 0
    
    for number in numbers {
        sum += number
    }
    
    return sum
}

sumOf(1,2,3,4,5,6,7,8,9,10)
sumOf()
sumOf()

// Return a function

func makeIncrementer() -> ((Int) -> Int) {
    
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    
    return addOne
}

var increment = makeIncrementer()
increment(7)

// Functions as a parameter

func hasAnyMatched(list: [Int], confition: (Int) -> Bool) -> Bool {
    
    for item in list {
        if confition(item) {
            return true
        }
    }
    
    return false
}

func lessThanTen(number: Int) -> Bool {
    
    return number < 10
}

var numbers = [10, 99, 88, 100, 1]
hasAnyMatched(list: numbers, confition: lessThanTen)

numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

numbers.map({
    (number: Int) -> Int in
    if 0 != number % 2 {
        return 0
    }
    return 1
})

let mappedNumbers = numbers.map({
    number in 3 * number
})
print(mappedNumbers)

let sortedNumbers = numbers.sorted{ $0 < $1 }
print(sortedNumbers)

struct Point {
    var x: Int
    var y: Int
}

extension Point: Comparable {}

func ==(a: Point, b: Point) -> Bool {
    return (a.x*a.x + a.y*a.y) == (b.x*b.x + b.y*b.y)
}

func <(a: Point, b: Point) -> Bool {
    return (a.x*a.x + a.y*a.y) < (b.x*b.x + b.y*b.y)
}

var p1 = Point(x: 1, y: 5)
var p2 = Point(x: 3, y: 3)
var p3 = Point(x: -4, y: 2)

var points = [p1, p2, p3]
points.sorted(by: ==)
points.sorted(by: <)

// Class

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

class EquilateralTriangle: NamedShape {
    
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            print("get")
            return 3.0 * sideLength
        }
        set(aValue) {
            print("set")
            sideLength = aValue / 3.0
        }
        /*
        set {
            sideLength = newValue / 3.0
        }
         */
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 3
print(triangle.perimeter)

class Square: NamedShape {
    
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

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
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)

triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)

var optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
//optionalSquare = nil
let sideLength = optionalSquare?.sideLength
print(sideLength)

