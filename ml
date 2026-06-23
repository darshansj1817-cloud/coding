MAX MIN
package maxmin;

import java.util.*;

public class Max_min {

    static Scanner sc = new Scanner(System.in);

    static int max = Integer.MIN_VALUE;
    static int min = Integer.MAX_VALUE;

    static int a[];
    static int size;

    static void MaxMin(int i, int j) {

        int min1, max1, mid;

        if (i == j) {
            max = min = a[i];
        }

        else if (i == j - 1)

            if (a[i] < a[j]) {
                max = a[j];
                min = a[i];
            }

            else {
                max = a[i];
                min = a[j];
            }

        else {

            mid = (i + j) / 2;

            MaxMin(i, mid);

            max1 = max;
            min1 = min;

            MaxMin(mid + 1, j);

            if (max < max1)
                max = max1;

            if (min > min1)
                min = min1;
        }
    }

    public static void inputArray() {

        System.out.println("Enter array elements");

        for (int i = 0; i < size; i++)
            a[i] = sc.nextInt();
    }

    public static void main(String[] args) {

        System.out.println("Enter size of array");

        size = sc.nextInt();

        a = new int[size];

        inputArray();

        long start = System.nanoTime();

        MaxMin(0, size - 1);

        long end = System.nanoTime();

        System.out.println("Max value: " + max + " Min value: " + min);

        System.out.println("Time: " + (end - start) + " ns");
    }
}

KNAPSACK
import java.util.Scanner;

class GreedyKnapsack {

    private int n;
    private int m;

    private int[] w;
    private int[] p;

    public GreedyKnapsack(int n, int m, int[] w, int[] p) {

        this.n = n;
        this.m = m;
        this.w = w;
        this.p = p;
    }

    public void greedy() {

        float sum = 0, max;
        int i, j = 0;

        while (m >= 0) {

            max = 0;

            for (i = 0; i < n; i++) {

                if (((float) p[i]) / ((float) w[i]) > max) {

                    max = ((float) p[i]) / ((float) w[i];
                    j = i;
                }
            }

            if (w[j] > m) {

                System.out.println("Quantity of item number: "
                        + (j + 1) + " added is "
                        + (float) m / w[j]);

                sum = sum + m * max;
                m = -1;
            }

            else {

                System.out.println("Quantity of item number: "
                        + (j + 1) + " added fully ");

                m = m - w[j];

                sum = sum + (float) p[j];

                p[j] = 0;
            }
        }

        System.out.println("The total profit is : " + sum);
    }
}

public class knapsack {

    public static void main(String[] args) {

        int i, max_qty, m, n;

        Scanner sc = new Scanner(System.in);

        int w[] = new int[10];
        int p[] = new int[10];

        System.out.println("Enter no of items : ");
        n = sc.nextInt();

        System.out.println("Enter the weights of each items : ");

        for (i = 0; i < n; i++)
            w[i] = sc.nextInt();

        System.out.println("Enter the profit of each items : ");

        for (i = 0; i < n; i++)
            p[i] = sc.nextInt();

        System.out.println("Enter the knapsack capacity : ");

        max_qty = sc.nextInt();

        m = max_qty;

        GreedyKnapsack gks = new GreedyKnapsack(n, m, w, p);

        gks.greedy();

        sc.close();
    }
}
JOB SEQUENCE
package greedy;

import java.util.*;

class Job {

    int id;
    int deadline;
    int profit;

    public Job(int id, int deadline, int profit) {

        this.id = id;
        this.deadline = deadline;
        this.profit = profit;
    }
}

public class Jobsequence {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.println("Enter the number of jobs:");

        int n = sc.nextInt();

        Job[] jobs = new Job[n];

        for (int i = 0; i < n; i++) {

            System.out.println("Enter id, deadline and profit for job "
                    + (i + 1) + " :");

            int id = sc.nextInt();
            int deadline = sc.nextInt();
            int profit = sc.nextInt();

            jobs[i] = new Job(id, deadline, profit);
        }

        System.out.println("Max profit sequence of jobs: ");

        int maxprofit = jobSequencing(jobs, n);

        System.out.println("Maximum profit: " + maxprofit);
    }

