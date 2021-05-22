---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# GLFishStockR

<!-- badges: start -->
<!-- badges: end -->

The package provides a number of low level functions that fetch data
    from the Great Lakes fish stocking database for further analayis
    and reporting in R..


## Example

GLFishStocker provides a number of functions that can be use to fetch
data from the Great Lakes Fish Stocking Database API (www.fsis.glfc.org)

The functions in GLFishSocker expose methods that allow us to easily
get data into R, including the lakes, contributing agencies, and
associated management/spatial units.


```r
library(GLFishStockR)
## basic example code

get_lakes();
#>   abbrev      lake_name
#> 1     ER      Lake Erie
#> 2     HU     Lake Huron
#> 3     MI  Lake Michigan
#> 4     ON   Lake Ontario
#> 5     SC Lake St. Clair
#> 6     SU  Lake Superior

agencies <- get_agencies();
head(agencies)
#>            abbrev                                        agency_name
#> 1            CORA Chippewa-Ottawa Resource Authority, includes ITFAP
#> 2 CORA-LTBB ODAWA                                    CORA-LTBB ODAWA
#> 3             ESF                                                ESF
#> 4            GLFC                   Great Lakes Fisheries Commission
#> 5           ILDNR           Illinois Department of Natural Resources
#> 6           INDNR            Indiana Department of Natural Resources

mus <- get_management_units();
head(mus)
#>   id label   mu_type              slug primary lake.abbrev lake.lake_name
#> 1 16  MICH stat_dist er_stat_dist_mich    TRUE          ER      Lake Erie
#> 2 38    NY stat_dist   er_stat_dist_ny    TRUE          ER      Lake Erie
#> 3 39    O1 stat_dist   er_stat_dist_o1    TRUE          ER      Lake Erie
#> 4 40    O2 stat_dist   er_stat_dist_o2    TRUE          ER      Lake Erie
#> 5 41    O3 stat_dist   er_stat_dist_o3    TRUE          ER      Lake Erie
#> 6 42   OE1 stat_dist  er_stat_dist_oe1    TRUE          ER      Lake Erie

filters <- list(
  "lake"="MI"
)
mus <- get_management_units(filters);
head(mus)
#>   id label   mu_type             slug primary lake.abbrev lake.lake_name
#> 1  5   ILL stat_dist mi_stat_dist_ill    TRUE          MI  Lake Michigan
#> 2  6   IND stat_dist mi_stat_dist_ind    TRUE          MI  Lake Michigan
#> 3 17   MM1 stat_dist mi_stat_dist_mm1    TRUE          MI  Lake Michigan
#> 4 18   MM2 stat_dist mi_stat_dist_mm2    TRUE          MI  Lake Michigan
#> 5 19   MM3 stat_dist mi_stat_dist_mm3    TRUE          MI  Lake Michigan
#> 6 21   MM4 stat_dist mi_stat_dist_mm4    TRUE          MI  Lake Michigan

jurisdictions  <- get_jurisdictions()
head(juridictions)
#> Error in head(juridictions): object 'juridictions' not found


filters <- list(
  "lake"="MI"
)
jurisdictions  <- get_jurisdictions(filters)
head(juridictions)
#> Error in head(juridictions): object 'juridictions' not found


get_state_provinces();
#>   id abbrev         name country description
#> 1  1     IL     Illinois     USA            
#> 2  2     IN      Indiana     USA            
#> 3  3     MI     Michigan     USA            
#> 4  4     MN    Minnesota     USA            
#> 5  5     NY     New York     USA            
#> 6  6     OH         Ohio     USA            
#> 7  7     ON      Ontario     CAN            
#> 8  8     PA Pennsylvania     USA            
#> 9  9     WI    Wisconsin     USA

get_state_provinces(list("country"="USA"));
#>   id abbrev         name country description
#> 1  1     IL     Illinois     USA            
#> 2  2     IN      Indiana     USA            
#> 3  3     MI     Michigan     USA            
#> 4  4     MN    Minnesota     USA            
#> 5  5     NY     New York     USA            
#> 6  6     OH         Ohio     USA            
#> 7  8     PA Pennsylvania     USA            
#> 8  9     WI    Wisconsin     USA

head(get_grid10s(filters));
#>    id grid                                               centroid    slug
#> 1 722 1001  SRID=4326;POINT (-87.92416166819176 44.6130719635301) mi_1001
#> 2 723 1004  SRID=4326;POINT (-87.3926502376415 44.56850774809312) mi_1004
#> 3 724 1005 SRID=4326;POINT (-87.25000526031992 44.58333333933837) mi_1005
#> 4 725 1006 SRID=4326;POINT (-87.08333732407132 44.58333334704986) mi_1006
#> 5 726 1007 SRID=4326;POINT (-86.91667320247747 44.58333335476073) mi_1007
#> 6 727 1008 SRID=4326;POINT (-86.75000526614392 44.58333336247123) mi_1008
#>   lake.abbrev lake.lake_name
#> 1          MI  Lake Michigan
#> 2          MI  Lake Michigan
#> 3          MI  Lake Michigan
#> 4          MI  Lake Michigan
#> 5          MI  Lake Michigan
#> 6          MI  Lake Michigan
```

