//
//  File.swift
//  
//
//  Created by SREININ on 21/9/23.
//

import Foundation
import UIKit

public protocol StringConvertible {
    var rawValue: String {get}
}

public protocol Instantiable: AnyObject {
    static var storyboardName: StringConvertible {get}
}

extension Instantiable {
  public  static func instantiateFromStoryboard() -> Self {
        return instantiateFromStoryboardHelper()
    }
    
    public static func instantiateFromStoryboardHelper<T>() -> T {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: Bundle.module)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}

//MARK: -

 extension String: StringConvertible { // allow string as storyboard name
     public var rawValue: String {
        return self
    }
}

//MARK: -

/** Storing storyboards' names */
public enum StoryboardName: String, StringConvertible {
    case SettingSB = "MySettingSB"
   
}


