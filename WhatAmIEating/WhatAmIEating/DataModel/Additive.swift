//
//  Additive.swift
//  WhatAmIEating
//
//  Created by Peterses on 03/05/2021.
//

import Foundation
import RealmSwift

class Additive: Object {
    
    @objc dynamic var eNumber: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var status: String = ""
    @objc dynamic var eDescription: String = ""

}
