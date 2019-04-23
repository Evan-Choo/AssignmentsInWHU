public class Calc {
    public int add(int a, int b){
        return a + b;
    }

    //sub-1: first failing test
//    static public int sub(int a, int b){
//        return 0;
//    }

    //sub-2: make first test pass
    //sub-3: triangulate with another value-failed
//    static public int sub(int a,  int b){
//        return 2;
//    }

    //sub-3; triangulate with another value-passed
    public int sub(int a, int b){
        return a - b;
    }

    //mul-1: first failing test
//    static public mul sub(int a, int b){
//        return 0;
//    }

    //mul-2: make first test pass
    //mul-3: triangulate with another value-failed
//    static public int mul(int a,  int b){
//        return 8;
//    }

    //mul-3; triangulate with another value-passed
    public int mul(int a, int b){
        return a * b;
    }

    //div-1: first failing test
//    static public int div(int a, int b){
//        return 0;
//    }

    //div-2: make first test pass
    //div-3: triangulate with another value-failed
//    static public int div(int a, int b){
//        return 2;
//    }

    //div-3: triangulate with another value-passed
    //div-4: triangulate with another type-failed
//    static public int div(int a, int b){
//        return a / b;
//    }

    //div-4: triangulate with another type-passed
    //div-5: triangulate with exception-failed
//    static public double div(int a, int b){
//        return (double)a / b;
//    }

    //div-5: triangulate with exception-passed
    public double div(int a, int b) throws Exception{
        if(b == 0)
            throw new Exception("divided by 0");

        return (double)a / b;
    }
}
