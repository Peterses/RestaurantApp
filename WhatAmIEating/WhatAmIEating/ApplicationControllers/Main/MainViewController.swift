
import UIKit
import JGProgressHUD

// MARK: - PhotoSource
enum PhotoSource {
    case camera
    case photoLibrary
}

// MARK: - MainViewController
class MainViewController: UIViewController {
    
    var coordinator: HomeCoordinator?
    private var mainView = MainView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    private func setImagePickerController(source: PhotoSource) {
        let vc = UIImagePickerController()
        switch source {
        case .camera:
            vc.sourceType = .camera
        case .photoLibrary:
            vc.sourceType = .photoLibrary
        }
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    private func analyzeImage() {
        let image = mainView.imageView.image
        let analyzedText = ImageAnalyzer().recognizeText(image: image)
        
        let symbols = ImageAnalyzer().findESymbolsRegex(text: analyzedText)
        var additives: [Additive] = []
        
        for symbol in symbols {
            DbManager.shared.fetchSingleAdditive(id: symbol) { additive in
                guard let additive = additive else {
                    return
                }
                additives.append(additive)
            }
        }

        let vc = AfterAnalyzeVC(additives: additives)
        vc.title = "Składniki E"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.mainView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - MainViewDelegate
extension MainViewController: MainViewDelegate {
    
    func didTakePhotoButtonClicked() {
        setImagePickerController(source: .camera)
    }
    
    func didChooseButtonClicked() {
        setImagePickerController(source: .photoLibrary)
    }
    
    func didAnalyzeButtonClicked() {
        analyzeImage()
    }
}

// MARK: - UIImagePickerControllerDelegate
extension MainViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            mainView.setImage(image: image)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UINavigationControllerDelegate
extension MainViewController: UINavigationControllerDelegate {
    
}
