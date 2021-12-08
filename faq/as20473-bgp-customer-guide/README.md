# AS20473 BGP Customer Guide

Last updated: `2021-08-12`

## Information Communities

AS20473 tags prefixes that are learned or originated as follows:

|                                     |                       |
| ----------------------------------- | --------------------- |
| Customer prefix originated by 20473 | 20473:540             |
| Prefix learned from Transit         | 20473:100             |
| Prefix learned from Public Peer     | 20473:200             |
| Prefix learned from Private Peer    | 20473:300             |
| Prefix learned from Customer        | 20473:400, 20473:4000 |
| Originated by 20473                 | 20473:500             |
| Prefix learned from AS number       | 20473:peer-as         |

## Action Communities

Customers may choose to influence prefixes advertised outside of AS20473 using the communities below. Customers may also add 3rd party communities which are passed onto our providers and peers. We have incorporated some large communities to support actions on 32-bit autonomous system numbers.

|                                    |               |                    |
| ---------------------------------- | ------------- | ------------------ |
| Do not announce to specific AS     | 64600:peer-as | 20473:6000:peer-as |
| Prepend 1x to specific AS          | 64601:peer-as | 20473:6001:peer-as |
| Prepend 2x to specific AS          | 64602:peer-as | 20473:6002:peer-as |
| Prepend 3x to specific AS          | 64603:peer-as | 20473:6003:peer-as |
| Set Metric to 0 to specific AS     | 64609:peer-as | 20473:6009:peer-as |
| Override 20473:6000 to specific AS | 64699:peer-as | 20473:6099:peer-as |
| Do not announce to IXP peers       | 20473:6601    |                    |
| Announce to IXP route servers only | 20473:6602    |                    |
| Do not export out of AS20473       | 20473:6000    |                    |
| Set Metric to 0 to all AS’s        | 20473:64609   |                    |
| Prepend 1x to all AS’s             | 20473:6001    |                    |
| Prepend 2x to all AS’s             | 20473:6002    |                    |
| Prepend 3x to All AS’s             | 20473:6003    |                    |
| Export blackhole to all AS’s       | 20473:666     |                    |



## Location Communities

Routes announced from AS20473 are also tagged with a 2­-digit community to provide information about the POP it was originated from. For example, 20473:nn. These locations are defined in the following table.

| POP  | Code |
| ---- | ---- |
| PNJ1 | 11   |
| MIA1 | 12   |
| CHI2 | 13   |
| ATL2 | 14   |
| DAL4 | 15   |
| SEA2 | 16   |
| LAX3 | 17   |
| SJC1 | 18   |
| LON3 | 19   |
| AMS1 | 20   |
| PAR3 | 21   |
| FKT3 | 22   |
| TYO1 | 23   |
| AUS1 | 24   |
| SGP1 | 25   |
| KOR1 | 26   |
| STO1 | 27   |
| MEX1 | 28   |
| WAW1 | 29   |
| SAO1 | 30   |
| TOR1 | 33   |

