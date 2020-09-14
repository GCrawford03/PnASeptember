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

    back(){
        var monkey = this.head
        while(monkey.next){
            monkey = monkey.next
        }
        return monkey.value
    }

    removeBack(){
        var monkey = this.head;
        while(monkey.next.next){
            monkey = monkey.next;
        }
        monkey.next = null;
        return this
    }

    addBack(value){
        var monkey = this.head
        while(monkey.next){
            monkey = monkey.next
        }
        monkey.next = new Node(value);
        return this

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
console.log(first_sll.back())
console.log(first_sll.removeBack())
console.log(first_sll.addBack())