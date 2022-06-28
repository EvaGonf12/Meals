
import Combine
import SwiftUI
import NavigationStack

enum MealsResultState {
    case loading
    case success
    case failed(error: Error)
    
    var value: String {
        switch self {
        case .loading:
        return "loading"
        case .success:
        return "success"
        case .failed(let errorValue):
        return errorValue.localizedDescription
        }
    }
}

class MealsListViewModel: ObservableObject, Identifiable {

    var coordinatorDelegate: MealsListCoordinatorDelegate?
    private var disposables: Set<AnyCancellable>
    private let mealsListUseCase: MealsListUseCase
    let navigationStack: NavigationStack
    @Published var state: MealsResultState
    var mealsList: [MealRowViewModel]
    
    init(mealsListUseCase: MealsListUseCase,
         navigationStack: NavigationStack,
         state: MealsResultState = .loading,
         disposables: Set<AnyCancellable> = Set<AnyCancellable>()) {
        
        self.mealsListUseCase = mealsListUseCase
        self.navigationStack = navigationStack
        self.state = state
        self.mealsList = []
        self.disposables = disposables
    }
    
    func didAppear() {
        fetchMealsList()
    }
    
    func fetchMealsList() {
        mealsListUseCase
            .execute()
            .map { response in
                response.map(MealRowViewModel.init)
            }
            .sink { [weak self] completion in
                
                guard let self = self else { return }
                
                switch completion {
                case .failure(let error):
                    self.mealsList = []
                    self.state = .failed(error: error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] mealsList in
                
                guard let self = self else { return }
                
                self.mealsList = mealsList
                self.state = .success
            }
            .store(in: &disposables)
    }
    
    func mealSelected(_ meal: MealRowViewModel) {
        coordinatorDelegate?.mealDetails(meal)
    }
}
