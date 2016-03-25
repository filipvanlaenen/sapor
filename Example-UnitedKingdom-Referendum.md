Example: United Kingdom Referendum
==================================

The following file is a valid poll file for a British referendum poll. It is
based on the results of a poll conducted between 4 and 6 March by ICM.
    
    Area=UK
    Type=Referendum
    ==
    Remain=819
    Leave=816
    Other=368   

The following call will use the poll file to run an analysis, provided it has
been saved as 2016-04-06-ICM.poll.

    sapor analyze 2016-04-06-ICM.poll

For this file, the log will look like below.

    2016-03-25 09:05:45 INFO: Analyzing as a set of dichotomies...
    2016-03-25 09:05:45 INFO: Most probable fractions and 95% confidence intervals:
    Choice    MPF      CI(95%)     P(≥50%)
    Leave    50.0%   33.3%– 66.7%  100.0%
    Remain   50.0%   33.3%– 66.7%  100.0%
    Other    16.7%    0.0%– 33.3%    0.0%
    2016-03-25 09:05:45 INFO: Error estimate: ε ≤ 33.3%.
    2016-03-25 09:05:45 INFO: Number of data points: 3.
    2016-03-25 09:05:45 INFO: Most probable fractions and 95% confidence intervals:
    Choice    MPF      CI(95%)     P(≥50%)
    Leave    38.9%   33.3%– 44.4%    0.0%
    Remain   38.9%   33.3%– 44.4%    0.0%
    Other    16.7%   11.1%– 22.2%    0.0%
    2016-03-25 09:05:45 INFO: Error estimate: ε ≤ 11.1%.
    2016-03-25 09:05:45 INFO: Number of data points: 9.
    2016-03-25 09:05:45 INFO: Most probable fractions and 95% confidence intervals:
    Choice    MPF      CI(95%)     P(≥50%)
    Leave    42.6%   37.0%– 44.4%    0.0%
    Remain   42.6%   37.0%– 44.4%    0.0%
    Other    16.7%   14.8%– 22.2%    0.0%
    2016-03-25 09:05:45 INFO: Error estimate: ε ≤ 3.70%.
    2016-03-25 09:05:45 INFO: Number of data points: 27.
    2016-03-25 09:05:46 INFO: Most probable fractions and 95% confidence intervals:
    Choice    MPF      CI(95%)     P(≥50%)
    Remain   41.4%   38.3%– 43.2%    0.0%
    Leave    40.1%   38.3%– 43.2%    0.0%
    Other    17.9%   16.0%– 21.0%    0.0%
    2016-03-25 09:05:46 INFO: Error estimate: ε ≤ 1.23%.
    2016-03-25 09:05:46 INFO: Number of data points: 81.
    2016-03-25 09:05:48 INFO: Most probable fractions and 95% confidence intervals:
    Choice    MPF      CI(95%)     P(≥50%)
    Remain   40.9%   38.7%– 43.2%    0.0%
    Leave    40.5%   38.3%– 43.2%    0.0%
    Other    18.3%   16.5%– 20.2%    0.0%
    2016-03-25 09:05:48 INFO: Error estimate: ε ≤ 0.412%.
    2016-03-25 09:05:48 INFO: Number of data points: 243.
    2016-03-25 09:05:53 INFO: Most probable fractions and 95% confidence intervals:
    Choice    MPF      CI(95%)     P(≥50%)
    Remain   40.9%   38.7%– 43.1%    0.0%
    Leave    40.7%   38.5%– 42.9%    0.0%
    Other    18.3%   16.7%– 20.2%    0.0%
    2016-03-25 09:05:53 INFO: Error estimate: ε ≤ 0.137%.
    2016-03-25 09:05:53 INFO: Number of data points: 729.
    2016-03-25 09:06:13 INFO: Most probable fractions and 95% confidence intervals:
    Choice    MPF      CI(95%)     P(≥50%)
    Remain   40.9%   38.7%– 43.1%    0.0%
    Leave    40.7%   38.6%– 42.9%    0.0%
    Other    18.4%   16.7%– 20.2%    0.0%
    2016-03-25 09:06:15 INFO: Error estimate: ε ≤ 0.046%.
    2016-03-25 09:06:15 INFO: Number of data points: 2,187.
    2016-03-25 09:06:17 INFO: Analyzing as a polychotomy...
    2016-03-25 09:06:18 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice  Result    MPRF    MPF      CI(95%)      P(>↓)
    Remain   40.9%   17.8%   35.6%   35.6%– 35.6%  100.0%
    Leave    40.7%   17.8%   35.5%   35.5%– 35.5%        
    2016-03-25 09:06:18 INFO: Error estimate: ε ≤ 100%.
    2016-03-25 09:06:18 INFO: 1 simulations out of 1 data points, 1 / 55,460 of search space size (55,460).
    2016-03-25 09:06:18 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice  Result    MPRF    MPF      CI(95%)      P(>↓)
    Remain   40.9%   35.7%   35.7%   35.6%– 35.8%  100.0%
    Leave    40.7%   35.5%   35.5%   35.5%– 35.5%        
    2016-03-25 09:06:18 INFO: Error estimate: ε ≤ 17.9%.
    2016-03-25 09:06:18 INFO: 2 simulations out of 2 data points, 1 / 27,730 of search space size (55,460).
    2016-03-25 09:06:19 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice  Result    MPRF    MPF      CI(95%)      P(>↓)
    Remain   40.9%   36.0%   36.0%   35.7%– 36.0%  100.0%
    Leave    40.7%   35.6%   35.6%   35.5%– 35.6%        
    2016-03-25 09:06:19 INFO: Error estimate: ε ≤ 0.300%.
    2016-03-25 09:06:19 INFO: 4 simulations out of 4 data points, 1 / 13,865 of search space size (55,460).
    2016-03-25 09:06:19 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice  Result    MPRF    MPF      CI(95%)      P(>↓)
    Remain   40.9%   36.6%   36.6%   36.3%– 36.6%  100.0%
    Leave    40.7%   35.8%   35.8%   35.7%– 35.8%        
    2016-03-25 09:06:19 INFO: Error estimate: ε ≤ 0.600%.
    2016-03-25 09:06:19 INFO: 8 simulations out of 8 data points, 1 / 6,933 of search space size (55,460).
    2016-03-25 09:06:20 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice  Result    MPRF    MPF      CI(95%)      P(>↓)
    Remain   40.9%   37.7%   37.7%   37.4%– 37.7%  100.0%
    Leave    40.7%   36.1%   36.1%   36.0%– 36.2%        
    2016-03-25 09:06:20 INFO: Error estimate: ε ≤ 1.10%.
    2016-03-25 09:06:20 INFO: 16 simulations out of 16 data points, 1 / 3,466 of search space size (55,460).
    2016-03-25 09:06:20 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice  Result    MPRF    MPF      CI(95%)      P(>↓)
    Remain   40.9%   39.8%   39.8%   39.4%– 39.9%  100.0%
    Leave    40.7%   36.9%   36.9%   36.7%– 36.9%        
    2016-03-25 09:06:20 INFO: Error estimate: ε ≤ 2.19%.
    2016-03-25 09:06:20 INFO: 32 simulations out of 32 data points, 1 / 1,733 of search space size (55,460).
    2016-03-25 09:06:20 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice  Result    MPRF    MPF      CI(95%)      P(>↓)
    Remain   40.9%   43.3%   43.3%   41.9%– 44.1%  100.0%
    Leave    40.7%   38.0%   38.0%   37.5%– 38.3%        
    2016-03-25 09:06:20 INFO: Error estimate: ε ≤ 3.50%.
    2016-03-25 09:06:20 INFO: 64 simulations out of 64 data points, 1 / 867 of search space size (55,460).
    2016-03-25 09:06:21 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice  Result    MPRF    MPF      CI(95%)      P(>↓)
    Remain   40.9%   40.7%   40.9%   39.6%– 42.9%   53.6%
    Leave    40.7%   40.8%   40.8%   38.1%– 41.2%        
    2016-03-25 09:06:21 INFO: Error estimate: ε ≤ 2.80%.
    2016-03-25 09:06:21 INFO: 128 simulations out of 128 data points, 1 / 433 of search space size (55,460).
    2016-03-25 09:06:22 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice  Result    MPRF    MPF      CI(95%)      P(>↓)
    Remain   40.9%   40.7%   40.9%   39.0%– 42.9%   52.5%
    Leave    40.7%   40.8%   40.8%   38.1%– 43.3%        
    2016-03-25 09:06:22 INFO: Error estimate: ε ≤ 2.80%.
    2016-03-25 09:06:22 INFO: 256 simulations out of 256 data points, 1 / 217 of search space size (55,460).
    2016-03-25 09:06:24 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice  Result    MPRF    MPF      CI(95%)      P(>↓)
    Remain   40.9%   40.7%   40.9%   39.0%– 42.9%   47.8%
    Leave    40.7%   40.8%   40.8%   38.1%– 43.2%        
    2016-03-25 09:06:24 INFO: Error estimate: ε ≤ 0.046%.
    2016-03-25 09:06:24 INFO: 512 simulations out of 512 data points, 1 / 108 of search space size (55,460).
    2016-03-25 09:06:24 INFO: Done.
