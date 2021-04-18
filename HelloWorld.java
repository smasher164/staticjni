public class HelloWorld {
    private static native void print();

    public static void main(String[] args) {
        System.loadLibrary("HelloWorld");
	HelloWorld.print();
    }

}