We can get all of the species, strains and raw (detailed) strains too:



```r

species <- get_species();
head(species)
#>   abbrev     common_name          scientific_name species_code speciescommon
#> 1    ATS Atlantic Salmon              Salmo salar           77    1230100401
#> 2    BKT     Brook Trout    Salvelinus fontinalis           80    1230101002
#> 3    BLG        Bluegill      Lepomis macrochirus          314    1701001302
#> 4    BLO         Bloater           Coregonus hoyi           94    1231200122
#> 5    BNT     Brown Trout             Salmo trutta           78    1230100402
#> 6    CHS  Chinook Salmon Oncorhynchus tshawytscha           75    1230100907

strains <- get_strains();
head(strains)
#>    id strain_code               strain_label    slug strain_species.abbrev
#> 1 151          GL Green lake Atlantic salmon  ats-gl                   ATS
#> 2   1          GU                  Gullspang  ats-gu                   ATS
#> 3 152         LCL          Little Clear Lake ats-lcl                   ATS
#> 4   2          LL                 Landlocked  ats-ll                   ATS
#> 5 139         NSB               undocumented ats-nsb                   ATS
#> 6   3          PB                  Penobscot  ats-pb                   ATS
#>   strain_species.common_name strain_species.scientific_name
#> 1            Atlantic Salmon                    Salmo salar
#> 2            Atlantic Salmon                    Salmo salar
#> 3            Atlantic Salmon                    Salmo salar
#> 4            Atlantic Salmon                    Salmo salar
#> 5            Atlantic Salmon                    Salmo salar
#> 6            Atlantic Salmon                    Salmo salar
#>   strain_species.species_code strain_species.speciescommon
#> 1                          77                   1230100401
#> 2                          77                   1230100401
#> 3                          77                   1230100401
#> 4                          77                   1230100401
#> 5                          77                   1230100401
#> 6                          77                   1230100401

raw_strains  <- get_raw_strains();
head(raw_strains)
#>    id      raw_strain  description species.abbrev species.common_name
#> 1 277                 Undocumented            ATS     Atlantic Salmon
#> 2   2 Atlantic Salmon Undocumented            ATS     Atlantic Salmon
#> 3   4             GLW Undocumented            ATS     Atlantic Salmon
#> 4   6             GRD Undocumented            ATS     Atlantic Salmon
#> 5 489      Green Lake                         ATS     Atlantic Salmon
#> 6 279              GU    Gullspang            ATS     Atlantic Salmon
#>   species.scientific_name species.species_code species.speciescommon strain.id
#> 1             Salmo salar                   77            1230100401         5
#> 2             Salmo salar                   77            1230100401         5
#> 3             Salmo salar                   77            1230100401         5
#> 4             Salmo salar                   77            1230100401         5
#> 5             Salmo salar                   77            1230100401       151
#> 6             Salmo salar                   77            1230100401         1
#>   strain.strain_code        strain.strain_label strain.slug
#> 1               UNKN                    Unknown    ats-unkn
#> 2               UNKN                    Unknown    ats-unkn
#> 3               UNKN                    Unknown    ats-unkn
#> 4               UNKN                    Unknown    ats-unkn
#> 5                 GL Green lake Atlantic salmon      ats-gl
#> 6                 GU                  Gullspang      ats-gu
```
We can fetch all of the values used for lifestages, marks, and yearling equivalent factors:


