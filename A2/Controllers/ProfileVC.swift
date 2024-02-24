//
//  ProfileVC.swift
//  A2
//
//  Created by Vin Bui on 6/4/23.
//

import UIKit

// NOTE: these are fn that are passed to child views e.g. EditProfile
protocol UpdateMajorTextDelegate: AnyObject {
    // Shared menu between two VC
    // Create function that allows me to pass info from the delegator to the delegate
    
    // Child VC to pass info to the parent VC. Can pass it through this fn. Just an interface
    // only create function header and not implement it
    func updateMajorText(newMajorText: String)
}

protocol UpdateHometownTextDelegate: AnyObject {
    func updateHometownText(newHometownText: String)
}


class ProfileVC: UIViewController {
    
    // MARK: - Properties (view)
    private let profileImage = UIImageView()
    private let name = UILabel()
    private let bio = UILabel()
    private let hometownIcon = UIImageView()
    private let hometown = UILabel()
    private let majorIcon = UIImageView()
    private let major = UILabel()
    private let editProfileButton = UIButton()
    
    // MARK: - Properties (data)
    private let profileImageWidth: CGFloat = 128
    private let profileImageHeight: CGFloat = 128
    private let viewMargin: CGFloat = 32
    private let nameText: String = "Vin Bui"
    private let bioText: String = "Never waste diamonds on a hoe"
    
    private var hometownText: String = "Dallas, TX"
    private var majorText: String = "Informaition Science"
    
    private let editButtonText: String = "Edit Profile"
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "My Profile"
        setupProfileImage()
        setupName()
        setupBio()
        setupIcon(targetView: hometownIcon, referenceView: bio, superview: view, topAnchorConstant: 24, imageName: "hometownIcon", iconWidthAnchorConstant: 24, iconHeightAnchorConstant: 24)
        setupIconUILabel(icon: hometownIcon, iconLabel: hometown, iconText: hometownText)
        setupIcon(targetView: majorIcon, referenceView: hometownIcon, superview: view, topAnchorConstant: 24, imageName: "majorIcon", iconWidthAnchorConstant: 24, iconHeightAnchorConstant: 24)
        setupIconUILabel(icon: majorIcon, iconLabel: major, iconText: majorText)
        setupEditProfileButton()
    }
    
    // MARK: - Set Up Views
    private func setupProfileImage() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage)
        
        profileImage.image = UIImage(named: "Dog")
        profileImage.layer.cornerRadius =  0.5 * profileImageWidth
        profileImage.layer.masksToBounds = true
        profileImage.contentMode = .scaleAspectFit
        
        
        NSLayoutConstraint.activate([
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 83),
            profileImage.widthAnchor.constraint(equalToConstant: profileImageWidth),
            profileImage.heightAnchor.constraint(equalToConstant: profileImageHeight)
        ])
    }
    
    private func setupName() {
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        
        name.text = nameText
        name.textColor = UIColor.a2.black
        name.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        name.textAlignment = .center
        
        
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            name.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            name.widthAnchor.constraint(equalToConstant: 329),
            name.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    private func setupBio() {
        bio.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bio)
        
        bio.text = bioText
        bio.textColor = UIColor.a2.black
        bio.font = UIFont.italicSystemFont(ofSize: 16)
        bio.textAlignment = .center
        
        
        
        NSLayoutConstraint.activate([
            bio.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bio.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 8),
            bio.widthAnchor.constraint(equalToConstant: 329),
            bio.heightAnchor.constraint(equalToConstant: 19)
        ])
    }
    
    
    private func setupIcon(targetView: UIImageView, referenceView: UIView, superview: UIView, topAnchorConstant: CGFloat, imageName: String, iconWidthAnchorConstant: CGFloat, iconHeightAnchorConstant: CGFloat) {
        targetView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(targetView)
        
        targetView.image = UIImage(named: imageName)
        targetView.layer.masksToBounds = true
        targetView.contentMode = .scaleAspectFit
        
        
        NSLayoutConstraint.activate([
            targetView.topAnchor.constraint(equalTo: referenceView.bottomAnchor, constant: topAnchorConstant),
            targetView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: viewMargin),
            targetView.widthAnchor.constraint(equalToConstant: iconWidthAnchorConstant),
            targetView.heightAnchor.constraint(equalToConstant: iconHeightAnchorConstant)
        ])
    }
    
    private func setupIconUILabel(icon: UIImageView, iconLabel: UILabel, iconText: String) {
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(iconLabel)
        
        iconLabel.text = iconText
        iconLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        iconLabel.textColor = UIColor.a2.black
        
        NSLayoutConstraint.activate([
            iconLabel.centerYAnchor.constraint(equalTo: icon.centerYAnchor),
            iconLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            iconLabel.widthAnchor.constraint(equalToConstant: 289),
            iconLabel.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    // TODO: Magic Numbers: While not inherently wrong, you have constants like 732, 64, 32, 56 scattered in your constraint definitions. Consider using variables or calculations to make these more meaningful and easier to update later (bottomPadding, buttonHeight, etc.
    private func setupEditProfileButton() {
        editProfileButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editProfileButton)
        
        editProfileButton.setTitle(editButtonText, for: .normal)
        editProfileButton.setTitleColor(UIColor.a2.white, for: .normal)
        editProfileButton.backgroundColor = UIColor.a2.ruby
        editProfileButton.layer.cornerRadius = 16
        // .touchUpInside = click on it and then let go
        editProfileButton.addTarget(self, action: #selector(pushEditProfileVCOnNavStack), for: .touchUpInside)
        
        // TODO: As a hint, you will need to add the following constraints: leading, trailing, bottom, and height (not width)
        NSLayoutConstraint.activate([
            editProfileButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            editProfileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            editProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            editProfileButton.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
    
    @objc private func pushEditProfileVCOnNavStack() {
        // Passing self establishes a communication channel between the EditProfileVC and the parent view controller, allowing the child view controller (EditProfileVC) to signal important changes related to major and hometown text back to the parent.
        let editProfileVC = EditProfileVC(currentMajor: majorText, currentHometown: hometownText, majorDelegate: self, hometownDelegate: self)
        
        
        // Push VC on the nav stack, which is inside the scene delegate var?<func> if var is not nil then ex function
        navigationController?.pushViewController(editProfileVC, animated: true)
    }
    
}

extension ProfileVC: UpdateMajorTextDelegate, UpdateHometownTextDelegate {
    func updateMajorText(newMajorText: String) {
        major.text = newMajorText
    }
    func updateHometownText(newHometownText: String) {
        hometown.text = newHometownText
    }
    
    
}


