//: Playground - noun: a place where people can play

import UIKit
import Foundation
import Swinject


//
//class Todo{
//    var tempId: UUID?
//    var id : Int
//    var title: String
//    var isCompleted: Bool
//
//    init(id:Int, title:String, isCompleted:Bool) {
//        self.id = id
//        self.title = title
//        self.isCompleted = isCompleted
//        self.tempId = id == -1 ? UUID() : nil
//    }
//}
//protocol CachedData{
//    var todosInCache:[Todo] { get set }
//}
//protocol Repository{
//    func getTodos()->[Todo]
//    func getTodo(id:Int) -> Todo
//    func addTodo(todo: Todo) -> Todo
//    func updateTodo(todo: Todo) -> Todo
//}
//
//class CacheRepository: Repository, CachedData{
//
//    var todosInCache:[Todo] = []
//
//    func getTodos() -> [Todo] {
//        return todosInCache
//    }
//
//    func getTodo(id: Int) -> Todo {
//        return todosInCache.first(where: {$0.id == id})!
//    }
//
//    func addTodo(todo: Todo) -> Todo{
//        todosInCache.append(todo)
//        return todo
//    }
//    func updateTodo(todo: Todo) -> Todo {
//        let todoTobeUpdated = todosInCache.first(where: {$0.tempId ==  todo.tempId})
//        todoTobeUpdated?.id = todo.id
//        todoTobeUpdated?.isCompleted = todo.isCompleted
//        return (todoTobeUpdated)!
//    }
//}
//class CloudRepository: Repository{
//    private var todos:[Todo] = []
//
//    init() {
//        todos.append(Todo(id: 1, title: "doing nothing", isCompleted: false))
//        todos.append(Todo(id: 2, title: "goto hartono mall", isCompleted: false))
//        todos.append(Todo(id: 3, title: "buy a Warkop Reborn 2 ticket", isCompleted: false))
//    }
//
//    func getTodos() -> [Todo] {
//        return todos
//    }
//
//
//
//    func getTodo(id: Int) -> Todo {
//        return todos.first(where: {$0.id == id})!
//    }
//
//    func addTodo(todo: Todo) -> Todo {
//        todo.id = todos.count+1
//        todos.append(todo)
//        return todo
//    }
//
//    func updateTodo(todo: Todo) -> Todo {
//        print("update todo in the cloud")
//        let todoTobeUpdated = todos.first(where: {$0.tempId ==  todo.tempId})
//        todoTobeUpdated?.id = todo.id
//        todoTobeUpdated?.isCompleted = todo.isCompleted
//        return (todoTobeUpdated)!
//
//    }
//}
////RepositoriesFactory
//class DataManager{
//    var cacheRepository: Repository&CachedData
//    let cloudRepository: Repository
//    init() {
//        self.cacheRepository = CacheRepository()
//        self.cloudRepository = CloudRepository()
//    }
//    func refreshTodos()->[Todo]{
//
//        cacheRepository.todosInCache.removeAll()
//        cacheRepository.todosInCache = cloudRepository.getTodos()
//        return cacheRepository.todosInCache
//    }
//    func getTodos()->[Todo]{
//
//        if cacheRepository.todosInCache.isEmpty{
//            print("requesting to cloud")
//            cacheRepository.todosInCache = cloudRepository.getTodos()
//        }
//
//        print("todos is come from cache")
//        return cacheRepository.todosInCache
//    }
//
//    func addTodo(todoCandidate:Todo){
//        cacheRepository.addTodo(todo: todoCandidate)
//        cloudRepository.addTodo(todo: todoCandidate)
//    }
//
//    func getTodo(id:Int) -> Todo {
//        let item = cacheRepository.getTodo(id: id)
//        return item
//    }
//
//    func updateTodo(todo:Todo){
//        cacheRepository.updateTodo(todo: todo)
//        cloudRepository.updateTodo(todo: todo)
//    }
//}
//
//let dataManager =  DataManager()
//
////first,  it is should be request to server
//dataManager.getTodos()
//
////second, it is just return from cache
//dataManager.getTodos()
//
////third, let me add a new todo
//dataManager.addTodo(todoCandidate: Todo(id: -1, title: "makan", isCompleted: false))
//dataManager.getTodos()
//
//
//let selected = dataManager.getTodo(id: 2)
//selected.title
////forth, let me make simple data manipulation
//selected.isCompleted = true
//dataManager.updateTodo(todo: selected)
//dataManager.getTodos()


//struct Person { // Model
//    let firstName: String
//    let lastName: String
//}
//
//protocol GreetingView: class { // view
//    func setGreeting(_ greeting: String)
//}
//
//protocol GreetingViewPresenter {
//    init(view: GreetingView, person: Person)
//    func showGreeting()
//}
//
//class GreetingPresenter : GreetingViewPresenter { // presenter
//    unowned let view: GreetingView
//    let person: Person
//    required init(view: GreetingView, person: Person) {
//        self.view = view
//        self.person = person
//    }
//    func showGreeting() {
//        let greeting = "Hello" + " " + self.person.firstName + " " + self.person.lastName
//        self.view.setGreeting(greeting)
//    }
//}
//
//class GreetingViewController : UIViewController, GreetingView { // view controller
//    var presenter: GreetingViewPresenter!
//    let showGreetingButton = UIButton()
//    let greetingLabel = UILabel()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.showGreetingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
//    }
//
//    @objc func didTapButton(button: UIButton) {
//        self.presenter.showGreeting()
//    }
//
//    func setGreeting(_ greeting: String) {
//        self.greetingLabel.text = greeting
    }

    // layout code goes here
}
// Assembling of MVP
let model = Person(firstName: "David", lastName: "Blaine")
let view = GreetingViewController()
let presenter = GreetingPresenter(view: view, person: model)
view.presenter = presenter
