package sjfcode;

public class Process {
    private int pid;
    private int time;
    private int arrivedTime;

    public Process(int pid, int startTime, int time) {
        this.pid = pid;
        this.arrivedTime = startTime;
        this.time = time;
    }

    public Process(Process other) {
        this(other.pid, other.arrivedTime, other.time);
    }

    public int getPid() {
        return pid;
    }

    public int getArrivedTime() {
        return arrivedTime;
    }

    public void amendArrivalTime(int newTime)
    {
        arrivedTime= newTime;
    }

    public int getTime() {
        return time;
    }

    public String toString() {
        return "Pid : " + Integer.toString(pid) + " arrivedTime : " + Integer.toString(arrivedTime) + " time : " + Integer.toString(time);
    }
}
