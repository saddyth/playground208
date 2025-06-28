
import Foundation

//Task 1.1
//Создание простой структуры
//Создайте структуру Person, которая содержит свойства:
//name (String): имя человека.
//age (Int): возраст человека.
//Создайте экземпляр структуры и выведите его свойства.

struct Person {
    let name: String
    let age: Int
    var isAdult: Bool {
        get{
            return age >= 18
        }
    }
    
    func greet() {
        print("Hello, my name is \(name) and I'm \(age) years old")
    }
}

let person1 = Person(name: "Polina", age: 21)
print(person1.name, person1.age)

//Task 1.2
//Создание простого класса
//Создайте класс Car, который содержит свойства:
//brand (String): марка автомобиля.
//model (String): модель автомобиля.
//year (Int): год выпуска.
//Создайте экземпляр класса и выведите его свойства.

class Car {
    var brand: String
    var model: String
    var year: Int
    static var totalCars = 0
    var description: String {
        get {
            return "This is \(brand) \(model) from \(year)"
        }
    }
    
    init(carBrand: String, carModel: String, carYear: Int) {
        brand = carBrand
        model = carModel
        year = carYear
        Car.totalCars += 1
    }
    static func printTotalCars() {
        print(Car.totalCars)
    }
    
    func startEngine() {
        print("The \(brand) \(model) engine has started.")
    }
}

let car1 = Car(carBrand: "Honda", carModel: "Accord", carYear: 2003)
print(car1.brand, car1.model, car1.year)

//Task 1.3
//Методы в структуре
//Добавьте в структуру Person метод greet(), который выводит приветствие в формате: "Hello,my name is [имя] and I am [возраст] years old.".*/
person1.greet()


//Task 1.4
// Методы в классе
//Добавьте в класс Car метод startEngine(), который выводит сообщение: "The [марка] [модель] engine has started.".
car1.startEngine()


//Task 1.5
//Инициализатор
//Добавьте к классу Car инициализатор, который принимает параметры brand, model и year и инициализирует соответствующие свойства.

//Сделано в 1.2


//Task 2.1
//Различия между классами и структурами
//Создайте структуру Point с координатами x и y.
//Создайте два экземпляра структуры и измените одно из свойств одного экземпляра. Проверьте, изменился ли другой экземпляр.
//Повторите то же самое для класса. Объясните разницу между поведением структуры и класса.Объяснение написать комментарием в коде

// Структуры это value type (тип значения), классы - reference type (ссылочный тип)
// В случае со структурами в переменных содержится копия экземпляра, изменения в одной переменной не отражается на другой
//  В случае с классами переменные ссылаются на 1 экземпляр. При изменении свойства в 1 переменной будет изменено и свойство во 2 переменной. Если создать 2 разных экземпляра, то изменения в 1 экземпляре не затронут 2 экземпляр

struct Point {
    var x: Int
    var y: Int
    func isEqual(to: Point) -> Bool {
        if self.x == to.x && self.y == to.y {
            return true
        } else {
            return false
        }
    }
}

var coord1 = Point(x: 15, y: 10)
var coord2 = Point(x: 5, y: 20)
coord1.x = 10
coord2.x = 12

print(coord1.x, coord2.x)

class Point2 {
    var x = 15
    var y = 22
}
let coordClass1 = Point2()
let coordClass2 = Point2()
coordClass1.x = 10
coordClass1.x = 15
print(coordClass1.x, coordClass1.x)


//Task 2.2
//Вычисляемые свойства
//Добавьте к структуре Person вычисляемое свойство isAdult, которое возвращает true, если возраст больше или равен 18, и false в противном случае.
print(person1.isAdult)

//Task 2.3
//Добавьте к классу Car свойство только для чтения description, которое возвращает строку в формате: "This is a [марка] [модель] from [год].".
print("2.3",car1.description)


//Task 2.4
//Создайте базовый класс Vehicle с общими свойствами (brand, model, year) и методом drive(), который выводит сообщение: "Driving the [марка] [модель]."
//Создайте подкласс Car, который добавляет свойство numberOfDoors и переопределяет метод drive() для вывода дополнительной информации о количестве дверей.

class Vehicle {
    var brand: String
    var model: String
    var year: Int
    func drive() -> String{
        return "Driving the \(brand) \(model)"
    }
    init(brand: String, model: String, year: Int) {
        self.brand = brand
        self.model = model
        self.year = year
    }
}

class Car1: Vehicle {
    var numberOfDoors: Int
    
    init(brand: String, model: String, year: Int, numberOfDoors: Int) {
        self.numberOfDoors = numberOfDoors
        super.init(brand: brand, model: model, year: year)
    }
    override func drive() -> String {
        return "Driving the \(brand) \(model) with \(numberOfDoors) doors"
    }
}

let hondaCar = Car1(brand: "Honda", model: "Accord", year: 2003, numberOfDoors: 4)
print("2.4",hondaCar.drive())


//Task 2.5
//Протоколы *
//Создайте протокол Describable с требованием свойства description типа String.
//Сделайте структуру Person и класс Car конформирующими этому протоколу.

protocol Describable {
    var description: String { get }
}

struct PersonProtocol: Describable {
    var description: String
    let name: String
    let age: Int
    var isAdult: Bool {
        get{
            return age >= 18
        }
    }
    
    func greet() {
        print("Hello, my name is \(name) and I'm \(age) years old")
    }
}

class Car2: Describable {
    var description: String
    var brand: String
    var model: String
    var year: Int
    
    init(carBrand: String, carModel: String, carYear: Int, carDescription: String) {
        brand = carBrand
        model = carModel
        year = carYear
        description = carDescription
    }
    func startEngine() {
        print("The \(brand) \(model) engine has started.")
    }
}


