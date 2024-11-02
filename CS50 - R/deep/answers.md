# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning

Randomly partitioning observations can suggest a backup plan for either of the boats, but it still will be useless when combining the dataset. Maybe partitioning by 30 to 45 minutes per each may work better.

## Partitioning by Hour

This is better than random partitioning, as it is systematically divided and cleaner to view observation, handling dataset in order but with more storage. However, it can provide much more storage between midnight and 1am for Boat A, since most of the observations are deriving from the timespace. This process could be technical, but yet a little insufficient to be efficient.

## Partitioning by Hash Value

This process is the best, since hash value will be divided into three, which will automatically give same amount of observation to each three boats with primary index. This is both efficient and systematic. But when combining, it may cause error with hash value or index, so they must be careful of this.
