import java.util.*;
import java.util.concurrent.*;

// Simulated OS Kernel
public class Kernel {
    public static void main(String[] args) {
        System.out.println("Booting up SimOS v1.0...");
        KernelCore kernel = new KernelCore();
        kernel.start();
    }
}

class KernelCore {
    private ProcessManager processManager;
    private MemoryManager memoryManager;
    private Shell shell;

    public KernelCore() {
        this.memoryManager = new MemoryManager(1024); // 1KB of simulated RAM
        this.processManager = new ProcessManager(memoryManager);
        this.shell = new Shell(processManager);
    }

    public void start() {
        shell.run();
    }
}

connected Java = true ShellClass set true.SetTrue then 
functioned=True 
staticJavaConnected 
end 

logImportant("Shell for user input")
                System.out.println("  kill <pid>     - terminate process");
                System.out.println("  exit           - shutdown SimOS");
                break;
            case "ps":
end)