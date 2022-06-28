// Generated using Sourcery 1.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
import Combine
@testable import Meals
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
import SwiftUI
#elseif os(OSX)
import AppKit
#endif














class MealsListUseCaseMock: NSObject, MealsListUseCase {

    //MARK: - execute

    private(set) var executeCallsCount = 0
    var executeCalled: Bool {
        return executeCallsCount > 0
    }
    var executeReturnValue: AnyPublisher<[Meal], APIError>!
    var executeClosure: (() -> AnyPublisher<[Meal], APIError>)?

    func execute() -> AnyPublisher<[Meal], APIError> {
        executeCallsCount += 1
        return executeClosure.map({ $0() }) ?? executeReturnValue
    }

}
