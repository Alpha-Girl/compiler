#include <stdio.h>
int sort(int n, int *a)
{
    int *p;
    p = a;
    int i, j, min, k;
    for (i = 0; i < n; i++)
    {
        min = p[i];
        k = i;
        for (j = i + 1; j < n; j++)
        {
            if (p[j] < min)
            {
                min = p[j];
                k = j;
            }
        }
        p[k] = p[i];
        p[i] = min;
    }
    return 0;
}
int main()
{
    int a[1025];
    int n;
    scanf("%d", &n);
    for (int i = 0; i < n; i++)
    {
        scanf("%d", &a[i]);
    }
    sort(n, a);
    for (int i = 0; i < n - 1; i++)
        printf("%d ", a[i]);
    printf("%d", a[n - 1]);
    return 0;
}