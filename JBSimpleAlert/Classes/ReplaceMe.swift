import UIKit

@available(iOS 13.0, *)
open class JBSimpleAlert: UIView {
    private var contentView: UIView!
    private var titleLabel: UILabel!
    private var lineView: UIView!
    private var confirmButton: UIButton!
    
    private var titleText: String?
    private var confirmText: String?
    private var completion: (() -> Void)?
    
    public convenience init(title: String, confirm: String, completion: (() -> Void)?) {
        self.init(frame: .zero)
        
        self.titleText = title
        self.confirmText = confirm
        self.completion = completion
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView = UIView()
        titleLabel = UILabel()
        lineView = UIView()
        confirmButton = UIButton(type: .custom)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setAttribute() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        contentView.layer.cornerRadius = 14.0
        contentView.backgroundColor = .white
        
        lineView.backgroundColor = .lightGray
        
        titleLabel.text = titleText ?? "Title"
        
        confirmButton.setTitle(confirmText ?? "confirm", for: .normal)
        confirmButton.setTitleColor(.blue, for: .normal)
        confirmButton.addTarget(self, action: #selector(confirmAction), for: .touchUpInside)
    }
    
    open func show(in superView: UIView) {
        setAttribute()
        
        superView.addSubview(self)
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superView.topAnchor),
            self.bottomAnchor.constraint(equalTo: superView.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor)
        ])
        
        self.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 150.0),
            contentView.widthAnchor.constraint(equalToConstant: 270.0)
        ])
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50.0)
        ])
        
        contentView.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 0.5)
        ])
        
        contentView.addSubview(confirmButton)
        NSLayoutConstraint.activate([
            confirmButton.topAnchor.constraint(equalTo: lineView.bottomAnchor),
            confirmButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            confirmButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            confirmButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            confirmButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
    }
    
    @objc
    private func confirmAction() {
        self.removeFromSuperview()
        completion?()
    }
}
