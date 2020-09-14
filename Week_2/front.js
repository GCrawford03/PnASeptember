class Node{
    constructor(value){
        this.value = value;
        this.next = null;
    }
}

class SLL {
     constructor() {
        this.head = new Node(value);
    }
     addFront(value) {
     var restOfList = this.head;
     this.head = new Node(value);
     this.head.next = restOfList;
     return this
    }

    removeFront(){
        this.head = this.head.next;
        return this;
    }

    front(){if(TouchList.head !== null){
        return this.head.value
    } else {
        return "this is an empty list"
    }
    }

 }

 var first_sll = new SLL(2);
 console.log(first_sll.addFront(4).addFront(6).addFront(8));
 console.log(first_sll.front())