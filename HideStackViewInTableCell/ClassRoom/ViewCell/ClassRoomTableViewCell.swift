//
//  ClassRoomTableViewCell.swift
//  HideStackViewInTableCell
//
//  Created by Jefferson Setiawan on 26/06/18.
//  Copyright © 2018 Jefferson Setiawan. All rights reserved.
//

import UIKit

class ClassRoomTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var activeSwitch: UISwitch!
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var containerView: UIView!
    private var toggleInProcess: () -> Void = {}
    private var toggled: () -> Void = {}
    
    internal let studentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    
    public func setup(classRoom: ClassRoom, toggleInProcess: @escaping () -> (), toggled: @escaping () -> ()) {
        containerStackView.addArrangedSubview(studentStackView)
        self.nameLabel.text = classRoom.name
        self.activeSwitch.isOn = classRoom.isActive
        
        for student in classRoom.students {
            let studentView = StudentView()
            studentView.nameLabel.text = student.name
            studentStackView.addArrangedSubview(studentView)
        }
        activeSwitch.addTarget(self, action: #selector(toggleShowStudents(show:)), for: .valueChanged)
        self.toggleInProcess = toggleInProcess
        self.toggled = toggled
        setupShadow()
    }
    
    @objc func toggleShowStudents(show: Bool) {
        UIView.animate(withDuration: 0.25, animations: {
            self.toggleInProcess()
            self.studentStackView.isHidden = !self.activeSwitch.isOn
            self.containerView.layoutIfNeeded()
        }) { _ in
            self.toggled()
        }
    }
    
    private func setupShadow() {
        containerView.layer.cornerRadius = 3
        containerView.layer.shadowRadius = 2
        containerView.layer.shadowColor = UIColor.red.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = CGSize(width: 1, height: 1)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        for view in studentStackView.subviews {
            view.removeFromSuperview()
        }
    }
}
