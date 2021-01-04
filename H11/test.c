int f(int g())
{
    return g(g);
}
main()
{
    f(f);
}