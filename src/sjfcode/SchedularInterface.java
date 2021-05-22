package sjfcode;

import java.util.*;
public interface SchedulerInterface {
    public boolean setProcess(ArrayList<Process> prs);
    public Process nextProcess(int currentTime);
    public int execute(int pid);
    public boolean isEmpty();
}
