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
    contains(val){
        var monkey = this.head
        while(monkey){
            if(monkey.value == val){
                return true
        }
        monkey = monkey.next
        }
        return false
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
console.log(first_sll.contains(8))