    public static int jobSequencing(Job[] jobs, int n) {

        Arrays.sort(jobs, (a, b) -> b.profit - a.profit);

        boolean[] result = new boolean[n];
        int jobSequence[] = new int[n];

        Arrays.fill(result, false);
        Arrays.fill(jobSequence, -1);

        int maxProfit = 0;

        for (int i = 0; i < n; i++) {

            for (int j = Math.min(n, jobs[i].deadline) - 1;
                 j >= 0;
                 j--) {

                if (result[j] == false) {

                    result[j] = true;
                    jobSequence[j] = i;

                    maxProfit += jobs[i].profit;

                    break;
                }
            }
        }

        for (int i = 0; i < n; i++) {

            if (jobSequence[i] != -1) {

                System.out.print(
                        jobs[jobSequence[i]].id + " ");
            }
        }

        System.out.println();

        return maxProfit;
    }
}
PRIMS
import java.util.*;

public class prims {

    public static void main(String[] args) {

        int cost[][] = new int[10][10];
        int i, j, mincost = 0;

        Scanner in = new Scanner(System.in);

        System.out.println("********* PRIMS ALGORITHM *********");

        System.out.println("Enter the number of nodes");

        int n = in.nextInt();

        System.out.println("Enter the cost matrix");

        for (i = 1; i <= n; i++) {

            for (j = 1; j <= n; j++) {

                cost[i][j] = in.nextInt();
            }
        }

        System.out.println("The entered cost matrix is");

        for (i = 1; i <= n; i++) {

            for (j = 1; j <= n; j++) {

                System.out.print(cost[i][j] + "\t");
            }

            System.out.println();
        }

        System.out.println(
                "Minimum Spanning Tree Edges and costs are : ");

        mincost = pr(cost, n, mincost);

        System.out.println(
                "The minimum spanning tree cost is : " + mincost);

        System.out.println(
                "******* ********************* *******");
    }

    static int pr(int cost[][], int n, int mincost) {

        int nearV[] = new int[10];
        int t[][] = new int[10][3];
        int u = 0, i, j, k;

        for (i = 2; i <= n; i++)
            nearV[i] = 1;

        nearV[1] = 0;

        for (i = 1; i < n; i++) {

            int min = 999;

            for (j = 1; j <= n; j++) {

                if (nearV[j] != 0 &&
                    cost[j][nearV[j]] < min) {

                    min = cost[j][nearV[j]];
                    u = j;
                }
            }

            t[i][1] = u;
            t[i][2] = nearV[u];

            mincost += min;

            nearV[u] = 0;

            for (k = 1; k <= n; k++) {

                if (nearV[k] != 0 &&
                    cost[k][nearV[k]] > cost[k][u])

                    nearV[k] = u;
            }

            System.out.println(
                    i + " Minimum edge is "
                    + t[i][1] + ","
                    + t[i][2]
                    + " and its cost is :" + min);
        }

        return mincost;
    }
}
KRUSKALS
import java.util.Scanner;

public class kruskalUnion {

    static int[] parent = new int[50];
    static int[][] cost = new int[10][10];

    static int a, b, i, j, u, v, n,
               min, noe = 1, mincost = 0;

    static int find(int w) {

        while (parent[w] != 0)
            w = parent[w];

        return w;
    }

    static void union() {

        if (u != v) {

            noe++;

            System.out.println(
                    noe - 1 +
                    "Edge(" + a + "," + b + ")=" + min);

            mincost += min;

            parent[v] = u;
        }

        cost[a][b] = cost[b][a] = 999;
    }

    public static void main(String[] args) {

        Scanner read = new Scanner(System.in);

        System.out.println("Enter the no. of vertices:");

        n = read.nextInt();

        System.out.println(
                "Enter the cost adjacency matrix, 999 for no direct path:");

        for (i = 1; i <= n; i++)
            for (j = 1; j <= n; j++)
                cost[i][j] = read.nextInt();

        while (noe < n) {

            min = 999;

            for (i = 1; i <= n; i++) {

                for (j = 1; j <= n; j++) {

                    if (cost[i][j] < min) {

                        min = cost[i][j];

                        a = u = i;
                        b = v = j;
                    }
                }
            }

            u = find(u);
            v = find(v);

            union();
        }

        System.out.println(
                "minimum cost =" + mincost);
    }
}
WARSHALLS
import java.util.Scanner;

public class Warshalls {

