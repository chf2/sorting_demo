O(n^2) vs. O(n*lg(n)) -- Theory and Practice

It should be clear now that for any moderately large inputs, algorithms 
that run in O(n*lg(n)) time will significantly outperform those that run 
in O(n^2). 

![time_complexity](./nlgn_vs_n2.gif)

While one of the goals of algorithm analysis is to stay agnostic of 
implementaion details, let's briefly take a look at what this means in
practice. Let's look at a timed comparison of Merge Sort and Bubble Sort
for randomized array inputs of varying sizes. Your running times may vary 
significantly from the ones posted here depending on your machine and the 
result of the array randomizer, but should they grow at roughly the same rate. 

To begin, run the sorting_demo.rb script in your terminal. The demo will run
3 timed trials for each sorting algorithm with a randomized input of increasing
size, and compute the average time taken to sort the arrays. (You can change 
these defaults in the script file in SortingDemo::run_performance_tests.)

Let's start with something small: press any key twice to run Merge Sort 
and Bubble Sort for 5 elements. The results here are fairly uninteresting:
both should have run in similar time, and Merge Sort may even have performed
more operations due to different constant factors. Do this again for 50
elements the results should be similar. 

Now let's move on to 500 elements. 

```
Press any key to run Merge Sort for 500 elements:
On average, Merge Sort took 0.0082 seconds.
Press any key to run Bubble Sort for 500 elements:
On average, Bubble Sort took 0.0279 seconds.
```

We're beginning to see some separation here between the performance of the two.
In practice, though, this doesn't mean much to us; on my machine, both are still
taking well under a second to run. What about 5000 elements?

```
Press any key to run Merge Sort for 5000 elements:
On average, Merge Sort took 0.0253 seconds.
Press any key to run Bubble Sort for 5000 elements:
On average, Bubble Sort took 2.7528 seconds.
```

Now things are starting to get interesting. Even for only 5000 elements, one of
the two algorithms we're testing no longer feels instantaneous. If we were 
writing an application where the user needed to wait for the results of the
sort to continue, this would start significantly affecting their experience.

Lastly, run Merge Sort for 50,000 elements. On my machine, this still runs in 
a reasonable amount of time. 

```
Press any key to run Merge Sort for 50000 elements:
On average, merge sort took 0.2796 seconds.
```

Now, run Bubble Sort. 

While this runs, let's think about a few things. Can you give a rough estimate
of how long this will take, even with randomized input? What factors would go
into whether your estimate would be high or low?

50,000 elements is not that many. Even a relatively small real-world application
that used suboptimal algorithms to process data will take a huge performance 
hit. Go ahead and play around with the input size a bit more. Approximately how
long will it take to run this for 100,000 elements?