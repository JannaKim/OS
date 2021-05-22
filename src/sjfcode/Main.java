package sjfcode;
import java.util.*;
import java.lang.*;

public class Main {

    public static void main(String[] args) {
        //인터페이스는 변수 선언시 타입으로 선언한다.
        Test.setSched(Test.sched);
        Test.solve();
    }
}

class Process implements Comparable<Process> { // shift+ f6
    private int arrivedTime;
    private int executeTime;
    private int amendedArrivalTime;
    private int Pid;
    public Process(int y, int x, int z) {
        this.arrivedTime = y;
        this.amendedArrivalTime=y;
        this.executeTime = x;
        this.Pid = z;
    }
    public int getPid() {
        return Pid;
    }

    public int getArrivedTime() {
        return amendedArrivalTime;
    }

    public int submissionOfRequest() {
        return arrivedTime;
    }
    public void amendArrivalTime(int newTime)
    {
        amendedArrivalTime= newTime;
    }

    public int getTime() {
        return executeTime;
    }
    public String toString() {// 객체의 정보를 리턴하는 역할
        return "Pid : " + Integer.toString(Pid) + ",  submissionOfRequest : " + Integer.toString(arrivedTime) + ",  amendedArrivalTime : " + Integer.toString(amendedArrivalTime)+ ",  execute time : " + Integer.toString(executeTime);
    }
    @Override
    public int compareTo(Process o) {
        return this.amendedArrivalTime - o.amendedArrivalTime;
    }

}
interface SchedulerInterface {
    boolean setProcess(ArrayList<Process> prs);
    Process nextProcess(int currentTime);
    int execute(int pid);
    boolean isEmpty();
    }

class SJF implements SchedulerInterface {
    PriorityQueue<Process> pq = new PriorityQueue<>();
    ArrayList<Process> ProcessArray = new ArrayList<>();
    public boolean setProcess(ArrayList<Process> prs){
        ProcessArray=prs;
        for (int i=0; i<prs.size(); ++i)
            pq.add(new Process(prs.get(i).getArrivedTime(),prs.get(i).getTime(), prs.get(i).getPid()));
        return true;
    }
    public Process nextProcess(int currentTime){
        Process tmp= pq.poll();
        boolean flag= true;
        while (tmp.getArrivedTime()<currentTime){
            if (flag==true) {
                System.out.println("* more than one process is ready; deciding which to execute in prior if there are many");
                flag=false;
            }
            System.out.println(tmp);
            tmp.amendArrivalTime(currentTime);
            pq.add(tmp);
            tmp= pq.poll();
        }
        if (tmp.getArrivedTime()>currentTime) {
            pq.add(tmp);
            return new Process(0, 0, -1);
        }
        return tmp;
    }
    public int execute(int pid) {
        return ProcessArray.get(pid - 1).getTime();
    }
    public boolean isEmpty(){
        if (pq.isEmpty())
            return true;
        return false;
    }
}

class Test {
    static SchedulerInterface sched= new SJF();
    private static int N = 1;
    static void setSched(SchedulerInterface yours) {
        sched = yours;
    }

    static void solve() {

        int time = 0;
        ArrayList<Process> procs = new ArrayList<>();
        for(int i = 0; i < 10; i++) {
            procs.add(new Process((int)(Math.random() * 20) ,(int)(Math.random() * 50 + 1),N++));
        }
        //System.out.println(procs);
        sched.setProcess(procs);
        while(!sched.isEmpty()) {
            Process currentProcess = sched.nextProcess(time);
            if(currentProcess.getPid() == -1) {
                System.out.println("=======================================");
                System.out.println("** Current time is " + time + " : readyQ is clean.");
                System.out.println("=======================================");
                System.out.println();
                time++;
                continue;
            }
            System.out.println("=======================================");
            System.out.println("Current time is " + time + " : ");
            int executeTime = sched.execute(currentProcess.getPid());
            int turnaroundtime= time-currentProcess.submissionOfRequest()+executeTime;
            int responsetime= time-currentProcess.submissionOfRequest();
            time += executeTime;
            System.out.println("Process n."+currentProcess.getPid()+" is running until "+time);
            System.out.println("- turnaround time: " + turnaroundtime + " ("+currentProcess.submissionOfRequest()+"~"+time+")");
            System.out.println("-   response time: " + responsetime + " ("+currentProcess.submissionOfRequest()+"~"+(time-executeTime)+")");
            System.out.println("=======================================");
            System.out.println();
        }
    }
}


