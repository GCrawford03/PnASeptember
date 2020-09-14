class Node {
    constructor(value) {
        this.value = value;
        this.next = null
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

    length(){
        var runner = this.head;
        var numNodes = 0;
        while(runner) {
            nodes++;
            runer = runner.next;
        }
        return numNodes;
    }

    display_list(){
        var monkey = this.head
        var count = 1;
        while(monkey){
            console.log(`Current Node: ${monkey}, Current Value: ${monkey.value}, Count: ${count}`)
            monkey = monkey.next;
            count +=1;
        }
        return "** test concluded **"
    }
}

var first_sll = new SLL(2);
console.log(first_sll.addFront(4).addFront(6).addFront(8));
console.log(first_sll.length())