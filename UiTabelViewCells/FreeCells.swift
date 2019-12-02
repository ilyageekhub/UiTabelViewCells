//
//  FreeCells.swift
//  UiTabelViewCells
//
//  Created by Admin on 01.12.2019.
//  Copyright © 2019 Ilya Ilushenko. All rights reserved.
//

import UIKit

class FreeCells: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    var onButtonHandler: (() -> Void)?
    
    @IBAction func ActionButton(_ sender: Any) {
        onButtonHandler?()
    }
    
}
