//
//  StudentView.swift
//  HideStackViewInTableCell
//
//  Created by Jefferson Setiawan on 26/06/18.
//  Copyright © 2018 Jefferson Setiawan. All rights reserved.
//

import UIKit

public class StudentView: UIStackView {
 
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deleteBtn: UIButton!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    func commonInit() {
        distribution = .fill
        alignment = .fill
        
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        addArrangedSubview(containerView)
    }
}
