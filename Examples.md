Examples
========

The following file is a valid poll file for a Catalan poll. It is based on
the results of a poll done from 1–3 July 2015 by GAPS for Òmnium Cultural.

    Area=ES-CT
    ==
    Junts pel Sí=262
    Catalunya Sí que es Pot=164
    Ciutadans-Partido de la Ciudadanía=131
    Partit dels Socialistes de Catalunya=74
    Partit Popular de Catalunya=74
    Candidatura d'Unitat Popular – Alternativa d'Esquerres=66
    Unió Democràtica de Catalunya=33
    Other=16

The following call will use the poll file to run an analysis.

    sapor analyze ÒmniumCultural-GAPS-20150703.poll

For this file, the log will look like below.

    2015-08-01 09:32:05 INFO: Analyzing as a set of dichotomies...
    2015-08-01 09:32:05 INFO: Most probable fractions and 95% confidence intervals:
    Choice                                                    MPF      CI(95%)     P(≥3%)
    Junts pel Sí                                             50.0%    0.0%– 66.7%  100.0%
    Candidatura d'Unitat Popular – Alternativa d'Esquerres   16.7%    0.0%– 33.3%  100.0%
    Catalunya Sí que es Pot                                  16.7%    0.0%– 33.3%  100.0%
    Ciutadans-Partido de la Ciudadanía                       16.7%    0.0%– 33.3%  100.0%
    Partit Popular de Catalunya                              16.7%    0.0%– 33.3%  100.0%
    Partit dels Socialistes de Catalunya                     16.7%    0.0%– 33.3%  100.0%
    Unió Democràtica de Catalunya                            16.7%    0.0%– 33.3%  100.0%
    Other                                                    16.7%    0.0%– 33.3%  100.0%
    2015-08-01 09:32:05 INFO: Error estimate: ε ≤ 33.3%.
    2015-08-01 09:32:05 INFO: Number of data points: 3.
    2015-08-01 09:32:05 INFO: Most probable fractions and 95% confidence intervals:
    Choice                                                    MPF      CI(95%)     P(≥3%)
    Junts pel Sí                                             27.8%   22.2%– 33.3%  100.0%
    Catalunya Sí que es Pot                                  16.7%   11.1%– 22.2%  100.0%
    Ciutadans-Partido de la Ciudadanía                       16.7%   11.1%– 22.2%  100.0%
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    5.6%    0.0%– 11.1%  100.0%
    Partit Popular de Catalunya                               5.6%    0.0%– 11.1%  100.0%
    Partit dels Socialistes de Catalunya                      5.6%    0.0%– 11.1%  100.0%
    Unió Democràtica de Catalunya                             5.6%    0.0%– 11.1%  100.0%
    Other                                                     5.6%    0.0%– 11.1%  100.0%
    2015-08-01 09:32:05 INFO: Error estimate: ε ≤ 11.1%.
    2015-08-01 09:32:05 INFO: Number of data points: 9.
    2015-08-01 09:32:05 INFO: Most probable fractions and 95% confidence intervals:
    Choice                                                    MPF      CI(95%)     P(≥3%)
    Junts pel Sí                                             31.5%   25.9%– 37.0%  100.0%
    Catalunya Sí que es Pot                                  20.4%   14.8%– 22.2%  100.0%
    Ciutadans-Partido de la Ciudadanía                       16.7%   11.1%– 18.5%  100.0%
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    9.3%    3.7%– 11.1%  100.0%
    Partit Popular de Catalunya                               9.3%    7.4%– 11.1%  100.0%
    Partit dels Socialistes de Catalunya                      9.3%    7.4%– 11.1%  100.0%
    Unió Democràtica de Catalunya                             5.6%    3.7%–  7.4%   99.7%
    Other                                                     1.9%    0.0%–  3.7%    0.0%
    2015-08-01 09:32:05 INFO: Error estimate: ε ≤ 3.70%.
    2015-08-01 09:32:05 INFO: Number of data points: 27.
    2015-08-01 09:32:06 INFO: Most probable fractions and 95% confidence intervals:
    Choice                                                    MPF      CI(95%)     P(≥3%)
    Junts pel Sí                                             31.5%   28.4%– 35.8%  100.0%
    Catalunya Sí que es Pot                                  20.4%   17.3%– 23.5%  100.0%
    Ciutadans-Partido de la Ciudadanía                       15.4%   13.6%– 19.8%  100.0%
    Partit Popular de Catalunya                               9.3%    6.2%– 11.1%  100.0%
    Partit dels Socialistes de Catalunya                      9.3%    6.2%– 11.1%  100.0%
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    6.2%– 11.1%  100.0%
    Unió Democràtica de Catalunya                             4.3%    2.5%–  6.2%  100.0%
    Other                                                     1.9%    1.2%–  3.7%   11.9%
    2015-08-01 09:32:06 INFO: Error estimate: ε ≤ 1.23%.
    2015-08-01 09:32:06 INFO: Number of data points: 81.
    2015-08-01 09:32:07 INFO: Most probable fractions and 95% confidence intervals:
    Choice                                                    MPF      CI(95%)     P(≥3%)
    Junts pel Sí                                             31.9%   28.8%– 35.4%  100.0%
    Catalunya Sí que es Pot                                  20.0%   17.3%– 23.0%  100.0%
    Ciutadans-Partido de la Ciudadanía                       15.8%   13.6%– 18.9%  100.0%
    Partit Popular de Catalunya                               8.8%    7.0%– 11.5%  100.0%
    Partit dels Socialistes de Catalunya                      8.8%    7.0%– 11.5%  100.0%
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    6.2%– 10.3%  100.0%
    Unió Democràtica de Catalunya                             3.9%    2.9%–  5.8%   97.8%
    Other                                                     1.9%    1.2%–  3.3%    5.8%
    2015-08-01 09:32:07 INFO: Error estimate: ε ≤ 0.412%.
    2015-08-01 09:32:07 INFO: Number of data points: 243.
    2015-08-01 09:32:12 INFO: Most probable fractions and 95% confidence intervals:
    Choice                                                    MPF      CI(95%)     P(≥3%)
    Junts pel Sí                                             31.9%   28.8%– 35.3%  100.0%
    Catalunya Sí que es Pot                                  20.0%   17.3%– 22.9%  100.0%
    Ciutadans-Partido de la Ciudadanía                       16.0%   13.6%– 18.7%  100.0%
    Partit Popular de Catalunya                               9.0%    7.1%– 11.2%  100.0%
    Partit dels Socialistes de Catalunya                      9.0%    7.1%– 11.2%  100.0%
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    6.3%– 10.2%  100.0%
    Unió Democràtica de Catalunya                             4.0%    2.9%–  5.6%   95.8%
    Other                                                     2.0%    1.1%–  3.2%    3.9%
    2015-08-01 09:32:12 INFO: Error estimate: ε ≤ 0.137%.
    2015-08-01 09:32:12 INFO: Number of data points: 729.
    2015-08-01 09:32:25 INFO: Most probable fractions and 95% confidence intervals:
    Choice                                                    MPF      CI(95%)     P(≥3%)
    Junts pel Sí                                             31.9%   28.8%– 35.3%  100.0%
    Catalunya Sí que es Pot                                  20.0%   17.4%– 22.9%  100.0%
    Ciutadans-Partido de la Ciudadanía                       16.0%   13.6%– 18.7%  100.0%
    Partit Popular de Catalunya                               9.0%    7.2%– 11.2%  100.0%
    Partit dels Socialistes de Catalunya                      9.0%    7.2%– 11.2%  100.0%
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.1%    6.4%– 10.2%  100.0%
    Unió Democràtica de Catalunya                             4.0%    2.9%–  5.6%   95.7%
    Other                                                     1.9%    1.2%–  3.2%    3.9%
    2015-08-01 09:32:25 INFO: Error estimate: ε ≤ 0.046%.
    2015-08-01 09:32:25 INFO: Number of data points: 2,187.
    2015-08-01 09:32:25 INFO: Analyzing as a polychotomy...
    2015-08-01 09:32:26 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   12.3%   24.4%   24.4%– 24.5%  100.0%   59– 59
    Catalunya Sí que es Pot                                  20.0%    7.1%   13.8%   13.8%– 13.9%  100.0%   28– 28
    Ciutadans-Partido de la Ciudadanía                       16.0%    5.5%   10.4%   10.4%– 10.5%  100.0%   21– 21
    Partit Popular de Catalunya                               9.0%    2.6%    5.0%    5.0%–  5.0%    0.0%    9–  9
    Partit dels Socialistes de Catalunya                      9.0%    2.6%    5.0%    5.0%–  5.0%  100.0%   10– 10
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    2.3%    4.3%    4.3%–  4.3%  100.0%    8–  8
    Unió Democràtica de Catalunya                             4.0%    1.0%    1.6%    1.6%–  1.6%            0–  0
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   50.0%   28.7%   28.7%– 28.7%     0.0%   67– 67      0.0%
    Junts pel Sí                                                            32.0%   50.0%   24.4%   24.4%– 24.4%     0.0%   59– 59      0.0%
    2015-08-01 09:32:26 INFO: Error estimate: ε ≤ 100%.
    2015-08-01 09:32:26 INFO: 1 simulations out of 1 data points, 1 / 40,531,767,997,824,000 of search space size (40,531,767,997,824,000).
    2015-08-01 09:32:26 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   25.5%   25.5%   25.5%– 25.5%  100.0%   57– 57
    Catalunya Sí que es Pot                                  20.0%   14.7%   14.7%   14.7%– 14.7%  100.0%   28– 28
    Ciutadans-Partido de la Ciudadanía                       16.0%   11.2%   11.2%   11.2%– 11.2%  100.0%   21– 21
    Partit Popular de Catalunya                               9.0%    5.6%    5.6%    5.5%–  5.6%  100.0%   11– 11
    Partit dels Socialistes de Catalunya                      9.0%    5.5%    5.5%    5.4%–  5.5%  100.0%   10– 10
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    4.6%    4.6%    4.6%–  4.6%  100.0%    8–  8
    Unió Democràtica de Catalunya                             4.0%    1.6%    1.6%    1.6%–  1.6%            0–  0
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   64.8%   30.1%   29.4%– 30.1%     0.0%   65– 65      0.0%
    Junts pel Sí                                                            32.0%   62.6%   25.5%   25.0%– 25.5%     0.0%   57– 57      0.0%
    2015-08-01 09:32:26 INFO: Error estimate: ε ≤ 1.05%.
    2015-08-01 09:32:26 INFO: 2 simulations out of 2 data points, 1 / 20,265,883,998,912,000 of search space size (40,531,767,997,824,000).
    2015-08-01 09:32:26 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   27.6%   27.6%   27.6%– 27.6%  100.0%   57– 57
    Catalunya Sí que es Pot                                  20.0%   16.4%   16.4%   16.4%– 16.5%  100.0%   28– 28
    Ciutadans-Partido de la Ciudadanía                       16.0%   12.8%   12.8%   12.8%– 12.8%  100.0%   21– 21
    Partit Popular de Catalunya                               9.0%    6.7%    6.7%    6.7%–  6.8%  100.0%   11– 11
    Partit dels Socialistes de Catalunya                      9.0%    6.5%    6.5%    6.4%–  6.5%  100.0%   10– 10
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    5.2%    5.2%    5.2%–  5.3%  100.0%    8–  8
    Unió Democràtica de Catalunya                             4.0%    1.7%    1.7%    1.7%–  1.7%            0–  0
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   66.1%   32.8%   32.1%– 32.8%     0.0%   65– 65      0.0%
    Junts pel Sí                                                            32.0%   63.5%   27.6%   27.1%– 27.6%     0.0%   57– 57      0.0%
    2015-08-01 09:32:26 INFO: Error estimate: ε ≤ 2.10%.
    2015-08-01 09:32:26 INFO: 4 simulations out of 4 data points, 1 / 10,132,941,999,456,000 of search space size (40,531,767,997,824,000).
    2015-08-01 09:32:27 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   31.8%   31.8%   31.8%– 31.8%  100.0%   54– 54
    Catalunya Sí que es Pot                                  20.0%   19.9%   19.9%   19.9%– 19.9%  100.0%   29– 29
    Ciutadans-Partido de la Ciudadanía                       16.0%   15.9%   15.9%   15.9%– 15.9%  100.0%   21– 21
    Partit Popular de Catalunya                               9.0%    9.1%    9.1%    9.1%–  9.1%  100.0%   12– 12
    Partit dels Socialistes de Catalunya                      9.0%    8.5%    8.5%    8.5%–  8.5%  100.0%   11– 11
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    6.5%    6.5%    6.5%–  6.5%  100.0%    8–  8
    Unió Democràtica de Catalunya                             4.0%    1.9%    1.9%    1.9%–  1.9%            0–  0
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   68.7%   38.3%   37.6%– 38.3%     0.0%   62– 62      0.0%
    Junts pel Sí                                                            32.0%   65.8%   31.8%   31.3%– 31.8%     0.0%   54– 54      0.0%
    2015-08-01 09:32:27 INFO: Error estimate: ε ≤ 4.21%.
    2015-08-01 09:32:27 INFO: 8 simulations out of 8 data points, 1 / 5,066,470,999,728,000 of search space size (40,531,767,997,824,000).
    2015-08-01 09:32:27 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   32.9%   32.9%   32.8%– 32.9%  100.0%   51– 54
    Catalunya Sí que es Pot                                  20.0%   20.8%   20.8%   20.2%– 20.8%  100.0%   27– 28
    Ciutadans-Partido de la Ciudadanía                       16.0%   16.7%   16.7%   15.8%– 16.7%  100.0%   20– 21
    Partit Popular de Catalunya                               9.0%    9.7%    9.7%    8.7%–  9.7%  100.0%   12– 12
    Partit dels Socialistes de Catalunya                      9.0%    9.0%    9.0%    6.6%–  9.0%   94.8%    8– 11
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    6.8%    6.8%    6.8%– 11.7%  100.0%    9– 17
    Unió Democràtica de Catalunya                             4.0%    1.9%    1.9%    1.9%–  2.7%            0–  0
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   39.7%   39.7%   39.3%– 44.4%     0.0%   63– 68      5.2%
    Junts pel Sí                                                            32.0%   66.5%   32.9%   32.3%– 32.9%     0.0%   51– 54      0.0%
    2015-08-01 09:32:27 INFO: Error estimate: ε ≤ 1.05%.
    2015-08-01 09:32:27 INFO: 16 simulations out of 24 data points, 1 / 1,688,823,666,576,000 of search space size (40,531,767,997,824,000).
    2015-08-01 09:32:27 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   32.9%   32.9%   32.8%– 34.9%  100.0%   51– 57
    Catalunya Sí que es Pot                                  20.0%   20.8%   20.8%   20.2%– 21.4%  100.0%   27– 28
    Ciutadans-Partido de la Ciudadanía                       16.0%   16.7%   16.7%   15.8%– 16.7%  100.0%   20– 21
    Partit Popular de Catalunya                               9.0%    9.7%    9.7%    8.7%–  9.7%  100.0%   12– 12
    Partit dels Socialistes de Catalunya                      9.0%    9.0%    9.0%    5.3%–  9.0%   85.4%    6– 11
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    6.8%    6.8%    6.8%– 11.7%  100.0%    9– 17
    Unió Democràtica de Catalunya                             4.0%    1.9%    1.9%    1.9%–  3.4%            0–  1
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   39.7%   39.7%   39.4%– 44.4%     0.0%   63– 68      4.7%
    Junts pel Sí                                                            32.0%   33.2%   32.9%   32.8%– 34.9%     0.0%   51– 57      0.0%
    2015-08-01 09:32:27 INFO: Error estimate: ε ≤ 3.66%.
    2015-08-01 09:32:27 INFO: 32 simulations out of 66 data points, 1 / 614,117,696,936,727 of search space size (40,531,767,997,824,000).
    2015-08-01 09:32:28 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   32.9%   32.9%   32.8%– 34.9%  100.0%   51– 57
    Catalunya Sí que es Pot                                  20.0%   20.8%   20.8%   20.2%– 21.4%  100.0%   27– 28
    Ciutadans-Partido de la Ciudadanía                       16.0%   16.7%   16.7%   15.8%– 16.7%  100.0%   20– 21
    Partit Popular de Catalunya                               9.0%    9.7%    9.7%    8.7%–  9.7%   98.3%   12– 12
    Partit dels Socialistes de Catalunya                      9.0%    9.0%    9.0%    5.3%–  9.0%   85.6%    6– 11
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    6.8%    6.8%    6.8%– 11.7%  100.0%    9– 17
    Unió Democràtica de Catalunya                             4.0%    1.9%    1.9%    1.9%–  3.4%            0–  1
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   39.7%   39.7%   39.5%– 44.8%     0.0%   63– 68      4.6%
    Junts pel Sí                                                            32.0%   32.9%   32.9%   32.8%– 35.3%     0.0%   51– 57      0.0%
    2015-08-01 09:32:28 INFO: Error estimate: ε ≤ 3.25%.
    2015-08-01 09:32:28 INFO: 64 simulations out of 179 data points, 1 / 226,434,458,088,402 of search space size (40,531,767,997,824,000).
    2015-08-01 09:32:28 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   32.9%   32.9%   32.8%– 34.9%  100.0%   51– 57
    Catalunya Sí que es Pot                                  20.0%   20.8%   20.8%   20.2%– 21.4%  100.0%   27– 28
    Ciutadans-Partido de la Ciudadanía                       16.0%   16.7%   16.7%   15.8%– 16.7%  100.0%   20– 21
    Partit Popular de Catalunya                               9.0%    9.7%    9.7%    8.7%–  9.7%   98.2%   12– 12
    Partit dels Socialistes de Catalunya                      9.0%    9.0%    9.0%    5.3%–  9.0%   85.7%    6– 11
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    6.8%    6.8%    6.8%– 11.7%  100.0%    9– 17
    Unió Democràtica de Catalunya                             4.0%    1.9%    1.9%    1.9%–  3.4%            0–  1
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   39.7%   39.7%   39.5%– 44.6%     0.0%   63– 68      4.6%
    Junts pel Sí                                                            32.0%   32.9%   32.9%   32.8%– 35.1%     0.0%   51– 57      0.0%
    2015-08-01 09:32:28 INFO: Error estimate: ε ≤ 3.89%.
    2015-08-01 09:32:28 INFO: 128 simulations out of 341 data points, 1 / 118,861,489,729,689 of search space size (40,531,767,997,824,000).
    2015-08-01 09:32:29 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   30.9%   30.9%   28.8%– 34.9%  100.0%   47– 56
    Catalunya Sí que es Pot                                  20.0%   22.5%   22.5%   18.6%– 22.5%  100.0%   24– 30
    Ciutadans-Partido de la Ciudadanía                       16.0%   16.9%   16.9%   16.2%– 17.1%  100.0%   21– 22
    Partit Popular de Catalunya                               9.0%    7.9%    7.9%    7.7%– 11.4%   88.1%   11– 15
    Partit dels Socialistes de Catalunya                      9.0%    7.5%    7.5%    7.3%–  9.0%   88.4%   10– 11
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    7.1%    7.1%    6.6%– 11.0%  100.0%    8– 16
    Unió Democràtica de Catalunya                             4.0%    4.0%    4.0%    1.9%–  4.0%            0–  6
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   38.0%   38.0%   37.9%– 42.6%     0.0%   57– 65      0.5%
    Junts pel Sí                                                            32.0%   30.9%   30.9%   28.8%– 34.9%     0.0%   47– 56      0.0%
    2015-08-01 09:32:29 INFO: Error estimate: ε ≤ 2.06%.
    2015-08-01 09:32:29 INFO: 256 simulations out of 695 data points, 1 / 58,319,090,644,351 of search space size (40,531,767,997,824,000).
    2015-08-01 09:32:30 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   30.6%   30.6%   28.8%– 34.6%  100.0%   47– 56
    Catalunya Sí que es Pot                                  20.0%   19.1%   19.1%   18.6%– 22.5%   99.8%   24– 30
    Ciutadans-Partido de la Ciudadanía                       16.0%   16.7%   16.7%   16.2%– 17.6%  100.0%   21– 22
    Partit Popular de Catalunya                               9.0%   10.3%    9.4%    7.7%– 10.3%   93.8%   11– 14
    Partit dels Socialistes de Catalunya                      9.0%    9.5%    7.2%    7.1%– 10.1%   54.6%    9– 13
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%   10.8%   10.8%    6.0%– 11.0%  100.0%    8– 16
    Unió Democràtica de Catalunya                             4.0%    4.0%    4.0%    1.9%–  4.8%            0–  6
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   36.6%   41.4%   36.6%– 41.4%     0.0%   57– 64      0.1%
    Junts pel Sí                                                            32.0%   30.6%   30.6%   28.8%– 34.6%     0.0%   47– 56      0.0%
    2015-08-01 09:32:30 INFO: Error estimate: ε ≤ 3.75%.
    2015-08-01 09:32:30 INFO: 512 simulations out of 1,419 data points, 1 / 28,563,613,811,010 of search space size (40,531,767,997,824,000).
    2015-08-01 09:32:33 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   30.6%   30.6%   28.5%– 34.6%  100.0%   47– 56
    Catalunya Sí que es Pot                                  20.0%   19.1%   19.1%   16.4%– 22.5%   96.0%   21– 30
    Ciutadans-Partido de la Ciudadanía                       16.0%   16.7%   16.7%   12.5%– 17.6%  100.0%   16– 22
    Partit Popular de Catalunya                               9.0%   10.3%    9.4%    7.7%– 11.8%   92.5%   11– 17
    Partit dels Socialistes de Catalunya                      9.0%    9.5%    7.2%    7.1%– 10.7%   54.2%    9– 14
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%   10.8%   10.8%    6.0%– 11.0%  100.0%    8– 16
    Unió Democràtica de Catalunya                             4.0%    4.0%    4.0%    2.2%–  6.3%            0–  8
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   41.4%   41.4%   36.6%– 41.4%     0.0%   57– 64      0.2%
    Junts pel Sí                                                            32.0%   30.6%   30.6%   28.5%– 34.6%     0.0%   47– 56      0.0%
    2015-08-01 09:32:33 INFO: Error estimate: ε ≤ 3.29%.
    2015-08-01 09:32:33 INFO: 1,024 simulations out of 2,830 data points, 1 / 14,322,179,504,531 of search space size (40,531,767,997,824,000).
    2015-08-01 09:32:36 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   32.7%   32.7%   28.5%– 34.2%  100.0%   45– 55
    Catalunya Sí que es Pot                                  20.0%   17.9%   17.9%   17.9%– 22.5%   56.5%   22– 30
    Ciutadans-Partido de la Ciudadanía                       16.0%   19.1%   19.1%   12.7%– 19.2%  100.0%   16– 24
    Partit Popular de Catalunya                               9.0%    7.7%    7.7%    7.5%– 11.8%   50.7%    9– 17
    Partit dels Socialistes de Catalunya                      9.0%    8.8%    8.8%    7.1%– 11.1%   79.2%    9– 14
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    7.6%    7.6%    6.0%– 10.8%  100.0%    8– 14
    Unió Democràtica de Catalunya                             4.0%    4.0%    4.0%    2.9%–  5.8%            0–  7
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   40.3%   40.3%   36.6%– 43.8%     0.0%   56– 68      2.7%
    Junts pel Sí                                                            32.0%   32.7%   32.7%   28.5%– 34.2%     0.0%   45– 55      0.0%
    2015-08-01 09:32:36 INFO: Error estimate: ε ≤ 3.20%.
    2015-08-01 09:32:36 INFO: 2,048 simulations out of 5,727 data points, 1 / 7,077,312,379,574 of search space size (40,531,767,997,824,000).
    2015-08-01 09:32:41 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   32.7%   32.7%   27.2%– 34.9%  100.0%   43– 55
    Catalunya Sí que es Pot                                  20.0%   17.9%   17.9%   17.5%– 23.1%   68.1%   22– 30
    Ciutadans-Partido de la Ciudadanía                       16.0%   19.1%   19.1%   12.7%– 19.2%  100.0%   16– 25
    Partit Popular de Catalunya                               9.0%    7.7%    7.7%    6.9%– 11.8%   41.7%    9– 17
    Partit dels Socialistes de Catalunya                      9.0%    8.8%    8.8%    7.0%– 11.1%   73.4%    9– 14
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    7.6%    7.6%    6.0%– 10.8%   99.9%    8– 14
    Unió Democràtica de Catalunya                             4.0%    4.0%    4.0%    2.7%–  5.5%            0–  7
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   40.7%   40.3%   36.3%– 43.8%     0.0%   55– 66      1.8%
    Junts pel Sí                                                            32.0%   32.7%   32.7%   27.2%– 34.9%     0.0%   43– 55      0.0%
    2015-08-01 09:32:41 INFO: Error estimate: ε ≤ 5.26%.
    2015-08-01 09:32:41 INFO: 4,096 simulations out of 11,469 data points, 1 / 3,534,028,075,492 of search space size (40,531,767,997,824,000).
    2015-08-01 09:32:53 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   31.9%   31.9%   28.4%– 35.3%  100.0%   46– 55
    Catalunya Sí que es Pot                                  20.0%   19.3%   19.3%   16.8%– 23.1%   94.1%   21– 30
    Ciutadans-Partido de la Ciudadanía                       16.0%   16.3%   16.3%   13.5%– 19.2%  100.0%   17– 24
    Partit Popular de Catalunya                               9.0%    8.5%    8.5%    7.3%– 10.9%   35.8%    9– 13
    Partit dels Socialistes de Catalunya                      9.0%   10.2%   10.2%    7.2%– 11.2%   85.8%    9– 14
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    7.6%    7.6%    6.6%– 10.0%  100.0%    8– 13
    Unió Democràtica de Catalunya                             4.0%    4.8%    4.8%    3.0%–  5.5%            0–  7
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   38.7%   39.5%   36.5%– 44.5%     0.0%   56– 66      0.5%
    Junts pel Sí                                                            32.0%   31.9%   31.9%   28.4%– 35.3%     0.0%   46– 55      0.0%
    2015-08-01 09:32:53 INFO: Error estimate: ε ≤ 2.79%.
    2015-08-01 09:32:53 INFO: 8,192 simulations out of 22,965 data points, 1 / 1,764,936,555,533 of search space size (40,531,767,997,824,000).
    2015-08-01 09:33:22 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   31.3%   31.3%   28.4%– 35.3%  100.0%   46– 55
    Catalunya Sí que es Pot                                  20.0%   19.5%   19.5%   17.2%– 22.5%   95.9%   22– 30
    Ciutadans-Partido de la Ciudadanía                       16.0%   17.1%   17.1%   13.5%– 18.3%  100.0%   17– 24
    Partit Popular de Catalunya                               9.0%    9.3%    9.3%    7.5%– 10.9%   18.1%    9– 13
    Partit dels Socialistes de Catalunya                      9.0%    9.4%    9.4%    7.2%– 11.2%   89.8%    9– 14
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    8.0%    8.0%    6.4%–  9.6%  100.0%    8– 13
    Unió Democràtica de Catalunya                             4.0%    3.5%    3.5%    3.0%–  5.3%            0–  7
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   39.3%   39.3%   36.5%– 44.3%     0.0%   56– 66      0.2%
    Junts pel Sí                                                            32.0%   31.3%   31.3%   28.4%– 35.3%     0.0%   46– 55      0.0%
    2015-08-01 09:33:22 INFO: Error estimate: ε ≤ 1.37%.
    2015-08-01 09:33:22 INFO: 16,384 simulations out of 45,929 data points, 1 / 882,487,491,515 of search space size (40,531,767,997,824,000).
    2015-08-01 09:34:20 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   30.9%   30.9%   28.5%– 35.0%  100.0%   46– 55
    Catalunya Sí que es Pot                                  20.0%   19.9%   19.9%   17.2%– 22.5%   95.7%   22– 30
    Ciutadans-Partido de la Ciudadanía                       16.0%   17.1%   16.8%   13.8%– 18.9%  100.0%   18– 24
    Partit Popular de Catalunya                               9.0%    9.7%    9.7%    7.3%– 10.9%   42.0%    9– 13
    Partit dels Socialistes de Catalunya                      9.0%    9.0%    9.0%    7.4%– 11.2%   90.6%   10– 14
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    8.0%    8.1%    6.4%–  9.6%  100.0%    8– 13
    Unió Democràtica de Catalunya                             4.0%    3.6%    3.6%    3.0%–  5.3%            0–  7
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   39.0%   39.0%   36.5%– 43.7%     0.0%   56– 66      0.2%
    Junts pel Sí                                                            32.0%   30.9%   30.9%   28.5%– 35.0%     0.0%   46– 55      0.0%
    2015-08-01 09:34:20 INFO: Error estimate: ε ≤ 0.412%.
    2015-08-01 09:34:20 INFO: 32,768 simulations out of 91,962 data points, 1 / 440,744,742,369 of search space size (40,531,767,997,824,000).
    2015-08-01 09:36:09 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   30.9%   30.9%   28.7%– 34.7%  100.0%   46– 55
    Catalunya Sí que es Pot                                  20.0%   19.9%   19.9%   17.2%– 22.5%   96.8%   22– 30
    Ciutadans-Partido de la Ciudadanía                       16.0%   17.1%   16.8%   13.5%– 18.7%  100.0%   17– 24
    Partit Popular de Catalunya                               9.0%    9.7%    9.3%    7.1%– 10.9%   47.5%    9– 13
    Partit dels Socialistes de Catalunya                      9.0%    9.4%    9.4%    7.5%– 11.1%   85.3%   10– 14
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    8.1%    8.1%    6.4%– 10.0%  100.0%    8– 13
    Unió Democràtica de Catalunya                             4.0%    3.6%    3.6%    3.0%–  5.5%            0–  7
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   39.0%   39.0%   36.6%– 43.4%     0.0%   56– 66      0.2%
    Junts pel Sí                                                            32.0%   30.9%   30.9%   28.7%– 34.7%     0.0%   46– 55      0.0%
    2015-08-01 09:36:09 INFO: Error estimate: ε ≤ 0.412%.
    2015-08-01 09:36:09 INFO: 65,536 simulations out of 183,888 data points, 1 / 220,415,513,779 of search space size (40,531,767,997,824,000).
    2015-08-01 09:39:49 INFO: Most probable rounded fractions, fractions and 95% confidence intervals:
    Choice                                                  Result    MPRF    MPF      CI(95%)      P(>↓)  Seats
    Junts pel Sí                                             32.0%   31.8%   30.9%   28.7%– 34.9%  100.0%   46– 55
    Catalunya Sí que es Pot                                  20.0%   19.8%   19.8%   17.1%– 22.7%   96.6%   22– 30
    Ciutadans-Partido de la Ciudadanía                       16.0%   16.5%   16.5%   13.6%– 18.7%  100.0%   17– 24
    Partit Popular de Catalunya                               9.0%    9.7%    9.3%    7.1%– 11.2%   43.7%    9– 14
    Partit dels Socialistes de Catalunya                      9.0%    9.4%    9.4%    7.1%– 11.2%   81.6%    9– 14
    Candidatura d'Unitat Popular – Alternativa d'Esquerres    8.0%    8.1%    8.1%    6.4%– 10.0%  100.0%    8– 13
    Unió Democràtica de Catalunya                             4.0%    3.8%    3.8%    2.9%–  5.5%            0–  7
    Coalition                                                              Result    MPRF    MPF      CI(95%)     P(>50%)  Seats  P(>50%)
    Candidatura d'Unitat Popular – Alternativa d'Esquerres + Junts pel Sí   40.0%   39.9%   39.9%   36.5%– 43.1%     0.0%   56– 66      0.6%
    Junts pel Sí                                                            32.0%   31.8%   30.9%   28.7%– 34.9%     0.0%   46– 55      0.0%
    2015-08-01 09:39:49 INFO: Error estimate: ε ≤ 1.01%.
    2015-08-01 09:39:49 INFO: 131,072 simulations out of 367,802 data points, 1 / 110,199,966,280 of search space size (40,531,767,997,824,000).
