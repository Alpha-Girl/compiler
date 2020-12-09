double f2(float b);
float f1(int a)
{
    return f2(a);
}

double f2(float b)
{
    long k;
    return f1(k);
}