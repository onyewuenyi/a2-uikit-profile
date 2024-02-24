//
//  EditProfileVC.swift
//  A2
//
//  Created by Vin Bui on 6/4/23.
//

import UIKit

// Tell EditProfileVC who the delegate/parent VC is
// Needs to be able to store reference to the parent/delegate VC
class EditProfileVC: UIViewController {
    
    // MARK: - Properties (view)
    private let profileImage = UIImageView()
    private let profileNameLabel = UILabel()
    private let profileBioLabel = UILabel()
    private let profileHometownLabel = UILabel()
    private let profileHometownTextField = UITextField()
    private let profileMajorLabel = UILabel()
    private let profileMajorTextField = UITextField()
    private let saveButton = UIButton()
    
    // MARK: - Properties (data)
    // Create a private data properties to store some information that will be passed in from ProfileVC.
    // Create an init function that contains `super.init(nibName: nil, bundle: nil)` line after initializing your properties
    
    // We created the protocol UpdateMajorTextDelegate in the parent/delegate VC Profile. We can still access it
    // var delegate type is the protocol UpdateMajorTextDelegate defined in the delegate/parent VC
    private weak var majorDelegate: UpdateMajorTextDelegate?
    private weak var hometownDelegate: UpdateHometownTextDelegate?
    
    // NOTE: the context of this view is Profile. Do I really need to have profile in the name? I do not think so
    private let profileImageWidth: CGFloat = 96
    private let profileImageHeight: CGFloat = 96
    private let profileImageLeftAndTopMargin: CGFloat = 32
    private let profileImageLeftMargin: CGFloat = -265
    private let profileNameContent = "Vin Bui"
    private let profileBioContent = "Never waste diamonds on a hoe"
    private let profileHometownLabelContent = "Hometown"
    private let profileMajorLabelContent = "Major"
  
    
    // Passed in from ProfileVC
    private var majorTextFieldContent: String
    private var hometownTextFieldContent: String
    