    void warsh(int[][] w, int n) {

        int i, j, k;

        for (k = 1; k <= n; k++)

            for (i = 1; i <= n; i++)

                for (j = 1; j <= n; j++)

                    w[i][j] =
                    (w[i][j] != 0) ||
                    ((w[i][k] != 0) &&
                    (w[k][j] != 0))
                    ? 1 : 0;
    }

    public static void main(String[] args) {

        int n, i, j;

        int a[][] = new int[10][10];

        Scanner sc = new Scanner(System.in);

        System.out.println("Enter no of vertices");

        n = sc.nextInt();

        System.out.println("Enter the weighted matrix");

        for (i = 1; i <= n; i++)
            for (j = 1; j <= n; j++)
                a[i][j] = sc.nextInt();

        Warshalls f = new Warshalls();

        f.warsh(a, n);

        System.out.println("The shortest path matrix is");

        for (i = 1; i <= n; i++) {

            for (j = 1; j <= n; j++) {

                System.out.print(a[j][i] + " ");
            }

            System.out.println();
        }
    }
}
HAMILTON
package javaapplication11;

import java.util.Scanner;

public class P12new {

    static int[] x = new int[25];

    static void Next_Vertex(int G[][], int n, int k) {

        int j;

        while (true) {

            x[k] = (x[k] + 1) % (n + 1);

            if (x[k] == 0)
                return;

            if (G[x[k - 1]][x[k]] != 0) {

                for (j = 1; j <= k - 1; j++) {

                    if (x[j] == x[k])
                        break;
                }

                if (j == k) {

                    if ((k < n) ||
                       ((k == n) && (G[x[n]][x[1]] != 0)))
                        return;
                }
            }
        }
    }

    static void H_Cycle(int G[][], int n, int k) {

        int i;

        while (true) {

            Next_Vertex(G, n, k);

            if (x[k] == 0)
                return;

            if (k == n) {

                System.out.println("\n");

                for (i = 1; i <= n; i++)
                    System.out.print(x[i] + "-->");

                System.out.println(x[1]);
            }

            else
                H_Cycle(G, n, k + 1);
        }
    }

    public static void main(String[] args) {

        int i, j, n;

        int[][] G = new int[25][25];

        Scanner read = new Scanner(System.in);

        System.out.println(
                "Enter the number of vertices of the graph");

        n = read.nextInt();

        System.out.println("Enter the Path adjacency matrix");

        for (i = 1; i <= n; i++) {

            for (j = 1; j <= n; j++) {

                G[i][j] = read.nextInt();
                x[i] = 0;
            }
        }

        x[1] = 1;

        System.out.println("\n Hamiltonian Cycles are");

        H_Cycle(G, n, 2);
    }
}
NQUEEN
import java.util.Scanner;

public class NQueens {

    static int[] x = new int[20];

    static boolean place(int k, int i) {

        for (int j = 1; j < k; j++) {

            if (x[j] == i ||
                Math.abs(x[j] - i) == Math.abs(j - k)) {

                return false;
            }
        }

        return true;
    }

    static void nQueens(int k, int n) {

        for (int i = 1; i <= n; i++) {

            if (place(k, i)) {

                x[k] = i;

                if (k == n) {

                    printSolution(n);
                }

                else {

                    nQueens(k + 1, n);
                }
            }
        }
    }

    static void printSolution(int n) {

        System.out.println("\nSolution:");

        for (int i = 1; i <= n; i++) {

            for (int j = 1; j <= n; j++) {

                if (x[i] == j)
                    System.out.print("Q ");
                else
                    System.out.print(". ");
            }

            System.out.println();
        }
    }

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of Queens: ");

        int n = sc.nextInt();

        nQueens(1, n);
    }
}
TSP
import java.util.*;

public class travel {

