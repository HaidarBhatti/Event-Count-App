//
//  UIViewController+Extension.swift
//  MVVMLearning
//
//  Created by Haidar Bhatti on 17/02/2023.
//

import UIKit

extension UIViewController{
    
    static func instantiate<T>() -> T{
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "\(T.self)") as! T
        return vc
    }
    
}
