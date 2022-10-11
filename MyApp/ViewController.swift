//
//  ViewController.swift
//  MyApp
//
//  Created by nwing on 9/10/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class ViewController: UIViewController {
    
    var traslate = LanguageManagement()
    var timer = Timer()
    var backgroundTaskIdentifier: UIBackgroundTaskIdentifier?
    var timerCounter = 0
    var image = UIImage()
    private var observation : NSKeyValueObservation?
    
    
    @IBOutlet weak var lblBtnContinueToHome: UIButton!
    //    let providerImg = BundleImageProvider(bundle: Bundle.main, searchPath: "8_moon")
    
    var moonImageView : UIImageView = {
       
        let imageview = UIImageView()
        imageview.image = UIImage(named: "8_moon")
        imageview.contentMode = .scaleAspectFit
        return imageview
        
    }()
    
    /// <#Description#>
    var nwingLogoName: UIImageView = {
       
        let imageview = UIImageView()
        imageview.image = UIImage(named: "nwingLogoNamed")
        imageview.contentMode = .scaleAspectFit
        return imageview
        
    }()
    
    /// <#Description#>
    var nwingLogoShadowText: UIImageView = {
       
        let imageview = UIImageView()
        imageview.image = UIImage(named: "shadow")
        imageview.contentMode = .scaleAspectFit
        return imageview
        
    }()
    
    /// <#Description#>
    var nwingLogoShortPrecise: UIImageView = {
       
        let imageview = UIImageView()
        imageview.image = UIImage(named: "shortprecise")
        imageview.contentMode = .scaleAspectFit
        return imageview
        
    }()
    
//    private var animationView : AnimationView?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(moonImageView)
        view.addSubview(nwingLogoName)
        view.addSubview(nwingLogoShadowText)
        view.addSubview(nwingLogoShortPrecise)
        
        //Logo Moon Animated
        animation(image: moonImageView, delay: 0.0, withDuration: 1.0)
        animation(image: moonImageView, delay: 3.0, withDuration: 2.0)
        animateFadeIn(image: moonImageView, delay: 0.0)
        
        //Logo nwingshadows named
        animation(image: nwingLogoName, delay: 0.5, withDuration: 1.5)
        animation(image: nwingLogoName, delay: 3.5, withDuration: 2.5)
        animateFadeIn(image: nwingLogoName, delay: 3.5)
        
        //Logo shadows text
        animation(image: nwingLogoShadowText, delay: 1.0, withDuration: 3.0)
        animation(image: nwingLogoShadowText, delay: 4.0, withDuration: 3.0)
        animateFadeIn(image: nwingLogoShadowText, delay: 4.0)
        
        
        //Logo short & Precise
        animation(image: nwingLogoShortPrecise, delay: 1.5, withDuration: 3.5)
        animation(image: nwingLogoShortPrecise, delay: 4.5, withDuration: 3.5)
        animateFadeIn(image: nwingLogoShortPrecise, delay: 4.5)
        
//        gotoStorieBoard()
        //btnContinue
        lblBtnContinueToHome.titleLabel?.text = traslate.internatiolization(keyText: "lcbtnContinue", commentText: "Continue...")
    
    }
    
    
    /// <#Description#>
    func valueTimer() {

        DispatchQueue.global(qos: .background).async {
            let currentRunLoop = RunLoop.current
            let timeInterval = 0.15
            self.timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
            self.timer.tolerance = timeInterval * 0.1
            currentRunLoop.add(self.timer, forMode: RunLoop.Mode.common)
            currentRunLoop.run()

        }
    }
    
    /// <#Description#>
    @objc func updateTimer() {
        timerCounter += 1
        
        let count = timerCounter
//        self.splashScreenProgressBar.progress = Float(self.timerCounter) / 15
//        proegressBar()
        if (count == 10) {
            
//            self.splashScreenProgressBar.isHidden = true
            self.timer.invalidate()

        }
    }
    
    /// Animate logo parts in the intro splash screen
    /// - Parameters:
    ///   - image: UIImage
    ///   - delay: delayer  time for intro in the view
    func animation(image: UIImageView, delay: Double, withDuration: Double) {
        
        let screenWidth = UIScreen.main.bounds.width

        
        UIView.animate(withDuration: 2.0, delay: delay) {

            image.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth)
            image.frame = CGRect(x: 0, y: 0, width: screenWidth - 400, height: screenWidth - 400)

            image.center = self.view.center
            image.center = self.view.center

        }

        self.shrinkImage(image: image, withDuration: withDuration)
    }
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - image: <#image description#>
    ///   - delay: <#delay description#>
    func animateFadeIn(image: UIImageView, delay: Double) {
        
        UIView.animate(withDuration: 3.0, delay: delay) {
            
            image.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 300, height: 300))
            image.center = self.view.center
            
        }
    }
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - image: <#image description#>
    ///   - delay: <#delay description#>
    func initialImageFadeIn(image: UIImageView, delay: Double) {
        
        UIView.animate(withDuration: 0.0, delay: delay) {
            image.frame = CGRect.zero
            image.center = self.view.center
        }
    }

    
    /// <#Description#>
    /// - Parameters:
    ///   - image: <#image description#>
    ///   - withDuration: <#withDuration description#>
    func shrinkImage(image: UIImageView, withDuration: Double){
        
        //Animate imageview zoom in out with infinity time
        UIView.animate(withDuration: withDuration) {
            image.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 200, height: 200))
            image.center = self.view.center
        } completion: { (done) in
            
            if done {
                self.spreadImage(image: image, withDuration: withDuration)
                
            }
        }
    }
    
    
    /// <#Description#>
    /// - Parameters:
    ///   - image: <#image description#>
    ///   - withDuration: <#withDuration description#>
    func spreadImage(image: UIImageView, withDuration: Double) {
        
        UIView.animate(withDuration: withDuration) {
            image.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 300, height: 200))
            image.center = self.view.center
        } completion: { (done) in
            
            if done {
                
                self.shrinkImage(image: image, withDuration: withDuration)
                
            }
        }
    }
    
    func gotoStorieBoard (){
        
        
        
    }
    
    
    @IBAction func btnContinueToHome(_ sender: Any) {

        performSegue(withIdentifier: "goHomeSB", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        let welcomeVC : ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        if segue.identifier == "goHomeSB" {
            guard let goToViewStoryBoard = segue.destination as? HomeVC else{return}
            goToViewStoryBoard.modalPresentationStyle = .fullScreen
//            goToViewStoryBoard.appNameLbl.text = "SIp....!!!!"
            goToViewStoryBoard.dismiss(animated: true, completion: nil)
            
        }
    }

}

