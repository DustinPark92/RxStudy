import UIKit
import RxSwift

//Observable : 이벤트를 전달
//Observer : Observable을 구독함
//Subject : Observer이며 동시에 , Observable


/*
 PublishSubject
 BehaviorSubject
 ReplaySubject
 AsyncSubject
 
 
 Subject를 래핑함
 PublishRelay
 BehaviorRelay

 */


//PublishSubject

let disposeBag = DisposeBag()

enum MyError : Error {
    case error
}

let subject = PublishSubject<String>()

subject.onNext("Hello")

let o1 = subject.subscribe {
    print(">> 1" , $0)
}
.disposed(by: disposeBag)

subject.onNext("Rxswift")

let o2 = subject.subscribe {
    print(">> 2", $0)
}
o2.disposed(by: disposeBag)

subject.onNext("Subject")

subject.onCompleted()
//subject.onError(MyError.error)
let o3 = subject.subscribe {
    print(">> 3", $0)
}
//위에서 completed가 되었음. 새로운 구독자에게 전달한 넥스트 이벤트가 없기때문에 바로 종료함.

o3.disposed(by: disposeBag)

subject.onNext("세번째")

//중간의 이벤트가 사라짐 -> PublishSubject



