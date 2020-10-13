import UIKit
import RxSwift
import RxCocoa

//Relay : 내부에 subject를 래핑하고 있음.
//Next Event만 전달한다.Completed,Error Event 처리 안함.
//주로 UI처리


let bag = DisposeBag()

let prelay = PublishRelay<Int>()
prelay.subscribe {
    print("1:\($0)")
}
.disposed(by: bag)

//relay Onnext (X)
//relay Accept event(O)

prelay.accept(1)


let brelay = BehaviorRelay(value: 1)
brelay.accept(2)

brelay.subscribe {
    print("2:\($0)")
}.disposed(by: bag)


brelay.accept(3)

//읽기 전용임. 바꾸려면 accept Event를 통해 새로운 값을 전달 해야 함.
print(brelay.value)
