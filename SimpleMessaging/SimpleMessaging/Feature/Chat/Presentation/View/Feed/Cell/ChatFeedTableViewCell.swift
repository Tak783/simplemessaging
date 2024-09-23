//
//  ChatFeedTableViewCell.swift
//  SimpleMessaging
//
//  Created by  on 23/09/2024.
//

import UIKit
import CoreFoundational

final class ChatFeedTableViewCell: UITableViewCell {
    static let reuseIdentifier = String(describing: ChatFeedTableViewCell.self)
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.accessibilityIdentifier = "title_label"
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.accessibilityIdentifier = "detail_label"
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ChatFeedCellViewable
extension ChatFeedTableViewCell: ChatFeedCellViewable {
    func update(withPresentationModel chatPresentationModel: any ChatPresentationModelling) {
        titleLabel.text = chatPresentationModel.name
        detailLabel.text = "Last updated: \(chatPresentationModel.lastUpdated)"
    }
}

// MARK: - Set Up View
extension ChatFeedTableViewCell {
    private func setUpView() {
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
