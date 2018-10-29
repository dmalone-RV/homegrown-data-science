## 5.2.4 Practice

### Question 1
Find all flights that

- Had an arrival delay of two or more hours
```{r}
filter(flights, arr_delay >= 120)
```
- Flew to Houston (IAH or HOU)
```{r}
filter(flights, dest %in% c("IAH", "HOU"))
```
-  Were operated by United, American, or Delta
```{r}
filter(flights, carrier %in% c("AA", "DL", "UA"))
```
- Departed in summer (July, August, and September)
```{r}
filter(flights, month %in% 7:9)
```
- Arrived more than two hours late, but didn’t leave late
```{r}
filter(flights, arr_delay > 120, dep_delay <= 0)
```
- Were delayed by at least an hour, but made up over 30 minutes in flight
```{r}
filter(flights, (dep_delay >= 60), ((dep_delay - arr_delay) > 30))
```
- Departed between midnight and 6am (inclusive)
```{r}
filter(flights, (dep_time >= 2400) | (dep_time <= 600))
```
### Question 2
Another useful dplyr filtering helper is between(). What does it do?
> `between` is a built-in function that is essentially a shortcut for `x >= left & x <= right`

Can you use it to simplify the code needed to answer the previous challenges?
```{r}
filter(flights, between(dep_time, 600, 2400))
```

### Question 3
How many flights have a missing dep_time?
> 8255 flights

What other variables are missing?
>

What might these rows represent?
>

### Question 4
Why is NA ^ 0 not missing? 
> Because `NA ^ 0` evaluates to `NA (1)` which is not `missing`

Why is NA | TRUE not missing? 
>Because of the logical operator `|` which is an `OR` statement - so if either statement 
is evaluates to `TRUE` because of the second value `TRUE`

Can you figure out the general rule? (NA * 0 is a tricky counterexample!)
>

## 5.3.1 Practice

### Question 1
How could you use arrange() to sort all missing values to the start? (Hint: use is.na()).
```{r}
arrange(df, desc(is.na(x)))
```

### Question 2
Sort flights to find the most delayed flights
```{r}
arrange(flights, dep_delay)
```
Find the flights that left earliest.
```{r}
arrange(flights, desc(dep_delay))
```

### Question 3
Sort flights to find the fastest flights.
```{r}
filter(flights, between(dep_time, 600, 2400))
```

### Question 4
Which flights travelled the longest? 

Which travelled the shortest?

## 5.4.1 Practice

### Question 1
Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time, 
and arr_delay from flights.
```{r}
select(flights, matches("^dep|arr_delay|time$"))
select(flights, matches("dep"), matches("arr"), -matches("sched"), -carrier)
select_(flights, "dep_time", "dep_delay", "arr_time", "arr_delay")
select(flights, matches("^dep|^arr"))
select(flights, matches("time$|delay$"), -contains("sched"), -contains("air"))
```

### Question 2
What happens if you include the name of a variable multiple times 
in a select() call?
> Subsequent variables seem to be ignored

### Question 3
What does the one_of() function do? 
> It allows the use of character vectors in `select()` sp the `""` is no longer required

Why might it be helpful in conjunction with this vector? ```vars <- c("year", "month", "day", "dep_delay", "arr_delay")```
> It would allow us to use the characters elements in the vector


### Question 4
Does the result of running the following code surprise you? ```select(flights, contains("TIME"))```
> Sure.

How do the select helpers deal with case by default? 
> It will ignore case

How can you change that default?
> You would have to use `ignore.case`


