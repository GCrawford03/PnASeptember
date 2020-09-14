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

    max(){
        var max = this.head.value
        var monkey = this.head.next
        while(monkey){
            if(max<monkey.value){
                max = monkey.value
            }
            monkey = monkey.next
        }
        return max
    }

    min(){
        var min = this.head.value
        var monkey = this.head.next
        while(monkey){
            if(min>monkey.value){
                min = monkey.value
            }
            monkey = monkey.next
        }
        return min
    }

    average(){
        var sum = 0;
        var monkey = this.head;
        while(monkey){
            sum += monkey.value
            monkey = monkey.next
        }
        return sum/this.length()
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
console.log(first_sll.max())
console.log(first_sll.min())
console.log(first_sll.average())