//Task 3.1
//Композиция
//Создайте класс Address с свойствами street, city, zipCode.
//Создайте класс Person, который содержит свойства name, age и address (экземпляр класса Address).
//Создайте экземпляр класса Person и выведите полную информацию о человеке, включая адрес.

class Address {
    var street: String
    var city: String
    var zipCode: Int
    init(street: String, city: String, zipCode: Int) {
        self.street = street
        self.city = city
        self.zipCode = zipCode
    }
}

class User{
    var name: String
    var age: Int
    var address: Address
    init(name: String, age: Int, street: String, city: String, zipCode: Int){
        self.name = name
        self.age = age
        self.address = Address(street: street, city: city, zipCode: zipCode)
    }
    func printInfo(){
        print("Name \(name), Age \(age), Address \(address.city) \(address.street) \(address.zipCode)")
    }
}

let user1 = User(name: "Polina", age: 21, street: "Nevskiy", city: "Saint-Petersburg", zipCode: 194873)
user1.printInfo()


//Task 3.2
//Добавьте к классу Car статическое свойство totalCars, которое отслеживает общее количество созданных экземпляров класса.
//Добавьте статический метод printTotalCars(), который выводит текущее значение totalCars.
let car1_2 = Car(carBrand: "Hyundai", carModel: "Solaris", carYear: 2010)
let car1_3 = Car(carBrand: "Honda", carModel: "Civic", carYear: 2005)
Car.printTotalCars()

//Task 3.3
//Создайте структуру Rectangle с свойствами width и height.
//Добавьте инициализатор, который принимает только площадь прямоугольника и вычисляет ширину и высоту, предполагая, что они равны.

struct Rectangle {
    var width: Double
    var height: Double
    init(square: Double) {
        let side = sqrt(square)
        self.width = side
        self.height = side
    }
    func getWnH() {
        print(width, height)
    }
}
let findSide = Rectangle(square: 16)
findSide.getWnH()


//Task 3.4
//Создайте класс Book с свойствами title и author.
//Создайте метод copy(), который создает новый экземпляр класса с такими же свойствами.
class Book {
    var title: String
    var author: String
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
    func copy() -> Book {
        return Book(title: title, author: author)
    }
}

let book1 = Book(title: "Idiot", author: "Dostoevskiy")
print("Книга 1 \(book1.title) \(book1.author)")
let book2 = book1.copy()
print("Книга 2 \(book2.title) \(book2.author)")

//Task 3.5
//Сравнение объектов
//Создайте структуру Point с свойствами x и y.
//Реализуйте метод isEqual(to:), который сравнивает две точки и возвращает true, если их координаты совпадают.
var coord3 = Point(x: 10, y: 12)
var coord4 = Point(x: 10, y: 12)
print(coord3.isEqual(to: coord4))

//Task 4.1
//Хранение массива объектов
//Создайте класс Student с свойствами name и grade.
//Создайте класс Classroom, который хранит массив студентов и содержит методы:
//addStudent(_:): добавляет студента в класс.
//removeStudent(_:): удаляет студента из класса.
//getAverageGrade(): возвращает средний балл всех студентов.

class Student {
    let name: String
    var grade: Double
    init(name: String, grade: Double) {
        self.name = name
        self.grade = grade
    }
}

class Classroom {
    var classArr: [Student]
    init(classArr: [Student]) {
        self.classArr = classArr
    }
    
    func addStudent(addedStudent: Student) {
        classArr.append(addedStudent)
    }
    
    func removeStudent(removedStudent: Student) {
        var isInArray = false
        var studentIndex = Int()
        if !classArr.isEmpty {
            for (index,student) in classArr.enumerated() {
                if student === removedStudent {
                    isInArray = true
                    studentIndex = index
                    break
                }
            }
            if isInArray {
                classArr.remove(at: studentIndex)
            }
        } else {
            print("Класс пустой, некого удалять")
        }
        
    }
    
    func getAverageGrade() -> Double? {
        guard !classArr.isEmpty else {
            return nil
        }
        var gradeSum = Double()
        for student in classArr{
            gradeSum += student.grade
        }
        return gradeSum/Double(classArr.count)
    }
    
    func printArr(){
        for student in classArr {
            print(student.name, student.grade)
        }
        
    }
}

let student1 = Student(name: "Anna", grade: 7)
let student2 = Student(name: "Pavel", grade: 10)
let student3 = Student(name: "Artem", grade: 15)

let classArr = Classroom(classArr: [])

classArr.addStudent(addedStudent: student1)
classArr.addStudent(addedStudent: student2)
classArr.addStudent(addedStudent: student3)
classArr.printArr()

classArr.removeStudent(removedStudent: student3)
classArr.printArr()

if let averageGrade = classArr.getAverageGrade() {
    print("Средний балл ", averageGrade)
} else {
    print("Массив пустой")
}


//Task 4.2
//Константные свойства
//Создайте класс Circle с свойством radius и константным свойством pi = 3.14159 .
//Добавьте вычисляемое свойство area, которое вычисляет площадь круга.

class Circle {
    var radius: Double
    let pi = 3.14159
    var area: Double{
        return radius * radius * pi
    }
    init(radius: Double) {
        self.radius = radius
    }
    
}

let circleArea = Circle(radius: 5)
print(circleArea.area)

//Task 4.3
//Расширения
//Создайте расширение для класса String, которое добавляет метод isPalindrome(), проверяющий, является ли строка палиндромом.

extension String {
    func isPalindrome() -> Bool {
        if self.isEmpty {
            return false
        }
        if self.lowercased() == String(self.lowercased().reversed()) {
            return true
        } else {
            return false
        }
    }
    
}
let word = "radar"
print(word.isPalindrome())
