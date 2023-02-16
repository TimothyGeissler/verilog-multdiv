public class GenWires {
    public static void main(String[] args) {
        int bits = 8;
        for (int i = 0; i <= bits; i++) {
            System.out.print("wire [" + bits + ":0] c" + i + ";\n");
        }
        for (int i = 0; i <= bits; i++) {
            System.out.print("assign c" + i + "[0] = 1'b0;\n");
        }

        for (int i = 0; i <= bits + 1; i++) {
            System.out.print("wire [" + bits + ":0] s" + i + ";\n");
        }
        for (int i = 0; i <= bits; i++) {
            System.out.print("wire [" + (bits - 1) + ":0] w" + i + ";\n");
        }
        int count = 0;
        for (int p = 0; p <= (bits*2) - 1; p++) {
            if (p < bits) {
                System.out.print("assign p[" + p + "] = s" + (p + 1) + "[0];\n");
            } else {
                System.out.print("assign p[" + p + "] = s" + (bits + 1) + "[" + count + "];\n");
                count++;
            }
        }
    }
}
