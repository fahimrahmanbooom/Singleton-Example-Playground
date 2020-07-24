import UIKit

// data model
struct Book {
    
    let name:String?
    let author:String?
    
    init(name:String?, author:String?) {
        
        self.name   = name
        self.author =  author
    }
}


// model object
var bookinfo = [Book]()


// singleton class
class Singleton {
    
    static let shared = Singleton()
    
    private init() { }
    
    func getBookInfo() -> [Book]? {
        
        return bookinfo
    }
}



// class where we will put data on model
class FirstClass {
    
    // get data from server (API call)
    func getdataFromserver() {
        
        bookinfo = [
            
        Book(name: "Swift", author: "xyz"),
        Book(name: "Java", author: "abc"),
        Book(name: "Python", author: "klm")]
    }
    
    // get data from model
    func getInfoBook() -> [Book]? {
        
        return Singleton.shared.getBookInfo()
    }
}


// class where we will use our singleton
class SecondClass {
    
    // get data from model
    func anotherGetinfoBook() ->[Book]? {
        
        return Singleton.shared.getBookInfo()
    }
}




// object of a class
var firstclassobj = FirstClass()

// calling singleton function
firstclassobj.getdataFromserver()

// printing data from singleton class
print(firstclassobj.getInfoBook()!)



// object of a class
var secondclassobj = SecondClass()

// printing data from singleton class
print(secondclassobj.anotherGetinfoBook()!)
