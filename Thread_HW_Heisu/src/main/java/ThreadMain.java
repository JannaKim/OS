
public class ThreadMain
{
    public static void main(String[] args)
    {
        Stack stack = new Stack(1);

        ProducerThread pth = new ProducerThread();
        pth.setStack(stack);
        //System.out.println("hi");
        pth.start();

        try
        {
            pth.join();
        } catch (InterruptedException e)
        {
        }

//        ProducerThread pth2 = new ProducerThread();
//        pth2.setStack(stack);
//        pth2.start();
//        try
//        {
//            pth2.join();
//        } catch (InterruptedException e)
//        {
//        }

//        ConsumerThread cth = new ConsumerThread();
//        cth.setStack(stack);
//        cth.start();


//        ConsumerThread cth2 = new ConsumerThread();
//        cth2.setStack(stack);
//        cth2.start();

//
//        ConsumerThread cth3 = new ConsumerThread();
//        cth3.setStack(stack);
//        cth3.start();


//        try
//        {
//            pth.join();
//            cth.join();
//            cth2.join();
//            cth3.join();
//
//        } catch (InterruptedException e)
//        {
//        }

    }
}

