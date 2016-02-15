//
//  MainNavigationController.swift
//  Bfriendly
//
//  Created by Dawson Botsford on 2/13/16.
//  Copyright © 2016 Dawson Botsford. All rights reserved.
//

import Foundation
import UIKit


class MainNavigationController : UINavigationController {
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}