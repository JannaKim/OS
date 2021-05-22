package sjfcode;

import sjfcode.Process;
import sjfcode.SchedulerInterface;

import java.util.*;
import sjfcode.SchedulerInterface;
public class SJF implements SchedulerInterface {
    PriorityQueue<Process> pq = new PriorityQueue<>(); // 안에 인자 ?
    ArrayList<Process> ProcessArray = new ArrayList<Process>();
    public boolean setProcess(ArrayList<Process> prs){
        ProcessArray=prs;
        for (int i=0; i<prs.size(); ++i)
            pq.add(prs.get(i));
        return True;
    }
    public Process nextProcess(int currentTime){
        Process tmp= pq.poll();
        int pTime= tmp.getArrivedTime();
        while (pTime<currentTime){
            tmp.amendArrivalTime(currentTime);
            pq.add(tmp);

            tmp= pq.poll();
            tmp.getArrivedTime();
        }
        if (pTime>currentTime)
            return new Process(-1,0,0);
        return tmp;
    }
    public int execute(int pid) {
        return ProcessArray.get(pid - 1).getArrivedTime();
    }
    public boolean isEmpty(){
        if (pq.size==0){
            return True;
        }
        return False;
    }

}