    public static void main(String[] args) {

        int c[][] = new int[10][10];
        int tour[] = new int[10];

        Scanner in = new Scanner(System.in);

        int i, j, cost;

        System.out.println(
                "**** TSP DYNAMIC PROGRAMMING *******");

        System.out.println("Enter the number of cities: ");

        int n = in.nextInt();

        if (n == 1) {

            System.out.println("Path is not possible");
            System.exit(0);
        }

        System.out.println("Enter the cost matrix");

        for (i = 1; i <= n; i++)
            for (j = 1; j <= n; j++)
                c[i][j] = in.nextInt();

        System.out.println("The entered cost matrix is");

        for (i = 1; i <= n; i++) {

            for (j = 1; j <= n; j++) {

                System.out.print(c[i][j] + "\t");
            }

            System.out.println();
        }

        for (i = 1; i <= n; i++)
            tour[i] = i;

        cost = tspdp(c, tour, 1, n);

        System.out.println("The accurate path is");

        for (i = 1; i <= n; i++)
            System.out.print(tour[i] + "->");

        System.out.println("1");

        System.out.println(
                "The accurate mincost is " + cost);

        System.out.println(
                "******* ************* ***************");
    }

    static int tspdp(int c[][],
                     int tour[],
                     int start,
                     int n) {

        int mintour[] = new int[10];
        int temp[] = new int[10];

        int mincost = 999, ccost, i, j, k;

        if (start == n - 1) {

            return (c[tour[n - 1]][tour[n]]
                    + c[tour[n]][1]);
        }

        for (i = start + 1; i <= n; i++) {

            for (j = 1; j <= n; j++)
                temp[j] = tour[j];

            temp[start + 1] = tour[i];
            temp[i] = tour[start + 1];

            if ((c[tour[start]][tour[i]]
                + (ccost = tspdp(c,
                                 temp,
                                 start + 1,
                                 n)))
                < mincost) {

                mincost =
                        c[tour[start]][tour[i]]
                        + ccost;

                for (k = 1; k <= n; k++)
                    mintour[k] = temp[k];
            }
        }

        for (i = 1; i <= n; i++)
            tour[i] = mintour[i];

        return mincost;
    }
}
0/1 KNAPSACK
import java.util.Scanner;

public class knap {

    public static void main(String[] args) {

        int v[][] = new int[30][30];
        int w[] = new int[10];
        int p[] = new int[10];

        Scanner in = new Scanner(System.in);

        int i, j;

        System.out.println(
                "******** KNAPSACK PROBLEM ***********");

        System.out.println(
                "Enter the total number of items: ");

        int n = in.nextInt();

        System.out.println(
                "Enter the weight of each item: ");

        for (i = 1; i <= n; i++)
            w[i] = in.nextInt();

        System.out.println(
                "Enter the profit of each item: ");

        for (i = 1; i <= n; i++)
            p[i] = in.nextInt();

        System.out.println(
                "Enter the knapsack capacity: ");

        int m = in.nextInt();

        displayinfo(m, n, w, p);

        knapsack(m, n, w, p, v);

        System.out.println(
                "The contents of the knapsack table are");

        for (i = 0; i <= n; i++) {

            for (j = 0; j <= m; j++) {

                System.out.print(v[i][j] + " ");
            }

            System.out.println();
        }

        optimal(m, n, w, v);
    }

    static void displayinfo(
            int m, int n, int w[], int p[]) {

        System.out.println(
                "Entered information about knapsack problem are");

        System.out.println("ITEM\tWEIGHT\tPROFIT");

        for (int i = 1; i <= n; i++)
            System.out.println(
                    i + "\t" + w[i] + "\t" + p[i]);

        System.out.println("Capacity = " + m);
    }

    static void knapsack(
            int m, int n,
            int w[], int p[],
            int v[][]) {

        for (int i = 0; i <= n; i++) {

            for (int j = 0; j <= m; j++) {

                if (i == 0 || j == 0)
                    v[i][j] = 0;

                else if (j < w[i])
                    v[i][j] = v[i - 1][j];

                else
                    v[i][j] =
                            max(v[i - 1][j],
                            v[i - 1][j - w[i]]
                            + p[i]);
            }
        }
    }

    private static int max(int i, int j) {

        if (i > j)
            return i;
        else
            return j;
    }

    static void optimal(
            int m, int n,
            int w[], int v[][]) {

        int i = n, j = m, item = 0;

        int x[] = new int[10];

        while (i != 0 && j != 0) {

            if (v[i][j] != v[i - 1][j]) {

                x[i] = 1;
                j = j - w[i];
            }

            i = i - 1;
        }

        System.out.println(
                "Optimal solution is :" + v[n][m]);

        System.out.println("Selected items are: ");

        for (i = 1; i <= n; i++)

            if (x[i] == 1) {

                System.out.print(i + " ");
                item = 1;
            }

        if (item == 0)
            System.out.println(
                    "NIL\t Sorry ! No item can be placed in Knapsack");

        System.out.println(
                "\n***************************************");
    }
}
FLOYD
import java.util.Scanner;