    // MARK: - viewDidLoad and init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Profile"
        view.backgroundColor = UIColor.a2.white
        setupProfileImage()
        setupProfileNameLabel()
        setupProfileBioLabel()
        setupHometownLabel()
        setupHometownTextField()
        setupMajorLabel()
        setupMajorTextField()
        setupSaveButton()
    }
    
    // Who the delegate is? We must specify that this comes from the parent by passing in self.<delegate name> and
    // conforming the delegate/parent VC to the protocol using extensions. This req the class to implement the fn defined in the
    // protocol 
    init(currentMajor: String, currentHometown: String, majorDelegate: UpdateMajorTextDelegate, hometownDelegate: UpdateHometownTextDelegate) {
        self.majorTextFieldContent = currentMajor
        self.hometownTextFieldContent = currentHometown
        self.majorDelegate = majorDelegate
        self.hometownDelegate = hometownDelegate
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Set Up Views
    private func setupProfileImage() {
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage)
        
        profileImage.image = UIImage(named: "Dog")
        profileImage.layer.cornerRadius = 0.5 * profileImageWidth
        profileImage.layer.masksToBounds = true
        profileImage.contentMode = .scaleAspectFit
        
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: profileImageLeftAndTopMargin),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: profileImageLeftAndTopMargin),
            profileImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: profileImageLeftMargin),
            profileImage.widthAnchor.constraint(equalToConstant: profileImageWidth),
            profileImage.heightAnchor.constraint(equalToConstant: profileImageHeight),
        ])
    }
    
    
    private func setupProfileNameLabel() {
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileNameLabel)
        
        profileNameLabel.text =  profileNameContent
        profileNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        profileNameLabel.textColor = UIColor.a2.black
        
        NSLayoutConstraint.activate([
            profileNameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            profileNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            profileNameLabel.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 23),
            profileNameLabel.widthAnchor.constraint(equalToConstant: 217),
            profileNameLabel.heightAnchor.constraint(equalToConstant: 29),
        ])
    }
    
    private func setupProfileBioLabel() {
        profileBioLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileBioLabel)
        
        profileBioLabel.text =  profileBioContent
        profileBioLabel.font = UIFont.italicSystemFont(ofSize: 14)
        profileBioLabel.textColor = UIColor.a2.black
        
        NSLayoutConstraint.activate([
            profileBioLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 4),
            profileBioLabel.centerXAnchor.constraint(equalTo: profileNameLabel.centerXAnchor),
            profileBioLabel.widthAnchor.constraint(equalToConstant: 217),
            profileBioLabel.heightAnchor.constraint(equalToConstant: 17),
        ])
    }
    
    private func setupHometownLabel() {
        profileHometownLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHometownLabel)

        profileHometownLabel.text =  profileHometownLabelContent
        profileHometownLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        profileHometownLabel.textColor = UIColor.a2.black

        NSLayoutConstraint.activate([
            profileHometownLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 40),
            profileHometownLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            profileHometownLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            profileHometownLabel.widthAnchor.constraint(equalToConstant: 329),
            profileHometownLabel.heightAnchor.constraint(equalToConstant: 17),
        ])
    }
    
    private func setupHometownTextField(textFieldSpacing: CGFloat = 12) {
        profileHometownTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHometownTextField)
        
        profileHometownTextField.layer.borderWidth = 1
        profileHometownTextField.layer.borderColor = UIColor.a2.silver.cgColor
        profileHometownTextField.layer.cornerRadius = 8
        profileHometownTextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        profileHometownTextField.textColor = UIColor.a2.black
        profileHometownTextField.placeholder = hometownTextFieldContent
        // Create the spacer view
        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: textFieldSpacing, height: profileHometownTextField.frame.height))
        profileHometownTextField.leftView = spacerView
        profileHometownTextField.leftViewMode = .always

        NSLayoutConstraint.activate([
            profileHometownTextField.topAnchor.constraint(equalTo: profileHometownLabel.bottomAnchor, constant: 4),
            profileHometownTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            profileHometownTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            profileHometownTextField.widthAnchor.constraint(equalToConstant: 329),
            profileHometownTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setupMajorLabel () {
        profileMajorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileMajorLabel)

        profileMajorLabel.text =  profileMajorLabelContent
        profileMajorLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        profileMajorLabel.textColor = UIColor.a2.black

        NSLayoutConstraint.activate([
            profileMajorLabel.topAnchor.constraint(equalTo: profileHometownTextField.bottomAnchor, constant: 24),
            profileMajorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            profileMajorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            profileMajorLabel.widthAnchor.constraint(equalToConstant: 329),
            profileMajorLabel.heightAnchor.constraint(equalToConstant: 17),
        ])
    }
    
    private func setupMajorTextField(textFieldSpacing: CGFloat = 12) {
        profileMajorTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileMajorTextField)
    
        profileMajorTextField.layer.borderWidth = 1
        profileMajorTextField.layer.borderColor = UIColor.a2.silver.cgColor
        profileMajorTextField.layer.cornerRadius = 8
        profileMajorTextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        profileMajorTextField.textColor = UIColor.a2.black
        profileMajorTextField.placeholder = majorTextFieldContent
        // Create the spacer view
        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: textFieldSpacing, height: profileMajorTextField.frame.height))
        profileMajorTextField.leftView = spacerView
        profileMajorTextField.leftViewMode = .always
        
        
        NSLayoutConstraint.activate([
            profileMajorTextField.topAnchor.constraint(equalTo: profileMajorLabel.bottomAnchor, constant: 4),
            profileMajorTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            profileMajorTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            profileMajorTextField.widthAnchor.constraint(equalToConstant: 329),
            profileMajorTextField.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    private func setupSaveButton() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(saveButton)
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(UIColor.a2.white, for: .normal)
        saveButton.backgroundColor = UIColor.a2.ruby
        saveButton.layer.cornerRadius = 16
        saveButton.addTarget(self, action: #selector(popEditProfileVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -64),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            saveButton.heightAnchor.constraint(equalToConstant: 56),
        ])
    }
    
    // pop the the VC and tell the delegate to update its text. We will do this by using the parentVC/delegate reference and
    // calling the function we defined in the protocol and implemented in the extension
    @objc private func popEditProfileVC() {
        navigationController?.popViewController(animated: true)
        // UITextField.text is an optional so you need to do ?? ""
        majorDelegate?.updateMajorText(newMajorText: profileMajorTextField.text ?? "")
        hometownDelegate?.updateHometownText(newHometownText: profileHometownTextField.text ?? "")
    }
}
