Example: Greece
===============

The following file is a valid poll file for a Greek poll. It is based on
the results of a poll done from 31 August–1 September 2015 by Pulse RC for
Action24.

    Area=GR
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

    sapor analyze PulceRC-Action24-20150901.poll

For this file, the log will look like below.

    2015-08-01 09:32:05 INFO: Analyzing as a set of dichotomies...
