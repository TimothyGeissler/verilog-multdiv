public class GenWallace {
    public static void main(String[] args) {
        String [] vars = new String[] {"aa", "ab", "ac", "ad", "ae", "af", "ag", "ah", "ai", "aj", "ak", "al", "am", "an", "ao", "ap", "aq", "ar", "as", "at", "au", "av", "aw", "ax", "ay", "az", "ba", "bb", "bc", "bd", "be", "bf"};


        int bits = 8;
        int rowSize = bits - 1;

        // Gen first row
        String lvl1 = "genvar i;\n" +
                "    generate\n" +
                "        for (i = 0; i < " + (rowSize + 1) + "; i = i + 1) begin\n" +
                "            assign s1[i] = a[i] & b[0];\n" +
                "        end\n" +
                "    endgenerate";
        System.out.println(lvl1 + "\n");

        // Gen middle row
        for (int i = 1; i <= rowSize; i++) {
            String v = vars[i];
            System.out.println("//--------------- LVL " + (i + 1) + " --------------------------");
            System.out.print("genvar " + v + ";\ngenerate\n");
            System.out.print("\tfor (" + v + " = 0; " + v + " < " + rowSize + "; " + v + " = " + v + " + 1) begin\n");
            System.out.print("\t\tassign w" + i + "[" + v + "] = a[" + v + "] & b[" + i + "];\n");
            System.out.print("\t\tfull_adder f" + (i + 1) + "(w" + i + "[" + v + "], s" + i + "[" + v + " + 1], c" + i + "[" + v + "], s" + (i + 1) + "[" + v + "], c" + i + "[" + v + " + 1]);\n");
            System.out.print("\tend\n");
            System.out.print("endgenerate\n");
            System.out.println("assign w" + i + "[" + rowSize + "] = a[" + rowSize + "] & b[" + i + "];");
            if (i == 1) { // Special 2nd row B = 0
                System.out.println("full_adder f" + rowSize + "" + (i + 2) + "(w" + i + "[" + rowSize + "], 1'b0, c" + i + "[" + rowSize + "], s" + (i + 1) + "[" + rowSize + "], c" + i + "[" + (rowSize + 1) + "]);\n");
            } else {
                System.out.println("full_adder f" + rowSize + "" + (i + 2) + "(w" + i + "[" + rowSize + "], c" + ( i - 1) + "[" + (rowSize + 1) + "], c" + i + "[" + rowSize + "], s" + (i + 1) + "[" + rowSize + "], c" + i + "[" + (rowSize + 1) + "]);\n");
            }
        }

        // Final level
        // Gen final row
        String end = "genvar m; \n" +
                "    generate\n" +
                "        for (m = 0; m < " + rowSize + "; m = m + 1) begin\n" +
                "            assign w" + (rowSize + 1) + "[m] = a[m] & 1'b0;\n" +
                "            full_adder fend(w" + (rowSize + 1) + "[m], s" + (rowSize + 1) + "[m + 1], c" + (rowSize + 1) + "[m], s" + (rowSize + 2) + "[m], c" + (rowSize + 1) + "[m + 1]);\n" +
                "        end\n" +
                "    endgenerate\n" +
                "\n" +
                "    assign w" + (rowSize + 1) + "[" + rowSize + "] = a[" + rowSize + "] & 1'b0;\n" +
                "    full_adder fend2(w" + (rowSize + 1) + "[" + rowSize + "], c" + rowSize + "[" + (rowSize + 1) + "], c" + (rowSize + 1) + "[" + rowSize + "], s" + (rowSize + 2) + "[" + rowSize + "], Cout);";
        System.out.println(end);

        // Print out output assignments
        //for (int i = 0; i < )
    }
}