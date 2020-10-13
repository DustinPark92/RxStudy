import UIKit
import RxSwift



let disposeBag = DisposeBag()

enum MyError : Error {
    case error
}


let rs = ReplaySubject<Int>.create(bufferSize: 3)
//buffer의 크기를 설정, 3개

(1...10).forEach {
    rs.onNext($0)
}

rs.subscribe {
    print("Observer 1 >>", $0)
}
.disposed(by: disposeBag)

//3개의 next event -> buffer의 크기를 3으로 지정
rs.subscribe {
    print("Observer 2 >>", $0)
}
.disposed(by: disposeBag)

//8이 삭제된다
//메모리에 저장되므로, 메모리 사용량에 주의 해야함.
rs.onNext(11)

rs.subscribe {
    print("Observer 3 >>", $0)
}
.disposed(by: disposeBag)

//rs.onCompleted()
rs.onError(MyError.error)

//버퍼에 저장된 이벤트가 전달되고 컴플리트 된다.
rs.subscribe {
    print("Observer 4 >>", $0)
}
.disposed(by: disposeBag)
