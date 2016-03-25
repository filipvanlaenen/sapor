Example: Flanders
=================

The following file is a valid poll file for a Flemish poll. It is based on
the results of a poll conducted between 22 February and 9 March 2016 by TNS
Media for De Standaard and VRT.
    
    Area=BE-VLG
    Type=Election
    ==
    N-VA=274
    CD&V=192
    Open Vld=142
    sp.a=148
    Groen=117
    Vlaams Belang=81
    PVDA=40
    Other=11    

The following call will use the poll file to run an analysis, provided it has
been saved as 2016-03-09-DeStandaard-VRT.poll.

    sapor analyze 2016-03-09-DeStandaard-VRT.poll

For this file, the log will look like below.

    2016-03-25 08:57:05 INFO: Analyzing as a set of dichotomies...
    2016-03-25 08:57:05 INFO: Most probable fractions and 95% confidence intervals:
    Choice           MPF      CI(95%)     P(≥5%)
    CD&V            16.7%    0.0%– 33.3%  100.0%
    Groen           16.7%    0.0%– 33.3%  100.0%
    N-VA            16.7%    0.0%– 33.3%  100.0%
    Open Vld        16.7%    0.0%– 33.3%  100.0%
    PVDA            16.7%    0.0%– 33.3%  100.0%
    Vlaams Belang   16.7%    0.0%– 33.3%  100.0%
    sp.a            16.7%    0.0%– 33.3%  100.0%
    Other           16.7%    0.0%– 33.3%  100.0%
    2016-03-25 08:57:05 INFO: Error estimate: ε ≤ 33.3%.
    2016-03-25 08:57:05 INFO: Number of data points: 3.
    2016-03-25 08:57:05 INFO: Most probable fractions and 95% confidence intervals:
    Choice           MPF      CI(95%)     P(≥5%)
    N-VA            27.8%   22.2%– 33.3%  100.0%
    CD&V            16.7%   11.1%– 22.2%  100.0%
    Groen           16.7%   11.1%– 22.2%  100.0%
    Open Vld        16.7%   11.1%– 22.2%  100.0%
    sp.a            16.7%   11.1%– 22.2%  100.0%
    PVDA             5.6%    0.0%– 11.1%  100.0%
    Vlaams Belang    5.6%    0.0%– 11.1%  100.0%
    Other            5.6%    0.0%– 11.1%  100.0%
    2016-03-25 08:57:05 INFO: Error estimate: ε ≤ 11.1%.
    2016-03-25 08:57:05 INFO: Number of data points: 9.
    2016-03-25 08:57:05 INFO: Most probable fractions and 95% confidence intervals:
    Choice           MPF      CI(95%)     P(≥5%)
    N-VA            27.8%   22.2%– 29.6%  100.0%
    CD&V            20.4%   14.8%– 22.2%  100.0%
    Groen           13.0%    7.4%– 14.8%  100.0%
    Open Vld        13.0%   11.1%– 18.5%  100.0%
    sp.a            13.0%   11.1%– 18.5%  100.0%
    Vlaams Belang    9.3%    7.4%– 11.1%  100.0%
    PVDA             5.6%    3.7%–  7.4%   99.9%
    Other            1.9%    0.0%–  3.7%    0.0%
    2016-03-25 08:57:05 INFO: Error estimate: ε ≤ 3.70%.
    2016-03-25 08:57:05 INFO: Number of data points: 27.
    2016-03-25 08:57:06 INFO: Most probable fractions and 95% confidence intervals:
    Choice           MPF      CI(95%)     P(≥5%)
    N-VA            27.8%   24.7%– 30.9%  100.0%
    CD&V            19.1%   16.0%– 22.2%  100.0%
    Open Vld        14.2%   11.1%– 17.3%  100.0%
    sp.a            14.2%   12.3%– 17.3%  100.0%
    Groen           11.7%    9.9%– 14.8%  100.0%
    Vlaams Belang    8.0%    6.2%–  9.9%  100.0%
    PVDA             4.3%    2.5%–  6.2%    5.9%
    Other            0.6%    0.0%–  2.5%    0.0%
    2016-03-25 08:57:06 INFO: Error estimate: ε ≤ 1.23%.
    2016-03-25 08:57:06 INFO: Number of data points: 81.
    2016-03-25 08:57:08 INFO: Most probable fractions and 95% confidence intervals:
    Choice           MPF      CI(95%)     P(≥5%)
    N-VA            27.4%   24.3%– 30.5%  100.0%
    CD&V            19.1%   16.5%– 21.8%  100.0%
    sp.a            14.6%   12.3%– 17.3%  100.0%
    Open Vld        14.2%   11.9%– 16.5%  100.0%
    Groen           11.7%    9.5%– 14.0%  100.0%
    Vlaams Belang    8.0%    6.2%– 10.3%  100.0%
    PVDA             3.9%    2.9%–  5.8%    8.4%
    Other            1.0%    0.4%–  2.1%    0.0%
    2016-03-25 08:57:09 INFO: Error estimate: ε ≤ 0.412%.
    2016-03-25 08:57:09 INFO: Number of data points: 243.
    2016-03-25 08:57:15 INFO: Most probable fractions and 95% confidence intervals:
    Choice           MPF      CI(95%)     P(≥5%)
    N-VA            27.2%   24.6%– 30.2%  100.0%
    CD&V            19.1%   16.7%– 21.7%  100.0%
    sp.a            14.7%   12.6%– 17.1%  100.0%
    Open Vld        14.2%   12.1%– 16.5%  100.0%
    Groen           11.6%    9.7%– 13.9%  100.0%
    Vlaams Belang    8.0%    6.4%– 10.0%  100.0%
    PVDA             4.0%    2.9%–  5.5%    8.7%
    Other            1.0%    0.5%–  2.1%    0.0%
    2016-03-25 08:57:16 INFO: Error estimate: ε ≤ 0.137%.
    2016-03-25 08:57:16 INFO: Number of data points: 729.
    2016-03-25 08:57:37 INFO: Most probable fractions and 95% confidence intervals:
    Choice           MPF      CI(95%)     P(≥5%)
    N-VA            27.3%   24.6%– 30.1%  100.0%
    CD&V            19.1%   16.8%– 21.7%  100.0%
    sp.a            14.7%   12.7%– 17.1%  100.0%
    Open Vld        14.2%   12.1%– 16.5%  100.0%
    Groen           11.6%    9.8%– 13.8%  100.0%
    Vlaams Belang    8.1%    6.5%–  9.9%  100.0%
    PVDA             4.0%    2.9%–  5.4%    7.8%
    Other            1.1%    0.6%–  2.0%    0.0%
    2016-03-25 08:57:40 INFO: Error estimate: ε ≤ 0.046%.
    2016-03-25 08:57:40 INFO: Number of data points: 2,187.
    2016-03-25 08:57:43 INFO: Analyzing as a polychotomy...
    2016-03-25 08:57:45 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   10.6%   20.8%   20.8%– 20.9%  100.0%   39– 39
    CD&V            19.1%    6.9%   13.6%   13.6%– 13.6%  100.0%   27– 27
    sp.a            14.7%    5.0%    9.9%    9.9%–  9.9%  100.0%   19– 19
    Open Vld        14.1%    4.8%    9.4%    9.4%–  9.4%  100.0%   18– 18
    Groen           11.6%    3.7%    7.3%    7.3%–  7.4%  100.0%   14– 14
    Vlaams Belang    8.1%    2.4%    4.5%    4.5%–  4.6%  100.0%    6–  6
    PVDA             4.0%    0.9%    1.7%    1.7%–  1.7%            0–  0
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   50.0%   30.8%   30.8%– 30.8%     0.0%   60– 60      0.0%
    CD&V + N-VA               46.4%   50.0%   34.4%   34.4%– 34.4%     0.0%   66– 66    100.0%
    CD&V + N-VA + Open Vld    60.5%   50.0%   43.8%   43.8%– 43.8%     0.0%   84– 84    100.0%
    CD&V + N-VA + sp.a        61.1%   50.0%   44.3%   44.3%– 44.3%     0.0%   85– 85    100.0%
    CD&V + Open Vld           33.2%   50.0%   23.0%   23.0%– 23.0%     0.0%   45– 45      0.0%
    CD&V + Open Vld + sp.a    48.0%   50.0%   32.9%   32.9%– 32.9%     0.0%   64– 64    100.0%
    CD&V + sp.a               33.8%   50.0%   23.5%   23.5%– 23.5%     0.0%   46– 46      0.0%
    Groen + Open Vld + sp.a   40.5%   50.0%   26.6%   26.6%– 26.6%     0.0%   51– 51      0.0%
    N-VA + Vlaams Belang      35.3%   50.0%   25.4%   25.4%– 25.4%     0.0%   45– 45      0.0%
    Open Vld + sp.a           28.9%   50.0%   19.3%   19.3%– 19.3%     0.0%   37– 37      0.0%
    2016-03-25 08:57:45 INFO: Error estimate: ε ≤ 100%.
    2016-03-25 08:57:45 INFO: 1 simulations out of 1 data points, 1 / 24,300,290,385,000,000 of search space size (24,300,290,385,000,000).
    2016-03-25 08:57:46 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   22.2%   22.2%   22.1%– 22.2%  100.0%   38– 38
    CD&V            19.1%   14.7%   14.7%   14.6%– 14.7%  100.0%   27– 27
    sp.a            14.7%   10.7%   10.7%   10.7%– 10.7%  100.0%   19– 19
    Open Vld        14.1%   10.2%   10.2%   10.2%– 10.2%  100.0%   18– 18
    Groen           11.6%    7.9%    7.9%    7.9%–  8.0%  100.0%   14– 14
    Vlaams Belang    8.1%    5.1%    5.1%    5.0%–  5.1%  100.0%    7–  7
    PVDA             4.0%    1.8%    1.8%    1.7%–  1.8%            0–  0
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   66.0%   33.3%   32.1%– 33.3%     0.0%   60– 60      0.0%
    CD&V + N-VA               46.4%   67.7%   36.8%   35.6%– 36.8%     0.0%   65– 65    100.0%
    CD&V + N-VA + Open Vld    60.5%   72.7%   47.0%   45.4%– 47.0%     0.0%   83– 83    100.0%
    CD&V + N-VA + sp.a        61.1%   72.9%   47.5%   45.9%– 47.5%     0.0%   84– 84    100.0%
    CD&V + Open Vld           33.2%   61.9%   24.8%   23.9%– 24.8%     0.0%   45– 45      0.0%
    CD&V + Open Vld + sp.a    48.0%   67.1%   35.6%   34.2%– 35.6%     0.0%   64– 64    100.0%
    CD&V + sp.a               33.8%   62.1%   25.4%   24.4%– 25.4%     0.0%   46– 46      0.0%
    Groen + Open Vld + sp.a   40.5%   63.9%   28.8%   27.7%– 28.8%     0.0%   51– 51      0.0%
    N-VA + Vlaams Belang      35.3%   63.2%   27.2%   26.3%– 27.2%     0.0%   45– 45      0.0%
    Open Vld + sp.a           28.9%   60.2%   20.9%   20.1%– 20.9%     0.0%   37– 37      0.0%
    2016-03-25 08:57:46 INFO: Error estimate: ε ≤ 1.33%.
    2016-03-25 08:57:46 INFO: 2 simulations out of 2 data points, 1 / 12,150,145,192,500,000 of search space size (24,300,290,385,000,000).
    2016-03-25 08:57:47 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   24.8%   24.8%   24.8%– 24.8%  100.0%   38– 38
    CD&V            19.1%   16.8%   16.8%   16.7%– 16.8%  100.0%   25– 25
    sp.a            14.7%   12.5%   12.5%   12.4%– 12.5%  100.0%   19– 19
    Open Vld        14.1%   11.7%   11.7%   11.7%– 11.8%  100.0%   19– 19
    Groen           11.6%    9.1%    9.1%    9.1%–  9.1%  100.0%   14– 14
    Vlaams Belang    8.1%    6.1%    6.1%    6.0%–  6.1%  100.0%    8–  8
    PVDA             4.0%    1.9%    1.9%    1.8%–  1.9%            0–  0
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   68.6%   38.3%   37.1%– 38.3%     0.0%   58– 58      0.0%
    CD&V + N-VA               46.4%   70.1%   41.6%   40.4%– 41.6%     0.0%   63– 63    100.0%
    CD&V + N-VA + Open Vld    60.5%   76.0%   53.3%   51.7%– 53.3%   100.0%   82– 82    100.0%
    CD&V + N-VA + sp.a        61.1%   76.2%   54.0%   52.4%– 54.0%   100.0%   82– 82    100.0%
    CD&V + Open Vld           33.2%   63.9%   28.5%   27.6%– 28.5%     0.0%   44– 44      0.0%
    CD&V + Open Vld + sp.a    48.0%   69.9%   40.9%   39.6%– 40.9%     0.0%   63– 63    100.0%
    CD&V + sp.a               33.8%   64.1%   29.2%   28.3%– 29.2%     0.0%   44– 44      0.0%
    Groen + Open Vld + sp.a   40.5%   66.0%   33.3%   32.2%– 33.3%     0.0%   52– 52      0.0%
    N-VA + Vlaams Belang      35.3%   64.9%   30.9%   29.9%– 30.9%     0.0%   46– 46      0.0%
    Open Vld + sp.a           28.9%   61.7%   24.2%   23.4%– 24.2%     0.0%   38– 38      0.0%
    2016-03-25 08:57:47 INFO: Error estimate: ε ≤ 2.65%.
    2016-03-25 08:57:47 INFO: 4 simulations out of 4 data points, 1 / 6,075,072,596,250,000 of search space size (24,300,290,385,000,000).
    2016-03-25 08:57:48 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   28.8%   28.8%   28.8%– 28.8%  100.0%   38– 38
    CD&V            19.1%   19.9%   19.9%   19.9%– 19.9%  100.0%   26– 26
    sp.a            14.7%   15.1%   15.1%   15.0%– 15.1%  100.0%   19– 19
    Open Vld        14.1%   14.1%   14.1%   14.0%– 14.1%  100.0%   19– 19
    Groen           11.6%   10.9%   10.9%   10.9%– 10.9%  100.0%   14– 14
    Vlaams Belang    8.1%    7.6%    7.6%    7.5%–  7.6%  100.0%    8–  8
    PVDA             4.0%    2.0%    2.0%    2.0%–  2.0%            0–  0
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   72.3%   45.9%   44.6%– 45.9%     0.0%   59– 59      0.0%
    CD&V + N-VA               46.4%   73.8%   48.7%   47.5%– 48.7%     0.0%   64– 64    100.0%
    CD&V + N-VA + Open Vld    60.5%   80.5%   62.8%   61.2%– 62.8%   100.0%   83– 83    100.0%
    CD&V + N-VA + sp.a        61.1%   81.2%   63.8%   62.1%– 63.8%   100.0%   83– 83    100.0%
    CD&V + Open Vld           33.2%   33.8%   34.0%   33.1%– 34.3%     0.0%   45– 45      0.0%
    CD&V + Open Vld + sp.a    48.0%   73.8%   49.0%   47.7%– 49.0%     0.0%   64– 64    100.0%
    CD&V + sp.a               33.8%   67.1%   35.0%   34.0%– 35.0%     0.0%   45– 45      0.0%
    Groen + Open Vld + sp.a   40.5%   40.7%   40.0%   38.9%– 42.4%     0.0%   52– 52      0.0%
    N-VA + Vlaams Belang      35.3%   68.0%   36.4%   35.9%– 36.4%     0.0%   46– 46      0.0%
    Open Vld + sp.a           28.9%   28.8%   29.1%   28.3%– 29.4%     0.0%   38– 38      0.0%
    2016-03-25 08:57:48 INFO: Error estimate: ε ≤ 3.98%.
    2016-03-25 08:57:48 INFO: 8 simulations out of 14 data points, 1 / 1,735,735,027,500,000 of search space size (24,300,290,385,000,000).
    2016-03-25 08:57:49 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   28.8%   28.8%   28.8%– 28.8%  100.0%   38– 38
    CD&V            19.1%   19.9%   19.9%   19.9%– 19.9%  100.0%   26– 26
    sp.a            14.7%   15.1%   15.1%   15.0%– 15.1%  100.0%   19– 19
    Open Vld        14.1%   14.1%   14.1%   14.0%– 14.1%  100.0%   19– 19
    Groen           11.6%   10.9%   10.9%   10.9%– 10.9%  100.0%   14– 14
    Vlaams Belang    8.1%    7.6%    7.6%    7.5%–  7.6%  100.0%    8–  8
    PVDA             4.0%    2.0%    2.0%    2.0%–  2.0%            0–  0
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   45.9%   45.9%   45.7%– 46.0%     0.0%   59– 59      0.0%
    CD&V + N-VA               46.4%   48.3%   48.7%   47.5%– 48.9%     0.0%   64– 64    100.0%
    CD&V + N-VA + Open Vld    60.5%   62.6%   62.8%   61.8%– 63.1%   100.0%   83– 83    100.0%
    CD&V + N-VA + sp.a        61.1%   64.1%   63.8%   63.2%– 64.8%   100.0%   83– 83    100.0%
    CD&V + Open Vld           33.2%   34.0%   34.0%   33.5%– 34.3%     0.0%   45– 45      0.0%
    CD&V + Open Vld + sp.a    48.0%   49.1%   49.0%   48.3%– 49.7%     0.0%   64– 64    100.0%
    CD&V + sp.a               33.8%   35.5%   35.0%   35.0%– 35.9%     0.0%   45– 45      0.0%
    Groen + Open Vld + sp.a   40.5%   40.3%   40.0%   39.3%– 41.0%     0.0%   52– 52      0.0%
    N-VA + Vlaams Belang      35.3%   36.6%   36.4%   36.2%– 36.7%     0.0%   46– 46      0.0%
    Open Vld + sp.a           28.9%   29.1%   29.1%   29.0%– 29.2%     0.0%   38– 38      0.0%
    2016-03-25 08:57:49 INFO: Error estimate: ε ≤ 4.80%.
    2016-03-25 08:57:49 INFO: 16 simulations out of 27 data points, 1 / 900,010,755,000,000 of search space size (24,300,290,385,000,000).
    2016-03-25 08:57:50 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   28.8%   28.8%   28.8%– 28.8%  100.0%   38– 38
    CD&V            19.1%   19.9%   19.9%   19.9%– 19.9%  100.0%   26– 26
    sp.a            14.7%   15.1%   15.1%   15.0%– 15.1%  100.0%   19– 19
    Open Vld        14.1%   14.1%   14.1%   14.0%– 14.1%  100.0%   19– 19
    Groen           11.6%   10.9%   10.9%   10.9%– 10.9%  100.0%   14– 14
    Vlaams Belang    8.1%    7.6%    7.6%    7.5%–  7.6%  100.0%    8–  8
    PVDA             4.0%    2.0%    2.0%    2.0%–  2.0%            0–  0
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   45.9%   45.9%   45.7%– 46.0%     0.0%   59– 59      0.0%
    CD&V + N-VA               46.4%   48.7%   48.7%   48.5%– 48.9%     0.0%   64– 64    100.0%
    CD&V + N-VA + Open Vld    60.5%   62.8%   62.8%   62.3%– 63.1%   100.0%   83– 83    100.0%
    CD&V + N-VA + sp.a        61.1%   63.9%   63.8%   63.2%– 64.3%   100.0%   83– 83    100.0%
    CD&V + Open Vld           33.2%   34.0%   34.0%   33.5%– 34.3%     0.0%   45– 45      0.0%
    CD&V + Open Vld + sp.a    48.0%   49.1%   49.0%   48.8%– 49.6%     0.0%   64– 64    100.0%
    CD&V + sp.a               33.8%   35.3%   35.0%   35.0%– 35.5%     0.0%   45– 45      0.0%
    Groen + Open Vld + sp.a   40.5%   40.5%   40.0%   40.0%– 40.9%     0.0%   52– 52      0.0%
    N-VA + Vlaams Belang      35.3%   36.4%   36.4%   36.2%– 36.6%     0.0%   46– 46      0.0%
    Open Vld + sp.a           28.9%   29.1%   29.1%   29.0%– 29.2%     0.0%   38– 38      0.0%
    2016-03-25 08:57:50 INFO: Error estimate: ε ≤ 4.12%.
    2016-03-25 08:57:50 INFO: 32 simulations out of 74 data points, 1 / 328,382,302,500,000 of search space size (24,300,290,385,000,000).
    2016-03-25 08:57:51 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   24.6%   24.6%   24.6%– 24.6%  100.0%   32– 32
    CD&V            19.1%   22.2%   22.2%   19.9%– 22.3%   99.4%   26– 31
    sp.a            14.7%   15.4%   15.4%   15.4%– 15.5%  100.0%   19– 19
    Open Vld        14.1%   14.0%   14.0%   14.0%– 14.0%  100.0%   18– 18
    Groen           11.6%   12.0%   12.0%   11.6%– 12.0%  100.0%   15– 16
    Vlaams Belang    8.1%    7.9%    7.9%    7.9%–  7.9%  100.0%    8–  8
    PVDA             4.0%    2.8%    2.8%    2.7%–  2.8%            0–  0
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   49.6%   49.6%   49.6%– 49.6%     0.0%   65– 66     97.6%
    CD&V + N-VA               46.4%   47.0%   46.8%   46.6%– 47.1%     0.0%   63– 63     99.4%
    CD&V + N-VA + Open Vld    60.5%   60.8%   60.8%   60.7%– 60.9%   100.0%   81– 81    100.0%
    CD&V + N-VA + sp.a        61.1%   62.3%   62.3%   62.1%– 62.4%   100.0%   82– 82    100.0%
    CD&V + Open Vld           33.2%   36.3%   36.3%   33.7%– 36.4%     0.0%   45– 49      0.0%
    CD&V + Open Vld + sp.a    48.0%   52.4%   51.7%   50.8%– 52.8%    97.6%   68– 68    100.0%
    CD&V + sp.a               33.8%   37.7%   37.7%   37.3%– 37.8%     0.0%   50– 50      0.0%
    Groen + Open Vld + sp.a   40.5%   41.1%   41.4%   40.7%– 41.5%     0.0%   53– 53      0.0%
    N-VA + Vlaams Belang      35.3%   32.5%   32.5%   32.4%– 32.6%     0.0%   40– 40      0.0%
    Open Vld + sp.a           28.9%   29.5%   29.4%   29.4%– 29.6%     0.0%   37– 38      0.0%
    2016-03-25 08:57:51 INFO: Error estimate: ε ≤ 4.21%.
    2016-03-25 08:57:51 INFO: 64 simulations out of 167 data points, 1 / 145,510,720,868,263 of search space size (24,300,290,385,000,000).
    2016-03-25 08:57:53 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   24.6%   24.6%   24.6%– 26.6%  100.0%   32– 37
    CD&V            19.1%   16.1%   22.2%   16.1%– 22.3%   51.1%   20– 31
    sp.a            14.7%   15.4%   15.4%   15.4%– 17.9%  100.0%   19– 23
    Open Vld        14.1%   14.0%   14.0%   14.0%– 14.9%  100.0%   18– 19
    Groen           11.6%   12.0%   12.0%   11.9%– 12.0%  100.0%   15– 16
    Vlaams Belang    8.1%    7.9%    7.9%    7.3%–  7.9%  100.0%    8–  8
    PVDA             4.0%    4.2%    2.8%    2.7%–  4.3%            0–  2
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   49.6%   49.6%   45.9%– 49.6%     0.0%   58– 66     49.9%
    CD&V + N-VA               46.4%   46.9%   46.8%   42.6%– 47.0%     0.2%   57– 63     51.1%
    CD&V + N-VA + Open Vld    60.5%   57.6%   60.8%   57.5%– 60.9%   100.0%   76– 81    100.0%
    CD&V + N-VA + sp.a        61.1%   62.3%   62.3%   60.4%– 62.4%   100.0%   80– 82    100.0%
    CD&V + Open Vld           33.2%   36.3%   36.3%   30.9%– 36.4%     0.0%   39– 49      0.0%
    CD&V + Open Vld + sp.a    48.0%   51.7%   51.7%   48.8%– 51.7%    49.9%   62– 68     51.1%
    CD&V + sp.a               33.8%   37.7%   37.7%   33.9%– 37.8%     0.0%   43– 50      0.0%
    Groen + Open Vld + sp.a   40.5%   44.6%   41.4%   41.4%– 44.7%     0.0%   53– 57      0.0%
    N-VA + Vlaams Belang      35.3%   32.5%   32.5%   32.4%– 34.0%     0.0%   40– 45      0.0%
    Open Vld + sp.a           28.9%   29.5%   29.4%   29.4%– 32.9%     0.0%   37– 42      0.0%
    2016-03-25 08:57:53 INFO: Error estimate: ε ≤ 6.13%.
    2016-03-25 08:57:53 INFO: 128 simulations out of 336 data points, 1 / 72,322,292,812,500 of search space size (24,300,290,385,000,000).
    2016-03-25 08:57:54 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   24.6%   24.6%   24.6%– 29.5%  100.0%   32– 41
    CD&V            19.1%   16.1%   22.2%   16.1%– 22.3%   56.9%   20– 31
    sp.a            14.7%   15.4%   15.4%   12.1%– 17.9%   95.1%   15– 23
    Open Vld        14.1%   14.0%   14.0%   12.4%– 14.9%   99.4%   18– 19
    Groen           11.6%   12.0%   12.0%   11.9%– 12.7%  100.0%   15– 17
    Vlaams Belang    8.1%    7.9%    7.9%    6.4%–  7.9%  100.0%    6–  8
    PVDA             4.0%    4.2%    2.8%    2.7%–  5.7%            0–  5
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   49.6%   49.6%   45.9%– 49.6%     0.0%   56– 66     44.7%
    CD&V + N-VA               46.4%   46.8%   46.8%   42.6%– 50.8%     4.4%   57– 68     49.8%
    CD&V + N-VA + Open Vld    60.5%   60.8%   60.8%   57.5%– 63.9%   100.0%   76– 86    100.0%
    CD&V + N-VA + sp.a        61.1%   60.5%   62.3%   60.4%– 62.8%   100.0%   79– 83    100.0%
    CD&V + Open Vld           33.2%   36.3%   36.3%   30.1%– 36.4%     0.0%   39– 49      0.0%
    CD&V + Open Vld + sp.a    48.0%   51.7%   51.7%   46.0%– 51.7%    44.0%   59– 68     45.7%
    CD&V + sp.a               33.8%   37.7%   37.7%   33.2%– 37.8%     0.0%   41– 50      0.0%
    Groen + Open Vld + sp.a   40.5%   41.4%   41.4%   38.0%– 44.7%     0.0%   50– 57      0.0%
    N-VA + Vlaams Belang      35.3%   32.4%   32.5%   32.4%– 35.9%     0.0%   40– 47      0.0%
    Open Vld + sp.a           28.9%   32.8%   29.4%   25.3%– 32.9%     0.0%   33– 42      0.0%
    2016-03-25 08:57:54 INFO: Error estimate: ε ≤ 4.62%.
    2016-03-25 08:57:54 INFO: 256 simulations out of 716 data points, 1 / 33,938,953,051,676 of search space size (24,300,290,385,000,000).
    2016-03-25 08:57:55 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   24.6%   24.6%   24.6%– 29.5%  100.0%   32– 41
    CD&V            19.1%   16.1%   22.2%   16.1%– 22.3%   60.5%   20– 31
    sp.a            14.7%   15.4%   15.4%   12.1%– 17.9%   94.5%   15– 23
    Open Vld        14.1%   14.0%   14.0%   12.4%– 14.9%   98.6%   18– 20
    Groen           11.6%   12.0%   12.0%   11.9%– 13.8%   99.8%   15– 18
    Vlaams Belang    8.1%    7.9%    7.9%    6.1%–  7.9%  100.0%    6–  8
    PVDA             4.0%    4.2%    2.8%    2.7%–  5.7%            0–  5
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   46.0%   49.6%   45.9%– 49.6%     0.0%   56– 66     41.7%
    CD&V + N-VA               46.4%   46.8%   46.8%   42.6%– 50.8%     4.0%   56– 68     46.4%
    CD&V + N-VA + Open Vld    60.5%   57.5%   60.8%   57.5%– 63.9%   100.0%   76– 86    100.0%
    CD&V + N-VA + sp.a        61.1%   62.2%   62.3%   59.6%– 62.8%   100.0%   75– 83    100.0%
    CD&V + Open Vld           33.2%   36.3%   36.3%   30.1%– 36.4%     0.0%   39– 49      0.0%
    CD&V + Open Vld + sp.a    48.0%   51.7%   51.7%   46.1%– 51.7%    40.5%   59– 68     42.9%
    CD&V + sp.a               33.8%   37.7%   37.7%   32.3%– 37.8%     0.0%   39– 50      0.0%
    Groen + Open Vld + sp.a   40.5%   44.7%   41.4%   38.0%– 44.7%     0.0%   50– 57      0.0%
    N-VA + Vlaams Belang      35.3%   32.4%   32.5%   32.4%– 35.9%     0.0%   40– 47      0.0%
    Open Vld + sp.a           28.9%   32.7%   29.4%   25.4%– 32.7%     0.0%   33– 42      0.0%
    2016-03-25 08:57:55 INFO: Error estimate: ε ≤ 4.89%.
    2016-03-25 08:57:55 INFO: 512 simulations out of 1,433 data points, 1 / 16,957,634,602,233 of search space size (24,300,290,385,000,000).
    2016-03-25 08:57:58 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   27.0%   27.0%   23.3%– 29.5%  100.0%   32– 41
    CD&V            19.1%   17.6%   17.6%   16.1%– 22.3%   84.9%   20– 31
    sp.a            14.7%   14.2%   14.2%   14.0%– 17.9%   56.6%   18– 23
    Open Vld        14.1%   16.3%   16.3%   12.1%– 16.4%   98.8%   15– 22
    Groen           11.6%   12.4%   12.4%   10.9%– 13.8%   99.9%   14– 18
    Vlaams Belang    8.1%    6.9%    6.9%    6.1%–  8.8%  100.0%    6– 10
    PVDA             4.0%    3.8%    3.8%    2.7%–  5.7%            0–  5
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   44.1%   44.1%   43.0%– 49.6%     0.0%   54– 66     23.9%
    CD&V + N-VA               46.4%   44.6%   44.6%   42.6%– 48.7%     1.5%   56– 64     20.7%
    CD&V + N-VA + Open Vld    60.5%   60.9%   60.9%   57.5%– 62.0%   100.0%   76– 83    100.0%
    CD&V + N-VA + sp.a        61.1%   58.7%   58.7%   58.7%– 62.9%   100.0%   75– 83    100.0%
    CD&V + Open Vld           33.2%   34.8%   34.0%   29.9%– 36.3%     0.0%   38– 49      0.0%
    CD&V + Open Vld + sp.a    48.0%   51.7%   48.1%   45.8%– 51.7%    23.6%   58– 68     24.6%
    CD&V + sp.a               33.8%   37.7%   31.8%   31.8%– 37.7%     0.0%   39– 50      0.0%
    Groen + Open Vld + sp.a   40.5%   42.9%   42.9%   38.2%– 44.7%     0.0%   49– 57      0.0%
    N-VA + Vlaams Belang      35.3%   33.8%   33.8%   30.9%– 37.3%     0.0%   40– 48      0.0%
    Open Vld + sp.a           28.9%   30.5%   30.5%   26.4%– 32.7%     0.0%   33– 42      0.0%
    2016-03-25 08:57:58 INFO: Error estimate: ε ≤ 4.62%.
    2016-03-25 08:57:58 INFO: 1,024 simulations out of 2,870 data points, 1 / 8,467,000,134,146 of search space size (24,300,290,385,000,000).
    2016-03-25 08:58:03 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   27.0%   27.0%   24.6%– 28.3%  100.0%   32– 39
    CD&V            19.1%   19.5%   19.5%   16.1%– 22.3%   96.7%   20– 31
    sp.a            14.7%   14.2%   14.2%   12.3%– 17.9%   16.7%   16– 23
    Open Vld        14.1%   14.3%   14.3%   12.1%– 16.4%   99.6%   15– 22
    Groen           11.6%   11.3%   11.3%   10.9%– 12.7%   97.8%   14– 17
    Vlaams Belang    8.1%    9.9%    9.9%    6.9%–  9.9%  100.0%    7– 11
    PVDA             4.0%    3.1%    3.1%    2.7%–  4.7%            0–  2
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   44.9%   44.9%   44.1%– 49.6%     0.0%   56– 66      5.2%
    CD&V + N-VA               46.4%   46.4%   46.4%   42.7%– 48.8%     0.4%   57– 66      9.6%
    CD&V + N-VA + Open Vld    60.5%   60.7%   60.7%   57.5%– 61.1%   100.0%   76– 81    100.0%
    CD&V + N-VA + sp.a        61.1%   58.7%   60.6%   58.7%– 62.5%   100.0%   77– 82    100.0%
    CD&V + Open Vld           33.2%   33.7%   33.7%   31.0%– 36.3%     0.0%   39– 49      0.0%
    CD&V + Open Vld + sp.a    48.0%   47.9%   47.9%   45.1%– 51.7%     5.7%   57– 68     78.4%
    CD&V + sp.a               33.8%   33.6%   33.6%   31.8%– 37.7%     0.0%   40– 50      0.0%
    Groen + Open Vld + sp.a   40.5%   39.7%   39.7%   37.7%– 44.7%     0.0%   49– 57      0.0%
    N-VA + Vlaams Belang      35.3%   33.8%   36.8%   32.5%– 37.7%     0.0%   40– 49      0.0%
    Open Vld + sp.a           28.9%   28.4%   28.4%   24.7%– 32.7%     0.0%   32– 42      0.0%
    2016-03-25 08:58:03 INFO: Error estimate: ε ≤ 2.97%.
    2016-03-25 08:58:03 INFO: 2,048 simulations out of 5,813 data points, 1 / 4,180,335,521,245 of search space size (24,300,290,385,000,000).
    2016-03-25 08:58:08 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   27.8%   25.4%   25.1%– 29.7%  100.0%   33– 39
    CD&V            19.1%   20.1%   20.1%   17.3%– 21.6%   98.8%   21– 28
    sp.a            14.7%   15.5%   16.8%   13.0%– 16.8%   66.2%   16– 23
    Open Vld        14.1%   13.4%   13.4%   12.0%– 16.4%   99.3%   15– 22
    Groen           11.6%   12.2%   12.2%   10.9%– 12.6%   99.2%   14– 17
    Vlaams Belang    8.1%    9.2%    7.2%    6.6%–  9.9%  100.0%    7– 11
    PVDA             4.0%    3.1%    4.0%    3.1%–  5.1%            0–  3
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   44.9%   49.0%   43.0%– 49.1%     0.0%   56– 63     29.9%
    CD&V + N-VA               46.4%   46.4%   45.5%   43.1%– 47.5%     0.1%   56– 63      4.4%
    CD&V + N-VA + Open Vld    60.5%   60.9%   59.0%   58.0%– 61.9%   100.0%   76– 81    100.0%
    CD&V + N-VA + sp.a        61.1%   60.6%   62.3%   57.4%– 63.8%   100.0%   75– 82    100.0%
    CD&V + Open Vld           33.2%   33.6%   33.5%   31.0%– 36.3%     0.0%   39– 47      0.0%
    CD&V + Open Vld + sp.a    48.0%   47.9%   50.3%   46.2%– 50.3%    29.6%   59– 66     57.1%
    CD&V + sp.a               33.8%   36.9%   36.9%   31.7%– 36.9%     0.0%   40– 48      0.0%
    Groen + Open Vld + sp.a   40.5%   39.7%   42.4%   38.4%– 43.0%     0.0%   49– 56      0.0%
    N-VA + Vlaams Belang      35.3%   37.1%   32.7%   32.7%– 37.3%     0.0%   41– 48      0.0%
    Open Vld + sp.a           28.9%   28.4%   30.2%   27.8%– 30.5%     0.0%   35– 41      0.0%
    2016-03-25 08:58:08 INFO: Error estimate: ε ≤ 2.61%.
    2016-03-25 08:58:08 INFO: 4,096 simulations out of 11,590 data points, 1 / 2,096,660,084,987 of search space size (24,300,290,385,000,000).
    2016-03-25 08:58:18 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   27.8%   25.4%   24.6%– 29.7%  100.0%   32– 40
    CD&V            19.1%   20.1%   19.5%   16.6%– 21.8%   98.8%   20– 29
    sp.a            14.7%   15.5%   14.2%   11.8%– 17.3%   64.8%   15– 23
    Open Vld        14.1%   14.3%   14.3%   12.0%– 16.5%   98.8%   15– 22
    Groen           11.6%   12.2%   12.2%   10.4%– 12.8%   99.3%   14– 17
    Vlaams Belang    8.1%    9.2%    7.2%    6.2%–  9.9%  100.0%    6– 11
    PVDA             4.0%    3.1%    4.0%    3.1%–  5.6%            0–  4
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   44.9%   49.0%   41.9%– 49.1%     0.1%   54– 64     22.6%
    CD&V + N-VA               46.4%   46.4%   45.5%   43.0%– 49.9%     0.6%   56– 66     13.1%
    CD&V + N-VA + Open Vld    60.5%   62.2%   59.0%   57.6%– 62.3%   100.0%   75– 83    100.0%
    CD&V + N-VA + sp.a        61.1%   60.6%   60.6%   57.4%– 63.9%   100.0%   75– 85    100.0%
    CD&V + Open Vld           33.2%   33.7%   33.7%   31.0%– 36.3%     0.0%   40– 48      0.0%
    CD&V + Open Vld + sp.a    48.0%   47.9%   50.3%   44.3%– 50.9%    27.6%   57– 66     55.6%
    CD&V + sp.a               33.8%   36.9%   36.9%   29.8%– 37.1%     0.0%   37– 48      0.0%
    Groen + Open Vld + sp.a   40.5%   39.7%   42.4%   36.9%– 44.1%     0.0%   49– 57      0.0%
    N-VA + Vlaams Belang      35.3%   37.1%   32.7%   32.4%– 38.3%     0.0%   40– 49      0.0%
    Open Vld + sp.a           28.9%   28.4%   30.2%   26.3%– 32.4%     0.0%   34– 43      0.0%
    2016-03-25 08:58:18 INFO: Error estimate: ε ≤ 2.38%.
    2016-03-25 08:58:18 INFO: 8,192 simulations out of 23,308 data points, 1 / 1,042,572,952,849 of search space size (24,300,290,385,000,000).
    2016-03-25 08:58:44 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   27.3%   27.3%   24.5%– 30.7%  100.0%   32– 40
    CD&V            19.1%   19.4%   19.4%   16.6%– 21.6%   99.3%   20– 29
    sp.a            14.7%   14.9%   14.9%   12.0%– 17.3%   74.4%   15– 23
    Open Vld        14.1%   13.9%   13.9%   11.8%– 16.4%   98.9%   14– 22
    Groen           11.6%   10.5%   10.5%   10.5%– 12.8%   99.6%   14– 17
    Vlaams Belang    8.1%    9.3%    9.3%    6.2%–  9.9%  100.0%    6– 11
    PVDA             4.0%    3.5%    3.5%    3.1%–  5.4%            0–  4
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   42.5%   44.9%   41.9%– 49.0%     0.0%   54– 65     11.5%
    CD&V + N-VA               46.4%   45.4%   46.7%   43.1%– 49.3%     0.6%   56– 66     17.3%
    CD&V + N-VA + Open Vld    60.5%   58.7%   60.6%   57.6%– 62.8%   100.0%   76– 83    100.0%
    CD&V + N-VA + sp.a        61.1%   61.6%   61.6%   57.6%– 63.8%   100.0%   75– 85    100.0%
    CD&V + Open Vld           33.2%   33.2%   33.3%   30.4%– 35.8%     0.0%   40– 47      0.0%
    CD&V + Open Vld + sp.a    48.0%   47.9%   48.2%   44.6%– 50.9%    14.8%   57– 67     60.9%
    CD&V + sp.a               33.8%   36.9%   34.3%   30.5%– 37.6%     0.0%   39– 50      0.0%
    Groen + Open Vld + sp.a   40.5%   39.7%   39.3%   37.4%– 43.4%     0.0%   47– 58      0.0%
    N-VA + Vlaams Belang      35.3%   36.6%   36.6%   32.4%– 38.6%     0.0%   40– 48      0.0%
    Open Vld + sp.a           28.9%   28.4%   28.8%   26.3%– 32.4%     0.0%   33– 43      0.0%
    2016-03-25 08:58:44 INFO: Error estimate: ε ≤ 2.06%.
    2016-03-25 08:58:44 INFO: 16,384 simulations out of 46,629 data points, 1 / 521,141,143,602 of search space size (24,300,290,385,000,000).
    2016-03-25 08:59:37 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   27.3%   27.3%   24.6%– 30.7%  100.0%   33– 40
    CD&V            19.1%   19.1%   19.0%   16.9%– 21.3%   99.7%   21– 28
    sp.a            14.7%   15.4%   15.4%   12.5%– 16.8%   66.4%   15– 22
    Open Vld        14.1%   14.7%   14.7%   12.1%– 16.3%   96.8%   15– 22
    Groen           11.6%   10.5%   10.5%    9.8%– 13.5%   99.7%   14– 17
    Vlaams Belang    8.1%    7.9%    7.9%    6.6%–  9.9%  100.0%    6– 11
    PVDA             4.0%    4.1%    4.1%    3.1%–  5.3%            0–  3
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   42.5%   45.0%   42.5%– 49.0%     0.0%   54– 63      5.1%
    CD&V + N-VA               46.4%   46.1%   46.4%   43.3%– 49.6%     0.6%   57– 65     13.4%
    CD&V + N-VA + Open Vld    60.5%   58.7%   61.1%   57.9%– 62.8%   100.0%   76– 83    100.0%
    CD&V + N-VA + sp.a        61.1%   61.6%   61.8%   58.2%– 64.1%   100.0%   76– 84    100.0%
    CD&V + Open Vld           33.2%   33.7%   33.7%   30.4%– 36.3%     0.0%   40– 48      0.0%
    CD&V + Open Vld + sp.a    48.0%   47.9%   49.2%   45.2%– 50.9%     8.8%   58– 67     71.8%
    CD&V + sp.a               33.8%   34.5%   34.5%   30.7%– 36.9%     0.0%   39– 48      0.0%
    Groen + Open Vld + sp.a   40.5%   39.7%   40.6%   37.6%– 43.0%     0.0%   49– 57      0.0%
    N-VA + Vlaams Belang      35.3%   35.5%   35.2%   32.5%– 38.4%     0.0%   41– 48      0.0%
    Open Vld + sp.a           28.9%   30.1%   30.1%   26.1%– 31.7%     0.0%   33– 42      0.0%
    2016-03-25 08:59:37 INFO: Error estimate: ε ≤ 1.42%.
    2016-03-25 08:59:37 INFO: 32,768 simulations out of 93,214 data points, 1 / 260,693,569,475 of search space size (24,300,290,385,000,000).
    2016-03-25 09:01:20 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice         Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    N-VA            27.3%   27.3%   27.3%   24.6%– 30.4%  100.0%   33– 40
    CD&V            19.1%   19.1%   19.0%   16.6%– 21.3%   98.8%   21– 28
    sp.a            14.7%   15.4%   15.4%   12.3%– 17.1%   69.6%   15– 23
    Open Vld        14.1%   14.7%   14.7%   12.0%– 16.2%   94.0%   15– 22
    Groen           11.6%   10.5%   10.5%    9.7%– 13.9%   99.5%   13– 17
    Vlaams Belang    8.1%    7.9%    7.9%    6.4%–  9.9%  100.0%    6– 11
    PVDA             4.0%    4.1%    4.1%    2.9%–  5.3%            0–  3
    Coalition                Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    CD&V + Groen + sp.a       45.5%   46.6%   45.0%   42.5%– 49.0%     0.0%   54– 64      6.9%
    CD&V + N-VA               46.4%   46.1%   46.4%   42.9%– 49.6%     0.8%   56– 66     12.9%
    CD&V + N-VA + Open Vld    60.5%   59.0%   61.1%   57.4%– 63.1%   100.0%   75– 84    100.0%
    CD&V + N-VA + sp.a        61.1%   61.6%   61.8%   57.8%– 64.0%   100.0%   75– 84    100.0%
    CD&V + Open Vld           33.2%   33.7%   33.7%   30.4%– 36.4%     0.0%   40– 48      0.0%
    CD&V + Open Vld + sp.a    48.0%   45.6%   49.2%   44.5%– 51.2%     9.9%   58– 67     57.6%
    CD&V + sp.a               33.8%   34.5%   34.5%   30.3%– 37.4%     0.0%   39– 48      0.0%
    Groen + Open Vld + sp.a   40.5%   39.7%   40.6%   37.6%– 43.7%     0.0%   48– 58      0.0%
    N-VA + Vlaams Belang      35.3%   35.5%   35.2%   32.5%– 38.4%     0.0%   41– 48      0.0%
    Open Vld + sp.a           28.9%   30.1%   30.1%   26.2%– 32.0%     0.0%   33– 43      0.0%
    2016-03-25 09:01:20 INFO: Error estimate: ε ≤ 1.78%.
    2016-03-25 09:01:20 INFO: 65,536 simulations out of 187,092 data points, 1 / 129,884,176,688 of search space size (24,300,290,385,000,000).
