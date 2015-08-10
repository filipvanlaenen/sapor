Example: Oslo
=============

The following file is a valid poll file for a poll for the city council of Oslo.
It is based on the results of a poll done from 22--24 June 2015 by Norfakta
for Høyre.

    Area=NO-0301
    ==
    Arbeiderpartiet=283
    Høyre=248
    Venstre=63
    Miljøpartiet de Grønne=59
    Fremskrittspartiet=53
    Sosialistisk Venstreparti=39
    Rødt=30
    Kristelig Folkeparti=16
    Senterpartiet=6
    Other=3

The following call will use the poll file to run an analysis.

    sapor analyze Høyre-Norfakta-20150624.poll

For this file, the log will look like below.

    2015-08-07 18:18:46 INFO: Analyzing as a set of dichotomies...
    2015-08-07 18:18:47 INFO: Most probable fractions and 95% confidence intervals:
    Choice                       MPF      CI(95%)     P(≥1%)
    Arbeiderpartiet             50.0%   33.3%– 66.7%  100.0%
    Fremskrittspartiet          16.7%    0.0%– 33.3%  100.0%
    Høyre                       16.7%    0.0%– 33.3%  100.0%
    Kristelig Folkeparti        16.7%    0.0%– 33.3%  100.0%
    Miljøpartiet de Grønne      16.7%    0.0%– 33.3%  100.0%
    Rødt                        16.7%    0.0%– 33.3%  100.0%
    Senterpartiet               16.7%    0.0%– 33.3%  100.0%
    Sosialistisk Venstreparti   16.7%    0.0%– 33.3%  100.0%
    Venstre                     16.7%    0.0%– 33.3%  100.0%
    Other                       16.7%    0.0%– 33.3%  100.0%
    2015-08-07 18:18:47 INFO: Error estimate: ε ≤ 33.3%.
    2015-08-07 18:18:47 INFO: Number of data points: 3.
    2015-08-07 18:18:47 INFO: Most probable fractions and 95% confidence intervals:
    Choice                       MPF      CI(95%)     P(≥1%)
    Arbeiderpartiet             38.9%   33.3%– 44.4%  100.0%
    Høyre                       27.8%   22.2%– 33.3%  100.0%
    Fremskrittspartiet           5.6%    0.0%– 11.1%  100.0%
    Kristelig Folkeparti         5.6%    0.0%– 11.1%  100.0%
    Miljøpartiet de Grønne       5.6%    0.0%– 11.1%  100.0%
    Rødt                         5.6%    0.0%– 11.1%  100.0%
    Senterpartiet                5.6%    0.0%– 11.1%  100.0%
    Sosialistisk Venstreparti    5.6%    0.0%– 11.1%  100.0%
    Venstre                      5.6%    0.0%– 11.1%  100.0%
    Other                        5.6%    0.0%– 11.1%  100.0%
    2015-08-07 18:18:47 INFO: Error estimate: ε ≤ 11.1%.
    2015-08-07 18:18:47 INFO: Number of data points: 9.
    2015-08-07 18:18:47 INFO: Most probable fractions and 95% confidence intervals:
    Choice                       MPF      CI(95%)     P(≥1%)
    Arbeiderpartiet             35.2%   29.6%– 40.7%  100.0%
    Høyre                       31.5%   25.9%– 37.0%  100.0%
    Miljøpartiet de Grønne       9.3%    3.7%– 11.1%  100.0%
    Venstre                      9.3%    3.7%– 11.1%  100.0%
    Fremskrittspartiet           5.6%    3.7%– 11.1%  100.0%
    Rødt                         5.6%    0.0%–  7.4%  100.0%
    Sosialistisk Venstreparti    5.6%    3.7%–  7.4%  100.0%
    Kristelig Folkeparti         1.9%    0.0%–  3.7%  100.0%
    Senterpartiet                1.9%    0.0%–  3.7%  100.0%
    Other                        1.9%    0.0%–  3.7%  100.0%
    2015-08-07 18:18:47 INFO: Error estimate: ε ≤ 3.70%.
    2015-08-07 18:18:47 INFO: Number of data points: 27.
    2015-08-07 18:18:48 INFO: Most probable fractions and 95% confidence intervals:
    Choice                       MPF      CI(95%)     P(≥1%)
    Arbeiderpartiet             35.2%   32.1%– 39.5%  100.0%
    Høyre                       31.5%   27.2%– 34.6%  100.0%
    Venstre                      8.0%    6.2%–  9.9%  100.0%
    Fremskrittspartiet           6.8%    4.9%–  8.6%  100.0%
    Miljøpartiet de Grønne       6.8%    4.9%–  9.9%  100.0%
    Rødt                         4.3%    2.5%–  6.2%  100.0%
    Sosialistisk Venstreparti    4.3%    3.7%–  7.4%  100.0%
    Kristelig Folkeparti         1.9%    1.2%–  3.7%  100.0%
    Senterpartiet                0.6%    0.0%–  2.5%    3.4%
    Other                        0.6%    0.0%–  1.2%    0.1%
    2015-08-07 18:18:48 INFO: Error estimate: ε ≤ 1.23%.
    2015-08-07 18:18:48 INFO: Number of data points: 81.
    2015-08-07 18:18:50 INFO: Most probable fractions and 95% confidence intervals:
    Choice                       MPF      CI(95%)     P(≥1%)
    Arbeiderpartiet             35.2%   32.1%– 39.1%  100.0%
    Høyre                       31.1%   27.6%– 34.6%  100.0%
    Venstre                      8.0%    6.2%– 10.3%  100.0%
    Miljøpartiet de Grønne       7.2%    5.8%–  9.5%  100.0%
    Fremskrittspartiet           6.8%    4.9%–  8.6%  100.0%
    Sosialistisk Venstreparti    4.7%    3.3%–  6.6%  100.0%
    Rødt                         3.9%    2.5%–  5.3%  100.0%
    Kristelig Folkeparti         1.9%    1.2%–  3.3%   83.2%
    Senterpartiet                0.6%    0.4%–  1.6%    1.9%
    Other                        0.6%    0.0%–  1.2%    0.1%
    2015-08-07 18:18:50 INFO: Error estimate: ε ≤ 0.412%.
    2015-08-07 18:18:50 INFO: Number of data points: 243.
    2015-08-07 18:18:56 INFO: Most probable fractions and 95% confidence intervals:
    Choice                       MPF      CI(95%)     P(≥1%)
    Arbeiderpartiet             35.3%   32.1%– 38.8%  100.0%
    Høyre                       30.9%   27.8%– 34.3%  100.0%
    Venstre                      7.9%    6.2%– 10.0%  100.0%
    Miljøpartiet de Grønne       7.3%    5.8%–  9.5%  100.0%
    Fremskrittspartiet           6.7%    5.1%–  8.6%  100.0%
    Sosialistisk Venstreparti    4.9%    3.6%–  6.7%  100.0%
    Rødt                         3.8%    2.6%–  5.3%  100.0%
    Kristelig Folkeparti         2.0%    1.2%–  3.3%   82.5%
    Senterpartiet                0.8%    0.3%–  1.6%    2.2%
    Other                        0.3%    0.1%–  1.1%    0.1%
    2015-08-07 18:18:56 INFO: Error estimate: ε ≤ 0.137%.
    2015-08-07 18:18:56 INFO: Number of data points: 729.
    2015-08-07 18:19:14 INFO: Most probable fractions and 95% confidence intervals:
    Choice                       MPF      CI(95%)     P(≥1%)
    Arbeiderpartiet             35.4%   32.1%– 38.8%  100.0%
    Høyre                       31.0%   27.9%– 34.3%  100.0%
    Venstre                      7.9%    6.2%– 10.0%  100.0%
    Miljøpartiet de Grønne       7.4%    5.8%–  9.4%  100.0%
    Fremskrittspartiet           6.6%    5.1%–  8.6%  100.0%
    Sosialistisk Venstreparti    4.9%    3.6%–  6.6%  100.0%
    Rødt                         3.8%    2.6%–  5.3%  100.0%
    Kristelig Folkeparti         2.0%    1.2%–  3.2%   79.5%
    Senterpartiet                0.8%    0.3%–  1.6%    1.8%
    Other                        0.4%    0.1%–  1.1%    0.1%
    2015-08-07 18:19:14 INFO: Error estimate: ε ≤ 0.046%.
    2015-08-07 18:19:14 INFO: Number of data points: 2,187.
    2015-08-07 18:19:14 INFO: Analyzing as a polychotomy...
    2015-08-07 18:19:15 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   13.9%   27.5%   27.5%– 27.5%  100.0%  17–17
    Høyre                       31.0%   11.9%   23.5%   23.5%– 23.5%  100.0%  14–14
    Venstre                      7.9%    2.1%    4.1%    4.1%–  4.1%  100.0%   2– 2
    Miljøpartiet de Grønne       7.4%    1.9%    3.7%    3.7%–  3.7%  100.0%   2– 2
    Fremskrittspartiet           6.6%    1.6%    3.2%    3.2%–  3.2%  100.0%   2– 2
    Sosialistisk Venstreparti    4.9%    1.1%    2.1%    2.1%–  2.1%  100.0%   1– 1
    Rødt                         3.8%    0.6%    1.4%    1.4%–  1.4%  100.0%   1– 1
    Kristelig Folkeparti         2.0%    0.4%    0.5%    0.5%–  0.5%  100.0%   0– 0
    Senterpartiet                0.8%    0.0%    0.1%    0.1%–  0.1%           0– 0
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   50.1%   34.8%   34.8%– 34.8%     0.0%  21–21      0.0%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   50.1%   33.4%   33.4%– 33.4%     0.0%  20–20      0.0%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   50.1%   31.0%   31.0%– 31.0%     0.0%  19–19      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   50.1%   29.7%   29.7%– 29.7%     0.0%  18–18      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   50.1%   26.7%   26.7%– 26.7%     0.0%  16–16      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   50.1%   35.0%   35.0%– 35.0%     0.0%  20–20      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   50.1%   31.3%   31.3%– 31.3%     0.0%  18–18      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   50.1%   31.3%   31.3%– 31.3%     0.0%  18–18      0.0%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   50.1%   28.1%   28.1%– 28.1%     0.0%  16–16      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   50.1%    4.6%    4.6%–  4.6%     0.0%   2– 2      0.0%
    2015-08-07 18:19:15 INFO: Error estimate: ε ≤ 100%.
    2015-08-07 18:19:15 INFO: 1 simulations out of 1 data points, 1 / 198,285,846,287,760,000,000 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:19:15 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   29.9%   29.9%   29.9%– 29.9%  100.0%  18–18
    Høyre                       31.0%   25.6%   25.6%   25.6%– 25.7%  100.0%  15–15
    Venstre                      7.9%    6.1%    6.1%    6.0%–  6.1%  100.0%   4– 4
    Miljøpartiet de Grønne       7.4%    5.4%    5.4%    5.4%–  5.4%  100.0%   3– 3
    Fremskrittspartiet           6.6%    4.6%    4.6%    4.6%–  4.7%  100.0%   3– 3
    Sosialistisk Venstreparti    4.9%    3.1%    3.1%    3.1%–  3.2%  100.0%   2– 2
    Rødt                         3.8%    2.2%    2.2%    2.1%–  2.2%  100.0%   1– 1
    Kristelig Folkeparti         2.0%    1.1%    1.1%    1.1%–  1.1%  100.0%   0– 0
    Senterpartiet                0.8%    0.1%    0.1%    0.1%–  0.1%           0– 0
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   68.9%   40.8%   37.8%– 40.8%     0.0%  24–24      0.0%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   68.1%   38.6%   36.0%– 38.6%     0.0%  23–23      0.0%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   66.6%   35.3%   33.2%– 35.3%     0.0%  21–21      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   65.9%   33.2%   31.4%– 33.2%     0.0%  20–20      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   64.4%   30.3%   28.5%– 30.3%     0.0%  18–18      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   69.6%   42.8%   38.9%– 42.8%     0.0%  25–25      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   67.4%   37.5%   34.4%– 37.5%     0.0%  22–22      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   67.1%   37.4%   34.3%– 37.4%     0.0%  22–22      0.0%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   65.4%   32.8%   30.4%– 32.8%     0.0%  19–19      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   53.1%    7.2%    5.9%–  7.2%     0.0%   4– 4      0.0%
    2015-08-07 18:19:15 INFO: Error estimate: ε ≤ 2.42%.
    2015-08-07 18:19:15 INFO: 2 simulations out of 2 data points, 1 / 99,142,923,143,880,000,000 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:19:16 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   30.5%   30.5%   30.5%– 30.5%  100.0%  18–18
    Høyre                       31.0%   24.8%   24.8%   24.7%– 24.8%  100.0%  15–15
    Venstre                      7.9%   10.4%   10.4%   10.4%– 10.5%  100.0%   6– 6
    Miljøpartiet de Grønne       7.4%    8.1%    8.1%    8.1%–  8.1%  100.0%   5– 5
    Fremskrittspartiet           6.6%    5.9%    5.9%    5.9%–  5.9%  100.0%   3– 3
    Sosialistisk Venstreparti    4.9%    2.9%    2.9%    2.9%–  3.0%    0.0%   2– 2
    Rødt                         3.8%    7.6%    7.6%    7.6%–  7.6%  100.0%   5– 5
    Kristelig Folkeparti         2.0%    5.2%    5.2%    5.2%–  5.3%  100.0%   3– 3
    Senterpartiet                0.8%    0.4%    0.4%    0.4%–  0.5%           0– 0
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   74.1%   49.6%   48.2%– 49.6%     0.0%  30–30    100.0%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   41.6%   42.0%   40.3%– 42.9%     0.0%  25–25      0.0%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   70.4%   41.5%   40.6%– 41.5%     0.0%  25–25      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   34.4%   33.9%   33.5%– 35.3%     0.0%  20–20      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   31.4%   30.6%   30.5%– 32.2%     0.0%  18–18      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   76.4%   54.4%   52.5%– 54.4%   100.0%  32–32    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   72.6%   46.8%   45.2%– 46.8%     0.0%  27–27      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   72.6%   46.3%   44.9%– 46.3%     0.0%  27–27      0.0%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   69.6%   40.4%   39.0%– 40.4%     0.0%  24–24      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   56.6%   16.1%   13.0%– 16.1%     0.0%   9– 9      0.0%
    2015-08-07 18:19:16 INFO: Error estimate: ε ≤ 5.44%.
    2015-08-07 18:19:16 INFO: 4 simulations out of 9 data points, 1 / 22,031,760,698,640,000,000 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:19:16 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   35.3%   35.3%   35.3%– 35.3%  100.0%  21–21
    Høyre                       31.0%   29.1%   29.1%   29.0%– 29.1%  100.0%  18–18
    Venstre                      7.9%    5.0%    5.0%    5.0%–  5.0%    0.0%   3– 3
    Miljøpartiet de Grønne       7.4%   11.5%   11.5%   11.5%– 11.5%  100.0%   7– 7
    Fremskrittspartiet           6.6%    8.7%    8.7%    8.7%–  8.7%  100.0%   5– 5
    Sosialistisk Venstreparti    4.9%    5.1%    5.1%    5.0%–  5.1%  100.0%   3– 3
    Rødt                         3.8%    2.4%    2.4%    2.4%–  2.5%  100.0%   1– 1
    Kristelig Folkeparti         2.0%    1.3%    1.3%    1.3%–  1.3%  100.0%   1– 1
    Senterpartiet                0.8%    0.5%    0.5%    0.5%–  0.5%           0– 0
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   76.9%   54.8%   53.8%– 54.8%   100.0%  32–32    100.0%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   75.1%   52.4%   50.3%– 52.4%   100.0%  31–31    100.0%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   43.1%   43.3%   42.4%– 43.7%     0.0%  25–25      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   70.1%   40.9%   40.2%– 40.9%     0.0%  24–24      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   68.4%   37.8%   36.5%– 37.8%     0.0%  23–23      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   55.6%   55.6%   55.0%– 56.4%   100.0%  34–34    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   44.9%   44.6%   44.1%– 45.6%     0.0%  27–27      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   44.1%   44.1%   43.8%– 44.6%     0.0%  27–27      0.0%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   35.6%   35.4%   34.7%– 36.4%     0.0%  22–22      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%    6.4%    6.8%    5.7%–  7.0%     0.0%   4– 4      0.0%
    2015-08-07 18:19:16 INFO: Error estimate: ε ≤ 5.44%.
    2015-08-07 18:19:16 INFO: 8 simulations out of 31 data points, 1 / 6,396,317,622,185,806,451 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:19:17 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   35.3%   35.3%   35.3%– 35.3%  100.0%  21–21
    Høyre                       31.0%   29.1%   29.1%   29.0%– 29.1%  100.0%  18–18
    Venstre                      7.9%    5.0%    5.0%    5.0%–  5.0%    0.0%   3– 3
    Miljøpartiet de Grønne       7.4%   11.5%   11.5%   11.5%– 11.5%  100.0%   7– 7
    Fremskrittspartiet           6.6%    8.7%    8.7%    8.7%–  8.7%  100.0%   5– 5
    Sosialistisk Venstreparti    4.9%    5.1%    5.1%    5.0%–  5.1%  100.0%   3– 3
    Rødt                         3.8%    2.4%    2.4%    2.4%–  2.5%  100.0%   1– 1
    Kristelig Folkeparti         2.0%    1.3%    1.3%    1.3%–  1.3%  100.0%   1– 1
    Senterpartiet                0.8%    0.5%    0.5%    0.5%–  0.5%           0– 0
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   77.1%   54.8%   54.3%– 54.8%   100.0%  32–32    100.0%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   75.9%   52.4%   51.7%– 52.4%   100.0%  31–31    100.0%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   43.6%   43.3%   43.1%– 43.7%     0.0%  25–25      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   41.6%   40.9%   40.9%– 42.3%     0.0%  24–24      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   37.4%   37.8%   36.5%– 38.3%     0.0%  23–23      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   56.1%   55.6%   55.6%– 56.4%   100.0%  34–34    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   44.6%   44.6%   44.1%– 44.9%     0.0%  27–27      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   44.1%   44.1%   43.8%– 44.6%     0.0%  27–27      0.0%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   35.9%   35.4%   35.2%– 36.4%     0.0%  22–22      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%    6.4%    6.8%    5.7%–  7.0%     0.0%   4– 4      0.0%
    2015-08-07 18:19:17 INFO: Error estimate: ε ≤ 9.42%.
    2015-08-07 18:19:17 INFO: 16 simulations out of 83 data points, 1 / 2,388,986,099,852,530,120 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:19:17 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   33.1%   33.1%   33.1%– 33.1%    0.7%  20–20
    Høyre                       31.0%   34.5%   34.5%   34.5%– 34.5%  100.0%  21–21
    Venstre                      7.9%    8.6%    8.6%    8.6%–  8.6%   99.3%   5– 5
    Miljøpartiet de Grønne       7.4%    5.9%    5.9%    5.9%–  5.9%    0.7%   3– 3
    Fremskrittspartiet           6.6%    6.5%    6.5%    6.4%–  6.5%  100.0%   4– 4
    Sosialistisk Venstreparti    4.9%    4.0%    4.0%    4.0%–  4.1%  100.0%   2– 2
    Rødt                         3.8%    2.4%    2.4%    2.4%–  2.4%  100.0%   1– 1
    Kristelig Folkeparti         2.0%    1.5%    1.5%    1.5%–  1.6%    0.7%   1– 1
    Senterpartiet                0.8%    2.6%    2.6%    2.6%–  2.7%           2– 2
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   48.0%   48.0%   47.9%– 48.0%     0.7%  28–28      0.7%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   45.6%   45.6%   45.5%– 45.7%     0.7%  27–27      0.7%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   42.2%   42.2%   42.1%– 42.3%     0.0%  25–25      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   39.7%   39.8%   39.7%– 39.8%     0.0%  24–24      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   41.1%   41.0%   40.6%– 41.6%     0.0%  25–25      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   56.9%   56.9%   56.7%– 57.0%   100.0%  34–34    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   53.6%   53.7%   53.2%– 53.9%    99.3%  33–33     99.3%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   50.9%   51.1%   50.8%– 51.1%    99.3%  31–31     99.3%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   44.6%   44.6%   43.7%– 45.2%     0.0%  27–27      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   12.6%   12.7%   12.5%– 12.9%     0.0%   8– 8      0.0%
    2015-08-07 18:19:17 INFO: Error estimate: ε ≤ 5.62%.
    2015-08-07 18:19:17 INFO: 32 simulations out of 164 data points, 1 / 1,209,060,038,340,000,000 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:19:18 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   38.8%   38.8%   38.8%– 38.8%   98.7%  23–23
    Høyre                       31.0%   31.4%   31.4%   31.4%– 31.5%  100.0%  19–19
    Venstre                      7.9%    8.8%    8.8%    8.7%–  8.8%  100.0%   5– 5
    Miljøpartiet de Grønne       7.4%    5.5%    5.5%    5.4%–  5.5%    0.0%   3– 3
    Fremskrittspartiet           6.6%    6.6%    6.6%    6.6%–  6.6%  100.0%   4– 4
    Sosialistisk Venstreparti    4.9%    4.0%    4.0%    4.0%–  4.0%  100.0%   2– 2
    Rødt                         3.8%    2.2%    2.2%    2.2%–  2.2%  100.0%   1– 1
    Kristelig Folkeparti         2.0%    1.5%    1.5%    1.5%–  1.5%   98.7%   1– 1
    Senterpartiet                0.8%    1.2%    1.2%    1.1%–  1.2%           1– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   51.6%   51.6%   51.5%– 51.7%    98.7%  30–30     98.7%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   49.4%   49.4%   49.0%– 49.5%     0.0%  29–29      0.0%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   46.1%   46.2%   45.8%– 46.2%     0.0%  27–27      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   43.9%   44.0%   43.8%– 44.0%     0.0%  26–26      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   38.0%   38.0%   38.0%– 38.1%     0.0%  23–23      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   53.8%   53.7%   53.7%– 53.8%   100.0%  32–32    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   49.4%   49.5%   49.3%– 49.6%     1.3%  30–30    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   48.3%   48.3%   48.1%– 48.4%     1.3%  29–29      1.3%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   41.6%   41.7%   41.5%– 41.8%     0.0%  25–25      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   11.4%   11.4%   11.4%– 11.4%     0.0%   7– 7      0.0%
    2015-08-07 18:19:18 INFO: Error estimate: ε ≤ 5.72%.
    2015-08-07 18:19:18 INFO: 64 simulations out of 290 data points, 1 / 683,744,297,544,000,000 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:19:19 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   38.8%   38.8%   38.8%– 38.8%   98.7%  23–23
    Høyre                       31.0%   31.4%   31.4%   31.4%– 31.5%  100.0%  19–19
    Venstre                      7.9%    8.8%    8.8%    8.7%–  8.8%   99.5%   5– 5
    Miljøpartiet de Grønne       7.4%    5.5%    5.5%    5.4%–  5.5%    0.5%   3– 3
    Fremskrittspartiet           6.6%    6.6%    6.6%    6.6%–  6.6%  100.0%   4– 4
    Sosialistisk Venstreparti    4.9%    4.0%    4.0%    4.0%–  4.0%  100.0%   2– 2
    Rødt                         3.8%    2.2%    2.2%    2.2%–  2.2%  100.0%   1– 1
    Kristelig Folkeparti         2.0%    1.5%    1.5%    1.5%–  1.5%   98.7%   1– 1
    Senterpartiet                0.8%    1.2%    1.2%    1.1%–  1.2%           1– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   51.6%   51.6%   51.5%– 51.7%    98.7%  30–30     98.7%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   49.3%   49.4%   49.3%– 49.4%     0.0%  29–29      0.0%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   46.2%   46.2%   46.1%– 46.2%     0.0%  27–27      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   43.9%   44.0%   43.8%– 44.0%     0.0%  26–26      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   38.0%   38.0%   38.0%– 38.1%     0.0%  23–23      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   53.8%   53.7%   53.7%– 53.8%   100.0%  32–32    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   49.5%   49.5%   49.4%– 49.6%     1.3%  30–30     99.5%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   48.3%   48.3%   48.3%– 48.4%     1.3%  29–29      1.3%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   41.7%   41.7%   41.6%– 41.7%     0.0%  25–25      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   11.4%   11.4%   11.4%– 11.4%     0.0%   7– 7      0.0%
    2015-08-07 18:19:19 INFO: Error estimate: ε ≤ 7.36%.
    2015-08-07 18:19:19 INFO: 128 simulations out of 572 data points, 1 / 346,653,577,426,153,846 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:19:20 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   38.8%   38.8%   38.8%– 38.8%   98.7%  23–23
    Høyre                       31.0%   31.4%   31.4%   31.4%– 31.5%  100.0%  19–19
    Venstre                      7.9%    8.8%    8.8%    8.7%–  8.8%   99.5%   5– 5
    Miljøpartiet de Grønne       7.4%    5.5%    5.5%    5.4%–  5.5%    0.5%   3– 3
    Fremskrittspartiet           6.6%    6.6%    6.6%    6.6%–  6.6%  100.0%   4– 4
    Sosialistisk Venstreparti    4.9%    4.0%    4.0%    4.0%–  4.0%  100.0%   2– 2
    Rødt                         3.8%    2.2%    2.2%    2.2%–  2.2%   99.8%   1– 1
    Kristelig Folkeparti         2.0%    1.5%    1.5%    1.5%–  1.5%   98.7%   1– 1
    Senterpartiet                0.8%    1.2%    1.2%    1.1%–  1.2%           1– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   51.6%   51.6%   51.6%– 51.6%    98.5%  30–30     98.5%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   49.4%   49.4%   49.3%– 49.4%     0.0%  29–29      0.0%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   46.2%   46.2%   46.1%– 46.2%     0.0%  27–27      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   44.0%   44.0%   43.9%– 44.0%     0.0%  26–26      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   38.0%   38.0%   38.0%– 38.0%     0.0%  23–23      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   56.9%   53.7%   53.7%– 53.7%   100.0%  32–32    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   49.5%   49.5%   49.5%– 49.5%     1.5%  30–30     99.5%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   48.3%   48.3%   48.3%– 48.4%     1.5%  29–29      1.5%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   41.7%   41.7%   41.6%– 41.7%     0.0%  25–25      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   11.4%   11.4%   11.4%– 11.4%     0.0%   7– 7      0.0%
    2015-08-07 18:19:20 INFO: Error estimate: ε ≤ 3.89%.
    2015-08-07 18:19:20 INFO: 256 simulations out of 1,174 data points, 1 / 168,897,654,418,875,638 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:19:21 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   38.8%   38.8%   32.1%– 38.8%   97.7%  20–23
    Høyre                       31.0%   31.4%   31.4%   31.4%– 31.8%  100.0%  19–19
    Venstre                      7.9%    8.8%    8.8%    8.6%–  8.8%   98.1%   5– 5
    Miljøpartiet de Grønne       7.4%    5.5%    5.5%    5.4%–  6.8%    1.9%   3– 4
    Fremskrittspartiet           6.6%    6.6%    6.6%    6.4%–  6.6%   98.9%   4– 4
    Sosialistisk Venstreparti    4.9%    4.0%    4.0%    4.0%–  4.5%   99.2%   2– 3
    Rødt                         3.8%    2.2%    2.2%    2.2%–  3.1%   99.8%   1– 2
    Kristelig Folkeparti         2.0%    1.5%    1.5%    1.5%–  1.6%   98.0%   1– 1
    Senterpartiet                0.8%    1.2%    1.2%    1.1%–  1.2%           1– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   51.6%   51.6%   50.1%– 51.6%    97.8%  30–30     98.0%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   49.4%   49.4%   46.9%– 49.4%     1.1%  28–29      1.1%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   46.2%   46.2%   42.5%– 46.2%     0.0%  26–27      0.1%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   44.0%   44.0%   39.7%– 44.0%     0.0%  24–26      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   38.0%   38.0%   38.0%– 38.4%     0.0%  23–23      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   54.1%   53.7%   53.7%– 56.6%    99.9%  32–33     99.9%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   49.5%   49.5%   49.5%– 49.5%     2.5%  30–30     97.9%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   48.3%   48.3%   48.3%– 48.4%     2.0%  29–29      2.0%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   41.7%   41.7%   40.1%– 41.7%     0.0%  24–25      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   11.4%   11.4%   11.4%– 11.4%     0.0%   7– 7      0.0%
    2015-08-07 18:19:21 INFO: Error estimate: ε ≤ 6.77%.
    2015-08-07 18:19:21 INFO: 512 simulations out of 2,345 data points, 1 / 84,556,864,088,597,014 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:19:23 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   36.7%   36.7%   35.4%– 36.8%  100.0%  21–22
    Høyre                       31.0%   27.2%   27.2%   27.2%– 30.1%  100.0%  16–18
    Venstre                      7.9%    6.7%    6.7%    6.7%–  9.0%   15.8%   4– 5
    Miljøpartiet de Grønne       7.4%    9.5%    9.5%    4.8%–  9.6%   84.3%   3– 6
    Fremskrittspartiet           6.6%    7.4%    7.4%    7.3%–  7.4%  100.0%   4– 4
    Sosialistisk Venstreparti    4.9%    5.0%    5.0%    4.9%–  5.2%  100.0%   3– 3
    Rødt                         3.8%    3.6%    3.6%    3.6%–  4.2%  100.0%   2– 3
    Kristelig Folkeparti         2.0%    2.6%    2.6%    1.9%–  2.7%  100.0%   1– 2
    Senterpartiet                0.8%    1.0%    1.0%    1.0%–  1.4%           0– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   55.9%   55.9%   50.9%– 55.9%   100.0%  31–33    100.0%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   52.3%   52.3%   46.7%– 52.3%    84.2%  28–31     84.2%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   46.3%   46.3%   46.1%– 46.3%     0.0%  27–28      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   42.7%   42.7%   41.9%– 42.8%     0.0%  25–25      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   34.6%   34.6%   34.6%– 37.4%     0.0%  20–22      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   53.5%   53.5%   53.1%– 53.5%   100.0%  31–32    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   45.0%   45.0%   45.0%– 49.7%     0.0%  26–29      0.4%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   44.0%   43.9%   43.9%– 48.3%     0.0%  26–28      0.0%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   36.5%   36.6%   36.5%– 41.0%     0.0%  22–24      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   10.4%   10.4%   10.4%– 12.3%     0.0%   6– 7      0.0%
    2015-08-07 18:19:23 INFO: Error estimate: ε ≤ 4.25%.
    2015-08-07 18:19:23 INFO: 1,024 simulations out of 4,690 data points, 1 / 42,278,432,044,298,507 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:19:26 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   36.7%   36.7%   31.8%– 36.8%   99.9%  19–22
    Høyre                       31.0%   27.2%   27.2%   27.2%– 30.9%  100.0%  16–18
    Venstre                      7.9%    6.7%    6.7%    6.7%–  9.0%   19.4%   4– 5
    Miljøpartiet de Grønne       7.4%    9.5%    9.5%    4.8%–  9.6%   85.0%   3– 6
    Fremskrittspartiet           6.6%    7.4%    7.4%    7.3%–  7.8%   99.9%   4– 5
    Sosialistisk Venstreparti    4.9%    5.0%    5.0%    4.8%–  5.2%   99.1%   3– 3
    Rødt                         3.8%    3.6%    3.6%    3.6%–  4.2%   99.7%   2– 3
    Kristelig Folkeparti         2.0%    2.6%    2.6%    1.3%–  2.7%   96.6%   1– 2
    Senterpartiet                0.8%    1.0%    1.0%    1.0%–  2.1%           0– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   50.9%   55.9%   50.3%– 55.9%    99.2%  30–33     99.0%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   52.3%   52.3%   46.6%– 52.3%    80.4%  28–31     80.4%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   46.3%   46.3%   42.5%– 46.3%     0.0%  25–28      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   42.7%   42.7%   38.7%– 42.8%     0.0%  23–25      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   34.6%   34.6%   34.6%– 38.7%     0.0%  20–23      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   53.5%   53.5%   53.1%– 56.7%   100.0%  31–34    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   49.7%   45.0%   45.0%– 51.0%     3.4%  26–30      4.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   44.0%   43.9%   43.9%– 48.9%     0.1%  26–29      0.3%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   36.5%   36.6%   36.5%– 41.1%     0.0%  22–24      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   10.4%   10.4%   10.4%– 12.3%     0.0%   6– 7      0.0%
    2015-08-07 18:19:26 INFO: Error estimate: ε ≤ 4.94%.
    2015-08-07 18:19:26 INFO: 2,048 simulations out of 9,461 data points, 1 / 20,958,233,409,550,787 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:19:31 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   36.7%   36.7%   31.8%– 36.8%   99.5%  19–22
    Høyre                       31.0%   27.2%   27.2%   27.2%– 30.9%  100.0%  16–18
    Venstre                      7.9%    6.7%    6.7%    6.7%–  9.4%   23.0%   4– 6
    Miljøpartiet de Grønne       7.4%    9.5%    9.5%    4.8%–  9.6%   81.2%   3– 6
    Fremskrittspartiet           6.6%    7.4%    7.4%    6.9%–  7.8%   99.4%   4– 5
    Sosialistisk Venstreparti    4.9%    5.0%    5.0%    4.6%–  5.2%   98.5%   3– 3
    Rødt                         3.8%    3.6%    3.6%    3.6%–  4.5%   99.1%   2– 3
    Kristelig Folkeparti         2.0%    2.6%    2.6%    1.3%–  2.7%   96.7%   1– 2
    Senterpartiet                0.8%    1.0%    1.0%    0.9%–  2.1%           0– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   50.3%   55.9%   50.1%– 55.9%    99.0%  29–33     97.2%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   52.3%   52.3%   46.2%– 52.3%    76.8%  27–31     76.8%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   46.3%   46.3%   42.5%– 46.5%     0.0%  25–28      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   42.7%   42.7%   38.7%– 42.8%     0.0%  23–25      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   34.6%   34.6%   34.6%– 38.7%     0.0%  20–23      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   55.7%   53.5%   52.8%– 56.7%   100.0%  31–34    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   49.7%   45.0%   45.0%– 51.0%     5.1%  26–30      5.7%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   44.0%   43.9%   43.9%– 48.9%     0.2%  26–29      2.0%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   36.5%   36.6%   36.5%– 42.0%     0.0%  22–26      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   12.3%   10.4%   10.4%– 12.3%     0.0%   6– 7      0.0%
    2015-08-07 18:19:31 INFO: Error estimate: ε ≤ 2.79%.
    2015-08-07 18:19:31 INFO: 4,096 simulations out of 18,996 data points, 1 / 10,438,294,708,768,161 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:19:39 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   34.7%   34.7%   31.8%– 38.2%   96.1%  19–23
    Høyre                       31.0%   30.6%   30.6%   25.9%– 32.9%  100.0%  15–20
    Venstre                      7.9%    9.2%    9.2%    6.7%–  9.2%   80.7%   4– 6
    Miljøpartiet de Grønne       7.4%    8.7%    8.7%    4.8%–  9.6%   88.8%   3– 6
    Fremskrittspartiet           6.6%    5.8%    5.8%    5.2%–  9.1%   53.3%   3– 5
    Sosialistisk Venstreparti    4.9%    6.0%    6.0%    3.2%–  6.4%   73.7%   2– 4
    Rødt                         3.8%    3.0%    3.0%    3.0%–  5.8%   99.4%   2– 3
    Kristelig Folkeparti         2.0%    1.4%    1.4%    1.4%–  2.8%   98.9%   1– 2
    Senterpartiet                0.8%    0.4%    0.4%    0.4%–  1.6%           0– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   52.8%   52.8%   49.8%– 55.9%    95.9%  30–33     97.9%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   49.8%   49.8%   46.1%– 52.3%    19.2%  28–31     64.9%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   44.1%   44.1%   43.4%– 47.8%     0.0%  25–29      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   41.1%   41.1%   39.0%– 43.2%     0.0%  23–26      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   34.6%   36.4%   34.6%– 38.6%     0.0%  20–23      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   55.2%   55.7%   51.8%– 55.7%   100.0%  30–34    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   49.7%   47.4%   45.0%– 50.3%     5.0%  26–30      3.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   48.3%   47.0%   43.9%– 49.2%     1.4%  26–29      1.9%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   36.5%   41.2%   36.0%– 44.0%     0.0%  21–26      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   11.0%   11.0%   10.4%– 12.3%     0.0%   6– 7      0.0%
    2015-08-07 18:19:39 INFO: Error estimate: ε ≤ 3.38%.
    2015-08-07 18:19:39 INFO: 8,192 simulations out of 37,868 data points, 1 / 5,236,237,622,471,743 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:19:59 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   35.0%   35.0%   34.7%– 38.6%   99.8%  21–23
    Høyre                       31.0%   28.7%   28.7%   28.1%– 32.3%  100.0%  17–19
    Venstre                      7.9%    8.5%    8.5%    7.5%–  9.0%   79.7%   4– 5
    Miljøpartiet de Grønne       7.4%    8.0%    8.0%    6.0%–  8.7%   98.4%   4– 5
    Fremskrittspartiet           6.6%    7.0%    7.0%    5.3%–  7.5%   97.8%   3– 4
    Sosialistisk Venstreparti    4.9%    5.8%    5.8%    4.4%–  5.8%   98.5%   3– 4
    Rødt                         3.8%    4.0%    4.0%    2.7%–  4.3%   99.9%   2– 2
    Kristelig Folkeparti         2.0%    1.9%    1.9%    1.8%–  2.1%   99.8%   1– 1
    Senterpartiet                0.8%    0.6%    0.6%    0.6%–  1.3%           0– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   52.8%   53.4%   51.1%– 54.7%    99.8%  31–33     99.8%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   49.8%   49.4%   48.4%– 51.7%    17.9%  29–31     91.3%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   44.1%   45.4%   44.1%– 46.7%     0.0%  27–28      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   41.1%   41.4%   41.0%– 43.6%     0.0%  25–26      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   35.7%   35.7%   35.4%– 38.0%     0.0%  21–22      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   54.0%   54.0%   53.0%– 55.2%   100.0%  31–32    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   46.6%   46.6%   45.6%– 49.3%     0.3%  26–28      0.2%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   46.0%   46.0%   45.0%– 48.2%     0.1%  26–28      0.1%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   39.0%   39.0%   37.6%– 42.5%     0.0%  22–25      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   11.0%   11.0%   10.0%– 11.4%     0.0%   5– 7      0.0%
    2015-08-07 18:19:59 INFO: Error estimate: ε ≤ 1.87%.
    2015-08-07 18:19:59 INFO: 16,384 simulations out of 75,853 data points, 1 / 2,614,080,475,231,829 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:20:33 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   35.0%   35.0%   34.7%– 38.6%   99.4%  21–23
    Høyre                       31.0%   28.7%   28.7%   28.1%– 32.3%  100.0%  17–19
    Venstre                      7.9%    8.5%    8.5%    7.0%–  9.0%   72.1%   4– 5
    Miljøpartiet de Grønne       7.4%    8.0%    8.0%    6.0%–  8.7%   97.9%   4– 5
    Fremskrittspartiet           6.6%    7.0%    7.0%    4.9%–  7.5%   97.3%   3– 4
    Sosialistisk Venstreparti    4.9%    5.8%    5.8%    4.4%–  5.8%   97.5%   3– 4
    Rødt                         3.8%    4.0%    4.0%    2.7%–  4.8%   99.6%   2– 3
    Kristelig Folkeparti         2.0%    1.9%    1.9%    1.4%–  2.5%   99.8%   1– 1
    Senterpartiet                0.8%    0.6%    0.6%    0.4%–  1.3%           0– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   52.8%   53.4%   51.1%– 54.7%    99.2%  31–33     99.3%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   49.8%   49.4%   48.3%– 51.7%    25.4%  29–31     90.3%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   44.1%   45.4%   44.1%– 46.7%     0.0%  27–28      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   41.1%   41.4%   41.0%– 43.6%     0.0%  25–26      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   35.7%   35.7%   35.4%– 38.0%     0.0%  21–22      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   55.2%   54.0%   53.0%– 55.7%   100.0%  31–32    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   46.3%   46.6%   45.5%– 49.3%     0.9%  26–28      0.7%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   46.0%   46.0%   44.9%– 48.2%     0.6%  26–28      0.6%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   40.6%   39.0%   37.6%– 42.5%     0.0%  22–25      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   11.0%   11.0%   10.0%– 11.4%     0.0%   5– 7      0.0%
    2015-08-07 18:20:33 INFO: Error estimate: ε ≤ 1.51%.
    2015-08-07 18:20:33 INFO: 32,768 simulations out of 151,494 data points, 1 / 1,308,869,303,654,006 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:21:52 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   35.0%   35.0%   33.9%– 38.6%   98.9%  20–23
    Høyre                       31.0%   28.7%   28.7%   27.9%– 32.3%  100.0%  17–19
    Venstre                      7.9%    8.5%    8.5%    6.8%–  9.7%   72.1%   4– 6
    Miljøpartiet de Grønne       7.4%    8.0%    8.0%    6.0%–  8.8%   95.6%   4– 5
    Fremskrittspartiet           6.6%    7.0%    7.0%    4.8%–  7.7%   92.8%   3– 5
    Sosialistisk Venstreparti    4.9%    5.8%    5.8%    3.9%–  6.8%   96.2%   2– 4
    Rødt                         3.8%    4.0%    4.0%    2.7%–  5.0%   99.5%   2– 3
    Kristelig Folkeparti         2.0%    1.9%    1.9%    1.2%–  2.7%   99.1%   1– 2
    Senterpartiet                0.8%    0.6%    0.6%    0.4%–  1.6%           0– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   53.4%   53.4%   51.1%– 54.8%    98.8%  30–33     98.8%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   49.9%   49.4%   47.6%– 51.7%    25.6%  28–31     80.7%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   44.1%   45.4%   44.1%– 47.5%     0.0%  26–28      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   42.5%   41.4%   40.6%– 43.6%     0.0%  24–26      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   35.7%   35.7%   34.6%– 38.0%     0.0%  20–23      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   51.8%   54.0%   51.8%– 55.7%   100.0%  31–33    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   46.3%   46.6%   45.2%– 49.3%     1.3%  26–29      1.3%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   44.5%   46.0%   44.4%– 48.2%     1.0%  26–29      1.2%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   38.0%   39.0%   37.6%– 42.6%     0.0%  22–26      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   11.0%   11.0%    9.3%– 13.2%     0.0%   5– 8      0.0%
    2015-08-07 18:21:52 INFO: Error estimate: ε ≤ 1.33%.
    2015-08-07 18:21:52 INFO: 65,536 simulations out of 303,147 data points, 1 / 654,091,402,150,639 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:24:42 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   35.0%   35.0%   32.0%– 39.2%   93.6%  19–24
    Høyre                       31.0%   28.7%   28.7%   26.8%– 34.6%  100.0%  16–21
    Venstre                      7.9%    8.5%    8.5%    6.3%–  9.7%   62.0%   4– 6
    Miljøpartiet de Grønne       7.4%    8.0%    8.0%    5.8%–  8.8%   91.8%   3– 5
    Fremskrittspartiet           6.6%    7.0%    7.0%    4.8%–  8.0%   89.7%   3– 5
    Sosialistisk Venstreparti    4.9%    5.8%    5.8%    3.9%–  6.4%   94.3%   2– 4
    Rødt                         3.8%    4.0%    4.0%    2.7%–  5.0%   99.2%   2– 3
    Kristelig Folkeparti         2.0%    1.9%    1.9%    1.2%–  3.0%   99.1%   1– 2
    Senterpartiet                0.8%    0.6%    0.6%    0.4%–  1.8%           0– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   49.7%   53.4%   48.4%– 56.2%    92.4%  28–33     93.0%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   45.2%   49.4%   44.9%– 52.2%    40.2%  26–31     72.8%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   46.7%   45.4%   41.2%– 48.6%     0.0%  24–29      0.0%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   37.9%   41.4%   37.5%– 44.8%     0.0%  22–27      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   35.7%   35.7%   34.1%– 41.2%     0.0%  20–25      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   50.8%   54.0%   50.8%– 58.6%   100.0%  30–35    100.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   45.4%   46.6%   44.2%– 52.2%     7.9%  26–31      7.1%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   43.8%   46.0%   43.4%– 51.3%     6.1%  26–31      6.9%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   36.7%   39.0%   36.6%– 44.6%     0.0%  22–27      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   11.0%   11.0%    8.3%– 13.2%     0.0%   5– 8      0.0%
    2015-08-07 18:24:42 INFO: Error estimate: ε ≤ 2.10%.
    2015-08-07 18:24:42 INFO: 131,072 simulations out of 606,334 data points, 1 / 327,024,125,791,659 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:31:12 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   35.0%   35.0%   31.9%– 38.9%   92.8%  19–23
    Høyre                       31.0%   28.7%   28.7%   27.1%– 34.6%  100.0%  16–21
    Venstre                      7.9%    8.5%    8.5%    6.1%– 10.1%   68.4%   4– 6
    Miljøpartiet de Grønne       7.4%    8.0%    8.0%    5.3%–  8.7%   79.6%   3– 5
    Fremskrittspartiet           6.6%    7.0%    7.0%    4.9%–  8.2%   91.8%   3– 5
    Sosialistisk Venstreparti    4.9%    5.8%    5.8%    3.7%–  6.4%   89.4%   2– 4
    Rødt                         3.8%    4.0%    4.0%    2.7%–  5.4%   97.7%   2– 3
    Kristelig Folkeparti         2.0%    1.9%    1.9%    1.2%–  3.4%   99.1%   1– 2
    Senterpartiet                0.8%    0.6%    0.6%    0.3%–  1.7%           0– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   49.7%   53.4%   48.1%– 56.2%    83.3%  28–33     77.7%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   50.0%   49.4%   44.6%– 52.2%    27.1%  26–31     46.8%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   46.7%   45.4%   41.2%– 48.7%     0.1%  24–29      0.5%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   38.1%   41.4%   37.5%– 44.8%     0.0%  22–27      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   35.7%   35.7%   33.7%– 41.2%     0.0%  20–25      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   55.8%   54.0%   50.8%– 58.6%    99.6%  30–35     99.5%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   49.9%   46.6%   44.2%– 52.2%    22.7%  26–31     22.9%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   49.3%   46.0%   43.4%– 51.3%    14.6%  26–31     22.2%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   42.0%   39.0%   36.6%– 44.8%     0.0%  22–27      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   11.0%   11.0%    8.3%– 13.2%     0.0%   5– 8      0.0%
    2015-08-07 18:31:12 INFO: Error estimate: ε ≤ 3.66%.
    2015-08-07 18:31:12 INFO: 262,144 simulations out of 1,212,753 data points, 1 / 163,500,602,585,819 of search space size (198,285,846,287,760,000,000).
    2015-08-07 18:44:09 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   36.5%   36.5%   32.2%– 38.6%   96.0%  19–23
    Høyre                       31.0%   30.5%   30.5%   27.1%– 33.9%  100.0%  16–21
    Venstre                      7.9%    8.9%    8.9%    6.2%– 10.0%   77.2%   4– 6
    Miljøpartiet de Grønne       7.4%    6.2%    6.2%    5.6%–  8.7%   66.0%   3– 5
    Fremskrittspartiet           6.6%    6.6%    6.7%    4.8%–  8.1%   86.4%   3– 5
    Sosialistisk Venstreparti    4.9%    4.1%    4.1%    3.7%–  6.4%   85.7%   2– 4
    Rødt                         3.8%    3.7%    3.7%    2.7%–  5.4%   97.9%   2– 3
    Kristelig Folkeparti         2.0%    2.3%    2.3%    1.3%–  3.3%   97.4%   1– 2
    Senterpartiet                0.8%    0.6%    0.8%    0.3%–  1.6%           0– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   49.7%   51.4%   48.4%– 55.6%    91.0%  28–33     88.1%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   47.2%   47.6%   44.9%– 52.1%    20.6%  26–31     31.8%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   45.3%   45.1%   41.7%– 48.2%     0.1%  25–29      0.2%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   43.8%   41.4%   37.9%– 44.4%     0.0%  22–26      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   37.1%   37.1%   34.1%– 40.6%     0.0%  20–24      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   54.4%   54.5%   51.2%– 57.7%    99.8%  30–34     99.8%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   45.4%   49.0%   44.6%– 51.8%    13.2%  26–31     12.7%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   44.9%   48.3%   43.8%– 51.2%     7.6%  26–31     11.8%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   40.6%   41.6%   36.7%– 44.6%     0.0%  22–27      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   11.0%   11.9%    9.1%– 13.2%     0.0%   5– 8      0.0%
    2015-08-07 18:44:09 INFO: Error estimate: ε ≤ 1.78%.
    2015-08-07 18:44:09 INFO: 524,288 simulations out of 2,425,652 data points, 1 / 81,745,380,742,068 of search space size (198,285,846,287,760,000,000).
    2015-08-07 19:11:27 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   36.5%   35.0%   31.8%– 38.6%   94.5%  19–23
    Høyre                       31.0%   30.5%   30.5%   27.2%– 34.0%  100.0%  16–20
    Venstre                      7.9%    8.9%    8.9%    6.2%– 10.0%   62.9%   4– 6
    Miljøpartiet de Grønne       7.4%    7.8%    7.8%    5.6%–  9.2%   68.0%   3– 5
    Fremskrittspartiet           6.6%    6.9%    6.7%    5.0%–  8.4%   90.5%   3– 5
    Sosialistisk Venstreparti    4.9%    5.3%    5.3%    3.6%–  6.4%   85.5%   2– 4
    Rødt                         3.8%    3.7%    3.7%    2.7%–  5.3%   98.1%   2– 3
    Kristelig Folkeparti         2.0%    2.3%    2.3%    1.1%–  3.2%   97.7%   1– 2
    Senterpartiet                0.8%    1.0%    0.8%    0.3%–  1.6%           0– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   55.1%   51.4%   48.4%– 55.6%    87.8%  28–33     83.8%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   50.6%   47.6%   44.8%– 52.0%    22.0%  26–31     25.0%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   41.3%   45.1%   41.1%– 48.1%     0.1%  24–28      0.2%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   40.2%   41.4%   37.6%– 44.4%     0.0%  22–26      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   37.1%   37.1%   34.0%– 41.0%     0.0%  20–25      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   57.2%   54.5%   51.3%– 58.6%    99.8%  31–35     99.8%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   45.4%   49.5%   44.6%– 51.8%    16.3%  26–31     17.4%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   44.9%   48.3%   43.8%– 51.1%     8.1%  26–31     16.0%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   41.4%   41.6%   37.0%– 44.0%     0.0%  22–26      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   11.0%   11.9%    8.9%– 13.1%     0.0%   5– 8      0.0%
    2015-08-07 19:11:27 INFO: Error estimate: ε ≤ 2.56%.
    2015-08-07 19:11:27 INFO: 1,048,576 simulations out of 4,851,507 data points, 1 / 40,870,980,148,593 of search space size (198,285,846,287,760,000,000).
    2015-08-07 20:06:39 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   34.5%   34.0%   31.6%– 38.6%   94.2%  19–23
    Høyre                       31.0%   30.6%   30.6%   27.4%– 34.0%  100.0%  16–20
    Venstre                      7.9%    8.9%    8.9%    6.1%– 10.0%   60.2%   4– 6
    Miljøpartiet de Grønne       7.4%    8.0%    7.4%    5.6%–  9.2%   70.7%   3– 6
    Fremskrittspartiet           6.6%    6.9%    6.9%    5.1%–  8.4%   91.9%   3– 5
    Sosialistisk Venstreparti    4.9%    4.8%    4.8%    3.5%–  6.4%   82.7%   2– 4
    Rødt                         3.8%    4.0%    3.7%    2.7%–  5.3%   98.0%   2– 3
    Kristelig Folkeparti         2.0%    2.1%    1.9%    1.2%–  3.3%   97.6%   1– 2
    Senterpartiet                0.8%    0.8%    0.8%    0.3%–  1.6%           0– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   49.7%   51.3%   48.7%– 55.5%    88.2%  28–33     86.5%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   48.0%   47.6%   44.9%– 51.8%    16.2%  26–31     19.6%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   43.8%   43.9%   41.2%– 48.1%     0.1%  24–28      0.2%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   40.2%   41.4%   37.6%– 44.3%     0.0%  22–26      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   37.1%   37.5%   34.1%– 40.8%     0.0%  20–25      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   56.7%   55.3%   51.4%– 58.3%    99.8%  31–35     99.8%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   49.7%   49.5%   44.8%– 51.6%    15.9%  26–31     16.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   44.9%   48.0%   44.0%– 50.8%     6.6%  26–31     13.3%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   41.4%   41.6%   37.3%– 44.1%     0.0%  22–27      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   11.0%   11.0%    8.8%– 13.2%     0.0%   5– 8      0.0%
    2015-08-07 20:06:39 INFO: Error estimate: ε ≤ 0.686%.
    2015-08-07 20:06:39 INFO: 2,097,152 simulations out of 9,703,300 data points, 1 / 20,434,887,748,267 of search space size (198,285,846,287,760,000,000).
    2015-08-07 22:09:03 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                     Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Arbeiderpartiet             35.4%   34.0%   34.0%   31.7%– 38.5%   94.0%  19–23
    Høyre                       31.0%   31.6%   31.6%   27.5%– 33.9%  100.0%  16–20
    Venstre                      7.9%    8.4%    8.4%    6.1%–  9.8%   59.1%   4– 6
    Miljøpartiet de Grønne       7.4%    7.9%    7.9%    5.6%–  9.2%   71.3%   3– 6
    Fremskrittspartiet           6.6%    6.6%    6.6%    5.1%–  8.4%   92.8%   3– 5
    Sosialistisk Venstreparti    4.9%    5.3%    5.2%    3.5%–  6.6%   83.5%   2– 4
    Rødt                         3.8%    3.3%    3.5%    2.7%–  5.3%   98.0%   2– 3
    Kristelig Folkeparti         2.0%    2.1%    1.9%    1.2%–  3.2%   98.0%   1– 2
    Senterpartiet                0.8%    0.9%    0.9%    0.3%–  1.6%           0– 1
    Coalition                                                                                    Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Arbeiderpartiet + Miljøpartiet de Grønne + Rødt + Senterpartiet + Sosialistisk Venstreparti   52.1%   48.4%   51.5%   48.7%– 55.5%    89.3%  29–33     86.9%
    Arbeiderpartiet + Miljøpartiet de Grønne + Senterpartiet + Sosialistisk Venstreparti          48.4%   48.0%   48.0%   44.9%– 51.8%    18.6%  26–31     19.5%
    Arbeiderpartiet + Rødt + Senterpartiet + Sosialistisk Venstreparti                            44.8%   41.6%   43.6%   41.2%– 48.0%     0.1%  24–28      0.2%
    Arbeiderpartiet + Senterpartiet + Sosialistisk Venstreparti                                   41.0%   41.0%   40.1%   37.6%– 44.4%     0.0%  22–26      0.0%
    Fremskrittspartiet + Høyre                                                                    37.6%   36.8%   36.8%   34.1%– 40.7%     0.0%  20–25      0.0%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Miljøpartiet de Grønne + Venstre          54.9%   53.4%   56.1%   51.5%– 58.3%    99.7%  31–35     99.8%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Senterpartiet + Venstre                   48.2%   49.7%   49.1%   44.8%– 51.6%    14.3%  26–31     15.6%
    Fremskrittspartiet + Høyre + Kristelig Folkeparti + Venstre                                   47.5%   44.9%   48.2%   43.9%– 50.8%     6.0%  26–30     12.8%
    Høyre + Kristelig Folkeparti + Venstre                                                        40.9%   41.4%   41.7%   37.3%– 44.1%     0.0%  22–27      0.0%
    Kristelig Folkeparti + Senterpartiet + Venstre                                                10.6%   11.0%   11.0%    8.8%– 13.1%     0.0%   5– 8      0.0%
    2015-08-07 22:09:03 INFO: Error estimate: ε ≤ 0.960%.
    2015-08-07 22:09:03 INFO: 4,194,304 simulations out of 19,405,009 data points, 1 / 10,218,281,593,569 of search space size (198,285,846,287,760,000,000).
