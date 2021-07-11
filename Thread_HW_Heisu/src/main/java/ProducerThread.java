import java.io.*;

public class ProducerThread extends Thread
{
    Stack stack;

    private Thread t;

    public ProducerThread(){
        this.t = new Thread(this);
    }
    @Override
    public void run()
    {
        String a = "";
        try{
            BufferedReader bf = new BufferedReader(new InputStreamReader(new FileInputStream("/Users/janna/Documents/GitHub/OS/Hashing/input")));
            String word = "";
            while ((word = bf.readLine()) != null)
            {
                //System.out.println(" "+word);
                a = word;
                /*
                try
                {
                    Thread.sleep((int) (Math.random() * 1000));
                } catch (Exception e){
                }
                */

                stack.push(a);
                stack.printStack();

            }

            bf.close();
        }catch (Exception e)
        {
            System.out.println("wat");
        }
    }

    public void setStack(Stack stack)
    {
        this.stack = stack;
    }
    //동일한 스택을 공유하기 위해 필요하다.
}