```r

lifestages <- get_lifestages();
head(lifestages)
#>   abbrev              description
#> 1      a           age-2 or older
#> 2      e                      egg
#> 3      f        fingerling, age-0
#> 4     ff   fall fingerling, age-0
#> 5    fry               fry, age-0
#> 6     sf spring fingerling, age-0

marks <- get_marks();
head(marks)
#>   clip_code mark_code mark_type              description
#> 1         X        OX  chemical          Oxytetracyclene
#> 2         5        AD   finclip         Adipose Fin Clip
#> 3         7        DO   finclip Anterior Dorsal Fin Clip
#> 4         F        LM   finclip    Left Maxilla Fin Clip
#> 5         2        LP   finclip   Left Pectoral Fin Clip
#> 6         4        LV   finclip    Left Ventral Fin Clip

yreq <- get_yreq_factors();
head(yreq)
#>   yreq_factor species.abbrev species.common_name lifestage.abbrev
#> 1       1.000            ATS     Atlantic Salmon                a
#> 2       0.001            ATS     Atlantic Salmon                e
#> 3       0.100            ATS     Atlantic Salmon                f
#> 4       0.100            ATS     Atlantic Salmon               ff
#> 5       0.010            ATS     Atlantic Salmon              fry
#> 6       0.100            ATS     Atlantic Salmon               sf
#>      lifestage.description
#> 1           age-2 or older
#> 2                      egg
#> 3        fingerling, age-0
#> 4   fall fingerling, age-0
#> 5               fry, age-0
#> 6 spring fingerling, age-0

#we can get them for a single species or lifestage too
get_yreq_factors(list(species="LAT"));
#>   yreq_factor species.abbrev species.common_name lifestage.abbrev
#> 1       1.000            LAT          Lake Trout                a
#> 2       0.001            LAT          Lake Trout                e
#> 3       0.100            LAT          Lake Trout                f
#> 4       0.010            LAT          Lake Trout              fry
#> 5       0.100            LAT          Lake Trout               sf
#> 6       1.000            LAT          Lake Trout                u
#> 7       1.000            LAT          Lake Trout                y
#> 8       0.330            LAT          Lake Trout               ff
#> 9       0.100            LAT          Lake Trout              suf
#>      lifestage.description
#> 1           age-2 or older
#> 2                      egg
#> 3        fingerling, age-0
#> 4               fry, age-0
#> 5 spring fingerling, age-0
#> 6                  unknown
#> 7          yearling, age-1
#> 8   fall fingerling, age-0
#> 9 summer fingerling, age-0
```

We can get stocking events based on a large number of attributes
including (but not limited to lake, species, strain, agency,
lifestage, stocking method, jursidiction, managment unit, or year.


```r

filters <- list(
  "lake"="HU",
  "species"=c("RBT","LAT", "BNT"),
  "first_year" = 2012
)

events <- get_stocking_events(filters)
#> Error in get_stocking_events(filters): could not find function "get_stocking_events"
nrow(events)
#> Error in nrow(events): object 'events' not found
head(events)
#> Error in head(events): object 'events' not found
```

We can also find stocking events that were associatd with spefic coded
wire tags, tag attriutes, or attributes of the stocked fish or stocking
event.


```r
filters  <-  list(
cwt_number='630157'
)
# this does not work as expected!! we need to return CWT SEQ here:
cwt_events  <- get_cwts(filters)
#> Error in get_cwts(filters): could not find function "get_cwts"
head(cwt_events)
#> Error in head(cwt_events): object 'cwt_events' not found
```
