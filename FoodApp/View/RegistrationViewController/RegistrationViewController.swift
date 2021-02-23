//
//  RegistrationViewController.swift
//  FoodApp
//
//  Created by Акнур on 2/23/21.
//  Copyright © 2021 Aknur. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    //MARK: - Constants
    let image = UIImageView(image: #imageLiteral(resourceName: "sushi-2"))
    let loginButton = UIButton(type: .system)
    let forgotButton = UIButton(type: .system)
    let termsButton = UIButton(type: .system)
    let logoButton = UIButton(type: .system)
    let subView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 35
        return view
    }()
    
    let logoTextField: UITextField = {
        let tf = CustomTextField(padding: 35)
        tf.placeholder = "Enter mail"
        tf.layer.shadowOpacity = 5.0
        return tf
    }()
    
    let passwordTextField: UITextField = {
        let tf = CustomTextField(padding: 35)
        tf.placeholder = "Enter Password"
        tf.layer.shadowOpacity = 5.0
        return tf
    }()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        setUp()
    }
    
    //MARK: - ConfigureFunction
    func configureButton() {
        view.backgroundColor = .yellowColor()
        loginButton.customButton(setTitle: "LOGIN", setTitleState: .normal, color: .gray, background: .yellowColor(), radius: 25)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)

        forgotButton.customButton(setTitle: "Forgot Password?", setTitleState: .normal, color: .gray, background: .yellowColor(), radius: 25)
        forgotButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        termsButton.customButton(setTitle: "Don't have account? Sign Up", setTitleState: .normal, color: .gray, background: .yellowColor(), radius: 25)
        termsButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        logoButton.customButton(setTitle: "Login", setTitleState: .normal, color: .gray, background: .white, radius: 20)
        logoButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
    }
    //MARK: - SetupFunction
    func setUp() {
        view.addSubview(image)
        image.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 60, left: 30, bottom: 0, right: 30), size: .init(width: 220, height: 160))
        view.addSubview(loginButton)
        loginButton.anchor(top: image.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 30, left: 80, bottom: 0, right: 80))
        
        view.addSubview(subView)
        subView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 300, left: 40, bottom: 10, right: 40), size: .init(width: 70, height: 200))
        
        view.addSubview(forgotButton)
        forgotButton.anchor(top: subView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 30, left: 40, bottom: 0, right: 40))
        
        view.addSubview(termsButton)
        termsButton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 40, bottom: 30, right: 40))
        
        view.addSubview(logoButton)
        logoButton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 15, bottom: 80, right: 15), size: .init(width: 70, height: 50))
      
        subView.addSubview(logoTextField)
        logoTextField.anchor(top: subView.topAnchor, leading: subView.leadingAnchor, bottom: nil, trailing: subView.trailingAnchor, padding: .init(top: 15, left: 15, bottom: 0, right: 15))
        
        subView.addSubview(passwordTextField)
        passwordTextField.anchor(top: nil, leading: subView.leadingAnchor, bottom:subView.bottomAnchor , trailing: subView.trailingAnchor,padding: .init(top: 0, left: 15, bottom: 15, right: 15))
    }

}