public class floyd {

    public static void main(String[] args) {

        int a[][] = new int[10][10];
        int i, j;

        Scanner in = new Scanner(System.in);

        System.out.println(
                "***********FLOYD'S ALGORITHM**********");

        System.out.println(
                "Enter the number of vertices: ");

        int n = in.nextInt();

        System.out.println(
                "Enter the adjacency matrix");

        for (i = 1; i <= n; i++)
            for (j = 1; j <= n; j++)
                a[i][j] = in.nextInt();

        System.out.println(
                "Entered adjacency matrix is: ");

        for (i = 1; i <= n; i++) {

            for (j = 1; j <= n; j++) {

                System.out.print(a[i][j] + "\t");
            }

            System.out.println();
        }

        floydalgo(a, n);

        System.out.println(
                "All pair shortest path matrix:");

        for (i = 1; i <= n; i++) {

            for (j = 1; j <= n; j++)
                System.out.print(a[i][j] + "\t");

            System.out.println();
        }

        System.out.println(
                "************ ********* **************");
    }

    static void floydalgo(int a[][], int n) {

        for (int k = 1; k <= n; k++) {

            for (int i = 1; i <= n; i++)

                for (int j = 1; j <= n; j++)

                    a[i][j] =
                            min(a[i][j],
                            a[i][k] + a[k][j]);
        }
    }

    static int min(int a, int b) {

        if (a > b)
            return b;
        else
            return a;
    }
}
DIJKSTRAS
import java.util.*;

public class dijkstra {

    public static void main(String[] args) {

        int i, j;

        int dist[] = new int[10];
        int visited[] = new int[10];
        int cost[][] = new int[10][10];
        int path[] = new int[10];

        Scanner in = new Scanner(System.in);

        System.out.println(
                "**** DIJKSTRA'S ALGORITHM ******");

        System.out.println(
                "Enter the number of nodes: ");

        int n = in.nextInt();

        System.out.println("Enter the cost matrix");

        for (i = 1; i <= n; i++)
            for (j = 1; j <= n; j++)
                cost[i][j] = in.nextInt();

        System.out.println(
                "The entered cost matrix is");

        for (i = 1; i <= n; i++) {

            for (j = 1; j <= n; j++) {

                System.out.print(cost[i][j] + "\t");
            }

            System.out.println();
        }

        System.out.println(
                "Enter the source vertex: ");

        int sv = in.nextInt();

        dij(cost, dist, sv, n, path, visited);

        printpath(sv, n, dist, path, visited);

        System.out.println(
                "\n********* *************** *********");
    }

    static void dij(
            int cost[][],
            int dist[],
            int sv,
            int n,
            int path[],
            int visited[]) {

        int count = 2, min, v = 0;

        for (int i = 1; i <= n; i++) {

            visited[i] = 0;

            dist[i] = cost[sv][i];

            if (cost[sv][i] == 999)
                path[i] = 0;
            else
                path[i] = sv;
        }

        visited[sv] = 1;

        while (count <= n) {

            min = 999;

            for (int w = 1; w <= n; w++)

                if ((dist[w] < min)
                        && (visited[w] == 0)) {

                    min = dist[w];
                    v = w;
                }

            visited[v] = 1;

            count++;

            for (int w = 1; w <= n; w++) {

                if (dist[w] >
                        (dist[v] + cost[v][w])) {

                    dist[w] =
                            dist[v] + cost[v][w];

                    path[w] = v;
                }
            }
        }
    }

    static void printpath(
            int sv,
            int n,
            int dist[],
            int path[],
            int visited[]) {

        for (int w = 1; w <= n; w++) {

            if (visited[w] == 1 && w != sv) {

                System.out.println(
                        "The shortest distance between ");

                System.out.println(
                        sv + "-> =" + w +
                        " is :" + dist[w]);

                int t = path[w];

                System.out.println("The path is:");

                System.out.print(" " + w);

                while (t != sv) {

                    System.out.print("<-->" + t);

                    t = path[t];
                }

                System.out.print("<-->" + sv);
            }
        }
    }
}
