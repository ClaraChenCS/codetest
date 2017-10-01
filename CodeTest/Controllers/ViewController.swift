//
//  ViewController.swift
//  CodeTest
//
//  Created by Clara Chen on 9/30/17.
//  Copyright © 2017 ClaraChenCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var urlString: String = "https://api.github.com/"
    
    @IBOutlet weak var githubUsername: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func lookupGitUser(_ sender: UIButton) {
        if(githubUsername.text?.isEmpty)!{
            print("username is required. Please enter username");
        }
        var username = githubUsername.text;
        urlString = urlString + "/users/:"+username!+"repos";
        let url = URL(fileURLWithPath: urlString)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        
        session.dataTask(with: url, completionHandler: {(data, response, error) in
           
            let reposJson = data
            print (reposJson)
            print(response)
        })
    }
    
}

