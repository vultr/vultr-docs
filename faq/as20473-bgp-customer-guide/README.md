# AS20473 BGP Communities Customer Guide

Last updated: `2022-04-19`

## Informational Communities

### Prefix Type

AS20473 tags prefixes that are learned or originated as follows:

| Prefix type                         | Community             | Large Community
| ----------------------------------- | --------------------- | ---------------
| Prefix learned from Transit         | 20473:100             | 20473­:100­:transit-as
| Prefix learned from Public Peer     | 20473:200             | 20473:200:ixp-as
| Prefix learned from Private Peer    | 20473:300             | 20473:300:peer-as
| Prefix originated by Customer       | 20473:400, 20473:4000 | 
| Prefix originated by 20473          | 20473:500             |
| Prefix learned from AS number       | 20473:peer-as         |

### Location

Routes announced from AS20473 are also tagged with a 2­-digit community to provide information about the POP it was originated from. For example, prefixes tagged with 20473:11 are generated in Piscataway. These locations are defined in the following table.

<table>
<tr>
<th>United States</th><th>Americas</th><th>Europe</th><th>Asia & Pacific</th><th>Africa</th>
</tr>
<tr>
<td valign="top">

|     POP Name    | Code |
|:----------------|:----:|
| Atlanta, GA     | 14   |
| Chicago, IL     | 13   |
| Dallas, TX      | 15   |
| Honolulu, HI    | 34   |
| Los Angeles, CA | 17   |
| Miami, FL       | 12   |
| Piscataway, NJ  | 11   |
| San Jose, CA    | 18   |
| Seattle, WA     | 16   |

</td>
<td valign="top">

|     POP Name    | Code |
|:----------------|:----:|
| Mexico, MX      | 28   |
| Sao Paulo, BR   | 30   |
| Toronto, CA     | 33   |

</td>
<td valign="top">

|     POP Name    | Code |
|:----------------|:----:|
| Amsterdam, NL   | 20   |
| Frankfurt, DE   | 22   |
| London, GB      | 19   |
| Madrid, ES      | 31   |
| Paris, FR       | 21   |
| Stockholm, SE   | 27   |
| Warsaw, PL      | 29   |

</td>
<td valign="top">

|     POP Name    | Code |
|:----------------|:----:|
| Bangalore, IN   | 43   |
| Korea, KR       | 26   |
| Melbourne, AU   | 32   |
| Mumbai, IN      | 35   |
| New Delhi, IN.  | 44   |
| Singapore, SG   | 25   |
| Sydney, AU      | 24   |
| Tokyo, JP       | 23   |

</td>
<td valign="top">

|     POP Name       | Code |
|:-------------------|:----:|
| Johannesburg, ZA   | 37   |

</td>
</tr>
</table>

Large communities are also used for location with the following format `20473:0:3RRRCCC1PP` where:

- `RRR` is the [M49 region code](https://unstats.un.org/unsd/methodology/m49/#geo-regions)
- `CCC` is the [M49 country code](https://unstats.un.org/unsd/methodology/m49/#countries)
- `PP` is the location code as explained above

## Action Communities

Customers may choose to influence prefixes advertised outside of AS20473 using the communities below. Customers may also add 3rd party communities which are passed on to our providers and peers. We have incorporated some large communities to support actions on 32-bit autonomous system numbers.

| Action                             | Community     | Large Community    |
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


## Other BGP Communities

AS20473 transparently advertises communities set by its customers. Customers can use these communities to affect their inbound traffic from our different transit providers and IXPs.
