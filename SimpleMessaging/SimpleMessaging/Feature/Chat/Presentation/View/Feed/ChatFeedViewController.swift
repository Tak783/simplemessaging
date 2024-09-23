//
//  ChatFeedViewController.swift
//  SimpleMessaging
//
//  Created on 23/09/2024.
//

import UIKit

final class ChatFeedViewController: UIViewController, Storyboarded {
    var chatFeedViewModel: ChatFeedViewModel!
    @IBOutlet private var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        chatFeedViewModel.reloadFeed()
    }
}

// MARK: - SetUp View
extension ChatFeedViewController {
    private func setUpView() {
        title = chatFeedViewModel.title
        
        bindViewModel()
        setupTableView()
    }
    
    private func bindViewModel() {
        chatFeedViewModel.onFeedStateChange = { [weak self] state in
            guard let self else { return }
            DispatchQueue.main.async {
                switch state {
                case .loading:
                    // TODO: Show spinner
                    break
                case .error:
                    //TODO: Show alert
                    break
                case .loaded:
                    self.tableView.reloadData()
                }
            }
        }
    }
}

// MARK: - Set Up Table View
extension ChatFeedViewController {
    private func setupTableView() {
        registerCellsForTable()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registerCellsForTable() {
        tableView.register(
            ChatFeedTableViewCell.self,
            forCellReuseIdentifier: ChatFeedTableViewCell.reuseIdentifier
        )
    }
}

// MARK: - UITableViewDataSource
extension ChatFeedViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView, 
        numberOfRowsInSection section: Int
    ) -> Int {
        chatFeedViewModel.chatPresentationModels.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ChatFeedTableViewCell.reuseIdentifier
        ) as? ChatFeedTableViewCell
        
        guard let cell  else {
            return .init()
        }
        let presentationModel = chatFeedViewModel.chatPresentationModels[indexPath.row]
        cell.update(withPresentationModel: presentationModel)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ChatFeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
