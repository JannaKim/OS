public class ConsumerThread extends Thread
{
    Stack stack;
    String wd;
    @Override
    public void run()
    {
        stack.pop();
    }

    public void setStack(Stack stack)
    {
        this.stack = stack;
    }
}
