import UIKit



class ViewController: UIViewController {

    
   @IBOutlet var uiKitView: UIView!

        let squareView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.layer.cornerRadius = 20
            view.clipsToBounds = true
            return view
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.addSubview(squareView)
            
            NSLayoutConstraint.activate([
                squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                squareView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
                squareView.widthAnchor.constraint(equalToConstant: 100),
                squareView.heightAnchor.constraint(equalToConstant: 100)
            ])
            
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = squareView.bounds
            gradientLayer.colors = [UIColor.cyan.cgColor, UIColor.purple.cgColor]
            squareView.layer.addSublayer(gradientLayer)
            
            squareView.layer.shadowColor = UIColor.black.cgColor
            squareView.layer.shadowOffset = CGSize(width: 0, height: 5)
            squareView.layer.shadowOpacity = 0.5
            squareView.layer.shadowRadius = 5
        }
        
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            let gradientLayer = squareView.layer.sublayers?.first(where: { $0 is CAGradientLayer }) as? CAGradientLayer
            gradientLayer?.frame = squareView.bounds
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            let widthConstraint = NSLayoutConstraint(item: squareView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
            let heightConstraint = NSLayoutConstraint(item: squareView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
            squareView.addConstraints([widthConstraint, heightConstraint])
        }
    }
