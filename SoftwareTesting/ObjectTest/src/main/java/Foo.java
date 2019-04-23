public class Foo{
    public int a;
    public String b;

    public Foo(int a, String b) {
        this.a = a;
        this.b = b;
    }

    @Override
    public String toString() {
        return this.a + this.b;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if(o instanceof Foo) {
            Foo f = (Foo)o;
            return f.a == this.a;
        }
        return false;
    }
}
