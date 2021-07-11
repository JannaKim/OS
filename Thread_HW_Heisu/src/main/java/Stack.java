public class Stack
{
    private String[] stack;
    private int top;
    private int size;

    public Stack(int size)
    {
        this.size = size;
        stack = new String[size];
        this.top = -1;
    }

    synchronized public void push(String str)
    {
        if (isFull())
        {
            System.out.println("extended from " + size);
            this.size = this.size * 2;
            String[] stack2 = new String[size];

            for (int i  = 0; i < stack.length; i++)
            {
                stack2[i] = this.stack[i];
                //return;
            }
            this.stack = stack2;
        }
        this.stack[++this.top] = str;

    }

    synchronized public void pop()
    {
        if (isEmpty())
        {
            System.out.println("스택이 비어있습니다");
            return;
        }
        String str = stack[this.top];
        stack[this.top--] = null;
        System.out.println(str);
    }

//    synchronized public String peek()
//    {
//
//    }

    public boolean isFull()
    {
//        System.out.printf("%d %d \n", top, this.stack.length);
        return this.top == this.stack.length - 1;

    }


    public boolean isEmpty()
    {
        return  this.top == -1;
    }

    public int isSize()
    {
        return this.stack.length;
    }

    public void printStack()
    {
        int ln = isSize();
        //System.out.println(ln);
        for(int i = 0; i < this.top + 1; i++)
        {
            System.out.printf("%s%n",this.stack[i]);
        }
        System.out.println("\n");

    }

/*
    public static void main(String[] args)
    {
        Stack stack = new Stack(1);
        stack.push("아아아아");
        stack.push("아아아아");
        stack.push("아아아아");
        stack.push("아아아아");
        stack.push("아아아아");
        stack.push("아아아아");

        stack.pop();
        stack.pop();

    }

 */


}
