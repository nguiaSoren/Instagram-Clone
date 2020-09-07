//
//  Extensions.swift
//  Instagram Clone
//
//  Created by OBOUNOU LEKOGO NGUIA Benaja Soren on 7/25/20.
//  Copyright © 2020 OBOUNOU LEKOGO NGUIA Benaja Soren. All rights reserved.
//

import Foundation
import  UIKit

extension UIView {
    
    var height:CGFloat {
    return frame.size.height
    }
    
    var width:CGFloat {
    return frame.size.width
    }
    
    var top:CGFloat {
    return frame.origin.y
    }
    
    var left:CGFloat {
    return frame.origin.x
    }
    
    var right:CGFloat {
    return frame.origin.x + frame.size.width
    }
    
    var bottom:CGFloat {
    return frame.origin.y + frame.size.height
      }
    
}



