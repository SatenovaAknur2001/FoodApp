//
//  SignUpViewController.swift
//  FoodApp
//
//  Created by Акнур on 2/25/21.
//  Copyright © 2021 Aknur. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
class SignUpViewController: UIViewController {
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "firebase")
        return iv
    }()
    
    lazy var emailContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "message"), emailTextField)
    }()
    
    lazy var passwordContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "password"), passwordTextField)
    }()
    
    lazy var usernameContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "profile"), usernameTextField)
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    lazy var usernameTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Username", isSecureTextEntry: false)
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor.backgroundColor(), for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.layer.cornerRadius = 0
        return button
    }()
    
    let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account ?", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign in", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        button.isEnabled = true
        return button
    }()
     //MARK: - Properties
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor()
        configureViewComponents()
    }
    
    //MARK: -Setup Functions
    func configureViewComponents() {
        view.backgroundColor = UIColor.backgroundColor()
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 60, left: 0, bottom: 0, right: 0), size: .init(width: 160, height: 160))
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: logoImageView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 24, left: 32, bottom: 0, right: 32), size: .init(width: 0, height: 50))
        
        view.addSubview(passwordContainerView)
        passwordContainerView.anchor(top: emailContainerView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 32, bottom: 0, right: 32), size: .init(width: 0, height: 50))
        
        view.addSubview(usernameTextField)
        usernameTextField.anchor(top: passwordTextField.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 20, left: 32, bottom: 0, right: 32), size: .init(width: 0, height: 50))
        
        view.addSubview(loginButton)
        loginButton.anchor(top: passwordContainerView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 80, left: 32, bottom: 0, right: 32), size: .init(width: 0, height: 50))
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 32, bottom: 32, right: 32), size: .init(width: 0, height: 50))
    }
    
    //MARK: - Selectors
    
    @objc func handleLogin() {
        guard let  email = emailTextField.text else {return}
        guard let  password = passwordTextField.text else {return}
        guard let  username = usernameTextField.text else {return}
        
        createUser(withEmail: email, password: password, username: username)
        
    }
    
    @objc func handleShowSignUp () {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - API
    
    func createUser(withEmail email: String, password: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("Failed to sign user up with error:", error.localizedDescription)
                return
            }
            
            guard let uid = result?.user.uid else {return}
            
            let values = ["email": email, "username": username]
            
            Database.database().reference().child("users").child(uid).updateChildValues(values) { (error, ref) in
                
                if let error = error {
                    print("Failed to update database values with error: ", error.localizedDescription)
                    return
                }
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
