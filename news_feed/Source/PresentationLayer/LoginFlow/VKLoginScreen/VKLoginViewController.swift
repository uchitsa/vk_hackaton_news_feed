//
//  VKLoginViewController.swift
//  news_feed
//
//  Created by Дмитрий Рогов on 17.10.2020.
//

import FoundationExtension
import UIKit
import WebKit

public protocol VKLoginVCInput {
    func open(url: URL)
    func showRejectMessage()

    func startActivity()
    func endActivity()
}

public protocol VKLoginVCOutput: AnyObject {
    func vkLoginVC(_ vc: VKLoginVCInput, shouldRedirectTo url: URL) -> Bool
}

public class VKLoginViewController: UIViewController,
    VKLoginVCInput,
    WKNavigationDelegate {
    // MARK: module

    public weak var output: VKLoginVCOutput?

    // MARK: DI

    var dialogService: DialogService

    // MARK: props

    public var viewCasted: VKLoginView {
        // swiftlint:disable:next force_cast
        view as! VKLoginView
    }

    // MARK: Life cycle

    init(dialogService: DialogService) {
        self.dialogService = dialogService

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) { fatalError() }

    override public func loadView() {
        view = VKLoginView(frame: UIScreen.main.bounds)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        viewCasted.webView.navigationDelegate = self
    }

    // MARK: - VKLoginVCInput

    public func open(url: URL) {
        viewCasted.webView.load(URLRequest(url: url))
    }

    public func showRejectMessage() {
        dialogService.showMessage(text: R.string.localizable.interface_somethingWrong())
    }

    public func startActivity() {
        dialogService.hideActivity(from: view)
        dialogService.showActivity(in: view)
    }

    public func endActivity() {
        dialogService.hideActivity(from: view)
    }

    // MARK: - WKNavigationDelegate

    public func webView(_ webView: WKWebView,
                        decidePolicyFor navigationAction: WKNavigationAction,
                        decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard let url = navigationAction.request.url else {
            decisionHandler(.cancel)
            return
        }

        guard let output = output else {
            decisionHandler(.allow)
            return
        }

        if output.vkLoginVC(self, shouldRedirectTo: url) {
            decisionHandler(.allow)

        } else {
            decisionHandler(.cancel)
        }
    }

    public func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        startActivity()
    }

    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        endActivity()
    }

    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        endActivity()
    }

    // MARK: - Private
}
