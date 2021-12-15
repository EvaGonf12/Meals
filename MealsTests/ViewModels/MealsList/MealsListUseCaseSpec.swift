//
//  MealsListUseCaseSpec.swift
//  MealsTests
//
//  Created by Eva Gonzalez Ferreira on 15/12/21.
//

import XCTest
import Combine
import SwiftUI
import NavigationStack
@testable import Meals

final class MealsListUseCaseSpec: XCTestCase {
    
    private var sut: MealsListViewModel!
    private var useCase: MealsListUseCaseMock!
    
    override func setUp() {
        super.setUp()
        useCase = MealsListUseCaseMock()
        sut = MealsListViewModel(mealsListUseCase: useCase,
                                 navigationStack: NavigationStack())
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_success_meals_list() {
        givenPilotsList()
        whenMealsList()
        thenMealsListDidLoad()
    }
    
    func test_fail_meals_list() {
        givenMealsListError()
        whenMealsList()
        thenNotMealsListDidLoad()
    }
}

// MARK: - Given

extension MealsListUseCaseSpec {

    func givenPilotsList() {
        useCase.willReturnMealsList()
    }
    
    func givenMealsListError() {
        useCase.willReturnError()
    }
}

// MARK: - When
extension MealsListUseCaseSpec {
    
    func whenMealsList() {
        sut.didAppear()
    }
}

// MARK: - Then
extension MealsListUseCaseSpec {
    
    func thenMealsListDidLoad() {
        XCTAssertTrue(useCase.executeCalled, "Should execute use case")
        XCTAssertTrue(sut.state.value == MealsResultState.success.value, "Should change state to success")
        XCTAssertTrue(sut.mealsList.count == 2, "Should get list videos")
    }
    
    func thenNotMealsListDidLoad() {
        XCTAssertTrue(useCase.executeCalled, "Should execute use case")
        XCTAssertTrue(sut.state.value == MealsResultState.failed(error: APIError.decodingError).value, "Should change state to fail")
        XCTAssertTrue(sut.mealsList.count == 0, "Should get list videos")
    }
}

// MARK: - AutoMockable extension
extension MealsListUseCaseMock {

    func willReturnMealsList() {
        executeReturnValue = Just([Meal.mock,Meal.mock2])
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
    }
    
    func willReturnError() {
        executeReturnValue = Fail(error: APIError.decodingError)
            .eraseToAnyPublisher()
    }
    
}
