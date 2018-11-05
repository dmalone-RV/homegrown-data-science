## 5.5.2 Practice

### Question 1
Currently `dep_time` and `sched_dep_time` are convenient to look at, but hard to compute with because they’re not really continuous numbers. Convert them to a more convenient representation of number of minutes since midnight.

```{r}
numMinSinceMidnight <- function(time){
  time %/% 100 * 60 + time %% 100
}

dep_time = hours2mins(flights$dep_time)
sched_dep_time = hours2mins(flights$sched_dep_time)
```
### Question 2
Compare `air_time` with `arr_time - dep_time`.
What do you expect to see? What do you see?
> We should expect to see the that `air_time` and `arr_time-dep_time` are equal

What do you need to do to fix it?
> We need to fix the data in the table for the 3 values so they are more in line with each other e.g. use the function created to convert hrs to minutes and evaluate for flights arriving after midnight

### Question 3
Compare `dep_time`, `sched_dep_time`, and `dep_delay`.
How would you expect those three numbers to be related?
>We should expect `sched_dep_time + dep_delay` to equal `dep_time` but they don't because it doesn't take in to account flights after 0:00(midnight)

### Question 4
Find the 10 most delayed flights using a ranking function.
```{r}
flights %>% filter(min_rank(-(flights$dep_delay)) %in% 1:10)
```
How do you want to handle ties? Carefully read the documentation for `min_rank()`
> use `rank(x, ties)`

### Question 5
What does `1:3 + 1:10` return?
```{r}
> test <- c(2, 4, 6, 5, 7, 9, 8, 10, 12, 11)
> temp <- 1:3 + 1:10
Warning message:
In 1:3 + 1:10 :
  longer object length is not a multiple of shorter object length
> temp == test
 [1] TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE TRUE
[10] TRUE
```
Why?
> Because R takes the short vector and repeats it until it becomes long enough to match i.e. Recycling

## 5.6.7 Practice

### Question 2
Come up with another approach that will give you the same output as `not_cancelled %>% count(dest)` and `not_cancelled %>% count(tailnum, wt = distance)` (without using `count()`).
```{r}
not_cancelled %>% group_by(dest) %>% summarise(n = n())

not_cancelled %>% group_by(tailnum) %>% tally(wt == distance)
```

### Question 3
Our definition of cancelled flights `(is.na(dep_delay) | is.na(arr_delay)`) is slightly suboptimal. Why?
> This doesn't take into account the fact that `is.na(dep_delay)` evaluates first i.e. if a flight doesn't take off it was cancelled

Which is the most important column?
>

### Question 4
Look at the number of cancelled flights per day. Is there a pattern? Is the proportion of cancelled flights related to the average delay?

### Question 5
Which carrier has the worst delays? Challenge: can you disentangle the effects of bad airports vs. bad carriers? Why/why not? (Hint: think about `flights %>% group_by(carrier, dest) %>% summarise(n())`)

### Question 6
What does the sort argument to `count()` do. When might you use it?

## 5.7.1 Practice

### Question 1

### Question 2

### Question 3

### Question 4

### Question 5

### Question 6

### Question 7

### Question 8
