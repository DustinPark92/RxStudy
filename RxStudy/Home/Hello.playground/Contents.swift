import UIKit
import RxSwift

let disposable = DisposeBag()

//Observable.just("Hello , RxSwift")
//    .subscribe {print($0)}
//    .disposed(by: disposable)


//var a = 1
//var b = 1
//
//a + b


let a = BehaviorSubject(value: 1)
let b = BehaviorSubject(value: 2)

Observable.combineLatest(a, b) { $0 + $1 }
    .subscribe(onNext : {print($0)})
    .disposed(by: disposable)

a.onNext(12)
b.onNext(100)
