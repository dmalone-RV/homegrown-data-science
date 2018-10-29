## 4.4 Practice

### Question 1
Why does this code not work?
```{r}
my_variable <- 10
my_varıable
#> Error in eval(expr, envir, enclos): object 'my_varıable' not found
```
Look carefully! (This may seem like an exercise in pointlessness, but training your brain to notice even the tiniest difference will pay off when programming.)

> The variables are a mismatch - `my_variable` is not the same as `my_var1ble` which is not instantiated.

### Question 2
Tweak each of the following R commands so that they run correctly:

```{r}
library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

fliter(mpg, cyl = 8)
filter(diamond, carat > 3)
```
>`fliter(mpg, cyl = 8)`:  `fliter` should be `filter` and `cyl = 8` should be `cyl == 8`
  
>`filter(diamonds, carat > 3)` `diamond` should be `diamonds`

### Question 3
Press Alt + Shift + K. What happens? How can you get to the same place using the menus?

> Navigate to `Tools > Keyboard Shortcuts Help`
