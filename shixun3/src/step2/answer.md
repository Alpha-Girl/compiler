1. weak_ptr可以直接通过普通指针引用对象吗？ 
    不能。weak_ptr 必须通过 shared_ptr 来引用对象，不能直接通过普通指针来构造，否则会报错。
2.在程序中，如果管理weak_ptr的shared_ptr释放了，那么还可以通过weak_ptr去访问对象吗？
    当所有指向被引用对象的 shared_ptr 都被释放时，被引用的对象会被删除，所以 weak_ptr 无法再使用此对象。