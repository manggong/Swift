//
//  NewSegue.swift
//  Scene-CustomSegue
//
//  Created by 김지환 on 2021/11/03.
//

import UIKit

class NewSegue: UIStoryboardSegue {
    
    override func perform() {
        
        let srcUVC = self.source
        let descUVC = self.destination
        
        UIView.transition(from: srcUVC.view, to: descUVC.view, duration: 2, options: .transitionCurlDown, completion: nil)
    }
}
