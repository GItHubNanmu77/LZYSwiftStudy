//
//  MineViewController.swift
//  LZYSwiftStudy
//
//  Created by 李志颖 on 2020/2/23.
//  Copyright © 2020 李志颖. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        weakGet()
        owndGet()
        bothNonNil()
        
    }
    
    // 被强引用的对象，两者都可为空用 weak
    func weakGet() {
        var mike : Person?
        var hh : House?
        mike = Person(name: "Mike")
        
        hh = House.init(houseNumber: "A01")
        
        mike?.house = hh
        
        hh?.peron = mike
        
        mike = nil
        hh = nil
    }
    
    // 被强引用的对象，有个或两个不能为空，用unowned
    func owndGet() {
        var mike : Person?
        var card : Card?
        mike = Person.init(name: "mike")
        card = Card.init(cardNum: "123123", person: mike!)
        
        mike?.card = card
        
        mike = nil
        card = nil
    }
    // 两者都不能为空，而且一旦创建就会一直有值，需要一个类使用无主属性，而另外一个类使用隐式展开的可选属性。
    func bothNonNil()  {
        var country : Country?
        country = Country.init(name: "China", captainName: "Beijing")
        
        print("\(country!.captainCity.name) is the captain of \(country!.name)" )
        
        country = nil

        
    }
}

class Person {
   let name : String
    init(name : String) {
        self.name = name
    }
    var house : House?
    var card : Card?
    
    
    deinit {
        print("\(name) has deinit")
    }
}

class House {
    let houseNumber : String
    init(houseNumber : String) {
        self.houseNumber = houseNumber
    }
    weak var peron : Person?
    deinit {
        print("\(houseNumber) has deinitd")
    }
}

class Card {
    let cardNum : String
    unowned var person : Person
    init(cardNum : String, person : Person) {
        self.cardNum = cardNum
        self.person = person
    }
    deinit {
        print("\(cardNum) has deinitd")
    }
}

class Country {
    let name : String
    var captainCity : City!
    init(name: String, captainName: String) {
        self.name = name
        self.captainCity = City.init(name: captainName, country: self)
    }
    deinit {
        print("\(name) has deinited")
    }
}

class City {
    let name : String
    unowned let country : Country
    init(name: String, country : Country) {
        self.name = name
        self.country = country
    }
    deinit {
        print("\(name) has deinited")
    }
}
