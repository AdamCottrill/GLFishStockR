---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->



# GLFishStockR

The package provides a number of low level functions that fetch data
from the Great Lakes fish stocking database for further analayis
and reporting in R.


## Example

GLFishStocker provides a number of functions that can be use to fetch
data from the Great Lakes Fish Stocking Database API (www.fsis.glfc.org)

The functions in GLFishSocker expose methods that allow us to easily
get data into R, including the lakes, contributing agencies, and
associated management/spatial units.


```r
library(GLFishStockR)
## basic example code

get_lakes()
#>   abbrev      lake_name
#> 1     ER      Lake Erie
#> 2     HU     Lake Huron
#> 3     MI  Lake Michigan
#> 4     ON   Lake Ontario
#> 5     SC Lake St. Clair
#> 6     SU  Lake Superior
agencies <- get_agencies()
head(agencies)
#>            abbrev                                        agency_name
#> 1            CORA Chippewa-Ottawa Resource Authority, includes ITFAP
#> 2 CORA-LTBB ODAWA                                    CORA-LTBB ODAWA
#> 3            GLFC                   Great Lakes Fisheries Commission
#> 4           ILDNR           Illinois Department of Natural Resources
#> 5           INDNR            Indiana Department of Natural Resources
#> 6             KBB                       Keweenaw Bay Band, Chippewas

mus <- get_management_units()
head(mus)
#>   id label                 description mu_type       slug primary lake.abbrev
#> 1 75   4-1   main basin Ontario Waters     qma hu_qma_4-1   FALSE          HU
#> 2 76   4-2   main basin Ontario Waters     qma hu_qma_4-2   FALSE          HU
#> 3 77   4-3   main basin Ontario Waters     qma hu_qma_4-3   FALSE          HU
#> 4 78   4-5   main basin Ontario Waters     qma hu_qma_4-5   FALSE          HU
#> 5 79   5-1 Georgian Bay Ontario Waters     qma hu_qma_5-1   FALSE          HU
#> 6 80   5-2 Georgian Bay Ontario Waters     qma hu_qma_5-2   FALSE          HU
#>   lake.lake_name
#> 1     Lake Huron
#> 2     Lake Huron
#> 3     Lake Huron
#> 4     Lake Huron
#> 5     Lake Huron
#> 6     Lake Huron

filters <- list(
  "lake" = "MI"
)
mus <- get_management_units(filters)
head(mus)
#>   id label     description   mu_type             slug primary lake.abbrev
#> 1  5   ILL Illinois waters stat_dist mi_stat_dist_ill    TRUE          MI
#> 2  6   IND  Indiana waters stat_dist mi_stat_dist_ind    TRUE          MI
#> 3 17   MM1 Michigan waters stat_dist mi_stat_dist_mm1    TRUE          MI
#> 4 18   MM2 Michigan waters stat_dist mi_stat_dist_mm2    TRUE          MI
#> 5 19   MM3 Michigan waters stat_dist mi_stat_dist_mm3    TRUE          MI
#> 6 21   MM4 Michigan waters stat_dist mi_stat_dist_mm4    TRUE          MI
#>   lake.lake_name
#> 1  Lake Michigan
#> 2  Lake Michigan
#> 3  Lake Michigan
#> 4  Lake Michigan
#> 5  Lake Michigan
#> 6  Lake Michigan

jurisdictions <- get_jurisdictions()
#> Warning in refresh_filters(endpoint): Filters could not be found for the
#> 'jursidiction' endpoint
head(jurisdictions)
#>   id  slug              name                      description lake.abbrev
#> 1 28 er_mi     Erie-Michigan     Michigan waters of Lake Erie          ER
#> 2 32 er_ny     Erie-New York     New York waters of Lake Erie          ER
#> 3 33 er_oh         Erie-Ohio         Ohio waters of Lake Erie          ER
#> 4 36 er_on      Erie-Ontario      Ontario waters of Lake Erie          ER
#> 5 39 er_pa Erie-Pennsylvania Pennsylvania waters of Lake Erie          ER
#> 6 27 hu_mi    Huron-Michigan    Michigan waters of Lake Huron          HU
#>   lake.lake_name stateprov.id stateprov.abbrev stateprov.name stateprov.country
#> 1      Lake Erie            3               MI       Michigan               USA
#> 2      Lake Erie            5               NY       New York               USA
#> 3      Lake Erie            6               OH           Ohio               USA
#> 4      Lake Erie            7               ON        Ontario               CAN
#> 5      Lake Erie            8               PA   Pennsylvania               USA
#> 6     Lake Huron            3               MI       Michigan               USA
#>   stateprov.description
#> 1                      
#> 2                      
#> 3                      
#> 4                      
#> 5                      
#> 6


filters <- list(
  "lake" = "MI"
)
jurisdictions <- get_jurisdictions(filters)
#> Warning in refresh_filters(endpoint): Filters could not be found for the
#> 'jursidiction' endpoint
#> Warning in check_filters("jursidiction", filter_list): Unknown filters provided. These will be ignored:
#>  + lake
head(jurisdictions)
#>   id  slug               name                       description lake.abbrev
#> 1 23 mi_il  Michigan-Illinois  Illinois waters of Lake Michigan          MI
#> 2 24 mi_in   Michigan-Indiana   Indiana waters of Lake Michigan          MI
#> 3 25 mi_mi  Michigan-Michigan  Michigan waters of Lake Michigan          MI
#> 4 41 mi_wi Michigan-Wisconsin Wisconsin waters of Lake Michigan          MI
#>   lake.lake_name stateprov.id stateprov.abbrev stateprov.name stateprov.country
#> 1  Lake Michigan            1               IL       Illinois               USA
#> 2  Lake Michigan            2               IN        Indiana               USA
#> 3  Lake Michigan            3               MI       Michigan               USA
#> 4  Lake Michigan            9               WI      Wisconsin               USA
#>   stateprov.description
#> 1                      
#> 2                      
#> 3                      
#> 4

get_state_provinces()
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
get_state_provinces(list("country" = "USA"))
#>   id abbrev         name country description
#> 1  1     IL     Illinois     USA            
#> 2  2     IN      Indiana     USA            
#> 3  3     MI     Michigan     USA            
#> 4  4     MN    Minnesota     USA            
#> 5  5     NY     New York     USA            
#> 6  6     OH         Ohio     USA            
#> 7  8     PA Pennsylvania     USA            
#> 8  9     WI    Wisconsin     USA
head(get_grid10s(filters))
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

Most of the functions accept a list of filters that can be used to
select the data that is returned from the Great Lakes Stocking
Database.  The list forms a key-value pair that specified the filter
to be applied and the value of the filter.

A helper function ~show_filters()~ is included in the package that
will display the names of the filterable endpoints, if no endpoint is
provided, and provide all of the available filters if an valid
endpoint is supplied:



```r

show_filters()
#> An endpoint name needs to be provided. Currently avaliable endpoint names are:
#>  [1] "grid10"              "jurisdiction"        "management_unit"    
#>  [4] "mark"                "state_province"      "strain"             
#>  [7] "strainraw"           "stocking_events"     "get_cwt_events"     
#> [10] "yearling_equivalent"

show_filters("strain")
#>             name description
#> 1    strain_code            
#> 2 strain_species            
#> 3        species

show_filters("stocking_events", filter_like="clip")
#>         name                                 description
#> 39 clip_code Multiple values may be separated by commas.
#> 40  finclips Multiple values may be separated by commas.
```





We can get all of the species, strains and raw (detailed) strains too:


```r

species <- get_species()
head(species)
#>   abbrev     common_name          scientific_name species_code speciescommon
#> 1    ATS Atlantic Salmon              Salmo salar           77    1230100401
#> 2    BKT     Brook Trout    Salvelinus fontinalis           80    1230101002
#> 3    BLG        Bluegill      Lepomis macrochirus          314    1701001302
#> 4    BLO         Bloater           Coregonus hoyi           94    1231200122
#> 5    BNT     Brown Trout             Salmo trutta           78    1230100402
#> 6    CHS  Chinook Salmon Oncorhynchus tshawytscha           75    1230100907

strains <- get_strains()
head(strains)
#>    id strain_code               strain_label    slug strain_species.abbrev
#> 1 180         GDL            Grand Lake - ME ats-gdl                   ATS
#> 2 151          GL Green Lake Atlantic Salmon  ats-gl                   ATS
#> 3   1          GU                  Gullspang  ats-gu                   ATS
#> 4 202         LCH             Lake Champlain lat-lch                   LAT
#> 5 152         LCL          Little Clear Lake ats-lcl                   ATS
#> 6 181         LHR               Lahave River ats-lhr                   ATS
#>   strain_species.common_name strain_species.scientific_name
#> 1            Atlantic Salmon                    Salmo salar
#> 2            Atlantic Salmon                    Salmo salar
#> 3            Atlantic Salmon                    Salmo salar
#> 4                 Lake Trout           Salvelinus namaycush
#> 5            Atlantic Salmon                    Salmo salar
#> 6            Atlantic Salmon                    Salmo salar
#>   strain_species.species_code strain_species.speciescommon
#> 1                          77                   1230100401
#> 2                          77                   1230100401
#> 3                          77                   1230100401
#> 4                          81                   1230101098
#> 5                          77                   1230100401
#> 6                          77                   1230100401

raw_strains <- get_raw_strains()
head(raw_strains)
#>    id      raw_strain     description species.abbrev species.common_name
#> 1 582 Atlantic Salmon         Unknown            ATS     Atlantic Salmon
#> 2 527             GDL Grand Lake - ME            ATS     Atlantic Salmon
#> 3 620              GL      Green Lake            ATS     Atlantic Salmon
#> 4   4             GLW    Undocumented            ATS     Atlantic Salmon
#> 5 599             GRD      Grand Lake            ATS     Atlantic Salmon
#> 6 621         GRD,PEN         Unknown            ATS     Atlantic Salmon
#>   species.scientific_name species.species_code species.speciescommon strain.id
#> 1             Salmo salar                   77            1230100401         5
#> 2             Salmo salar                   77            1230100401       180
#> 3             Salmo salar                   77            1230100401       151
#> 4             Salmo salar                   77            1230100401         5
#> 5             Salmo salar                   77            1230100401       180
#> 6             Salmo salar                   77            1230100401         5
#>   strain.strain_code        strain.strain_label strain.slug
#> 1               UNKN                    Unknown    ats-unkn
#> 2                GDL            Grand Lake - ME     ats-gdl
#> 3                 GL Green Lake Atlantic Salmon      ats-gl
#> 4               UNKN                    Unknown    ats-unkn
#> 5                GDL            Grand Lake - ME     ats-gdl
#> 6               UNKN                    Unknown    ats-unkn
```
We can fetch all of the values used for lifestages, marks, and yearling equivalent factors:


```r

lifestages <- get_lifestages()
head(lifestages)
#>   abbrev              description
#> 1      a           age-2 or older
#> 2      e                      egg
#> 3      f        fingerling, age-0
#> 4     ff   fall fingerling, age-0
#> 5    fry               fry, age-0
#> 6     sf spring fingerling, age-0

marks <- get_marks()
head(marks)
#>   clip_code mark_code mark_type              description
#> 1         X        OX  chemical          Oxytetracyclene
#> 2         5        AD   finclip         Adipose Fin Clip
#> 3         7        DO   finclip Anterior Dorsal Fin Clip
#> 4         F        LM   finclip    Left Maxilla Fin Clip
#> 5         2        LP   finclip   Left Pectoral Fin Clip
#> 6         4        LV   finclip    Left Ventral Fin Clip

yreq <- get_yreq_factors()
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

# we can get them for a single species or lifestage too
get_yreq_factors(list(species = "LAT"))
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
  "lake" = "HU",
  "species" = c("RBT", "LAT", "BNT"),
  "first_year" = 2012
)
events <- get_stocking_events(filters)

nrow(events)
#> [1] 1613
head(events)
#>   stock_id day month year             site          st_site
#> 1 20220075  15     4 2021 Lexington Harbor Lexington Harbor
#> 2 20220252  18     5 2021           Detour                 
#> 3 20220253  18     5 2021           Detour                 
#> 4 20220254  23     4 2021       Bois Blanc      Reef Summit
#> 5 20220255  24     4 2021      Adams Point                 
#> 6 20220256  23     4 2021       Bois Blanc      Reef Summit
#>                                               geom no_stocked year_class
#> 1 SRID=4326;POINT (-82.52659482999999 43.26750588)      30000       2020
#> 2     SRID=4326;POINT (-83.90000000000001 45.8669)      40010       2020
#> 3     SRID=4326;POINT (-83.90000000000001 45.8669)      39982       2020
#> 4               SRID=4326;POINT (-84.4181 45.8177)      68009       2020
#> 5        SRID=4326;POINT (-83.65000000000001 45.5)      69385       2020
#> 6               SRID=4326;POINT (-84.4181 45.8177)      69538       2020
#>   agemonth tag_no mark yreq_stocked agency.abbrev
#> 1       15   <NA>   NA        30000         MIDNR
#> 2       17 641293   NA        40010         USFWS
#> 3       17 641341   NA        39982         USFWS
#> 4       16 641319   NA        68009         USFWS
#> 5       16 641321   NA        69385         USFWS
#> 6       16 641315   NA        69538         USFWS
#>                         agency.agency_name condition.condition
#> 1 Michigan Department of Natural Resources                   1
#> 2           U.S. Fish and Wildlife Service                   1
#> 3           U.S. Fish and Wildlife Service                   1
#> 4           U.S. Fish and Wildlife Service                   1
#> 5           U.S. Fish and Wildlife Service                   1
#> 6           U.S. Fish and Wildlife Service                   1
#>                 condition.description grid_10.id grid_10.grid
#> 1 <1% mortality observed, "excellent"        126         1915
#> 2 <1% mortality observed, "excellent"        156          306
#> 3 <1% mortality observed, "excellent"        156          306
#> 4 <1% mortality observed, "excellent"        178          403
#> 5 <1% mortality observed, "excellent"        226          608
#> 6 <1% mortality observed, "excellent"        178          403
#>                                         grid_10.centroid grid_10.slug
#> 1 SRID=4326;POINT (-82.42790326846431 43.25209597110957)      hu_1915
#> 2 SRID=4326;POINT (-83.91524345779918 45.90396859168997)       hu_306
#> 3 SRID=4326;POINT (-83.91524345779918 45.90396859168997)       hu_306
#> 4 SRID=4326;POINT (-84.40808691659738 45.73980324819702)       hu_403
#> 5 SRID=4326;POINT (-83.58011249322665 45.42859111583507)       hu_608
#> 6 SRID=4326;POINT (-84.40808691659738 45.73980324819702)       hu_403
#>   grid_10.lake.abbrev grid_10.lake.lake_name latlong_flag.value
#> 1                  HU             Lake Huron                  1
#> 2                  HU             Lake Huron                  1
#> 3                  HU             Lake Huron                  1
#> 4                  HU             Lake Huron                  1
#> 5                  HU             Lake Huron                  1
#> 6                  HU             Lake Huron                  1
#>   latlong_flag.description lifestage.abbrev lifestage.description
#> 1                 Reported                y       yearling, age-1
#> 2                 Reported                y       yearling, age-1
#> 3                 Reported                y       yearling, age-1
#> 4                 Reported                y       yearling, age-1
#> 5                 Reported                y       yearling, age-1
#> 6                 Reported                y       yearling, age-1
#>   species.abbrev species.common_name species.scientific_name
#> 1            RBT       Rainbow Trout     Oncorhynchus mykiss
#> 2            LAT          Lake Trout    Salvelinus namaycush
#> 3            LAT          Lake Trout    Salvelinus namaycush
#> 4            LAT          Lake Trout    Salvelinus namaycush
#> 5            LAT          Lake Trout    Salvelinus namaycush
#> 6            LAT          Lake Trout    Salvelinus namaycush
#>   species.species_code species.speciescommon stocking_method.stk_meth
#> 1                   76            1230100909                        s
#> 2                   81            1230101098                        b
#> 3                   81            1230101098                        b
#> 4                   81            1230101098                        b
#> 5                   81            1230101098                        b
#> 6                   81            1230101098                        b
#>               stocking_method.description jurisdiction.id jurisdiction.slug
#> 1 shore stocking (truck, atv, snowmobile)              27             hu_mi
#> 2                 boat, offshore stocking              27             hu_mi
#> 3                 boat, offshore stocking              27             hu_mi
#> 4                 boat, offshore stocking              27             hu_mi
#> 5                 boat, offshore stocking              27             hu_mi
#> 6                 boat, offshore stocking              27             hu_mi
#>   jurisdiction.name      jurisdiction.description jurisdiction.lake.abbrev
#> 1    Huron-Michigan Michigan waters of Lake Huron                       HU
#> 2    Huron-Michigan Michigan waters of Lake Huron                       HU
#> 3    Huron-Michigan Michigan waters of Lake Huron                       HU
#> 4    Huron-Michigan Michigan waters of Lake Huron                       HU
#> 5    Huron-Michigan Michigan waters of Lake Huron                       HU
#> 6    Huron-Michigan Michigan waters of Lake Huron                       HU
#>   jurisdiction.lake.lake_name jurisdiction.stateprov.id
#> 1                  Lake Huron                         3
#> 2                  Lake Huron                         3
#> 3                  Lake Huron                         3
#> 4                  Lake Huron                         3
#> 5                  Lake Huron                         3
#> 6                  Lake Huron                         3
#>   jurisdiction.stateprov.abbrev jurisdiction.stateprov.name
#> 1                            MI                    Michigan
#> 2                            MI                    Michigan
#> 3                            MI                    Michigan
#> 4                            MI                    Michigan
#> 5                            MI                    Michigan
#> 6                            MI                    Michigan
#>   jurisdiction.stateprov.country jurisdiction.stateprov.description
#> 1                            USA                                   
#> 2                            USA                                   
#> 3                            USA                                   
#> 4                            USA                                   
#> 5                            USA                                   
#> 6                            USA
```

We can also find stocking events that were associatd with specific coded
wire tags, tag attriutes, or attributes of the stocked fish or stocking
event.


```r
filters <- list(
  cwt_number = "630157"
)

cwt_events <- get_cwt_events(filters)
head(cwt_events)
#>   cwt_number   tag_type seq_lower seq_upper manufacturer tag_reused
#> 1     630157 sequential     15285     15810          nmt       True
#> 2     630157 sequential     15820     16380          nmt       True
#> 3     630157 sequential     14014     14621          nmt       True
#> 4     630157 sequential     16385     17699          nmt       True
#> 5     630157 sequential     14629     15280          nmt       True
#> 6     630157 sequential     11740     12800          nmt       True
#>   multiple_lakes multiple_species multiple_strains multiple_yearclasses
#> 1          False            False             True                 True
#> 2          False            False             True                 True
#> 3          False            False             True                 True
#> 4          False            False             True                 True
#> 5          False            False             True                 True
#> 6          False            False             True                 True
#>   multiple_agencies stock_id agency_stock_id agency_code lake state jurisd
#> 1             False 20196154           12683        OMNR   HU    ON  hu_on
#> 2             False 20196155           12684        OMNR   HU    ON  hu_on
#> 3             False 20196156           12687        OMNR   HU    ON  hu_on
#> 4             False 20196157           12691        OMNR   HU    ON  hu_on
#> 5             False 20196158           12695        OMNR   HU    ON  hu_on
#> 6             False 20196159           12696        OMNR   HU    ON  hu_on
#>   man_unit grid10 primary_location   secondary_location latitude longitude year
#> 1      GB4   1124       Owen Sound Owen Sound East Wall  44.5789 -80.93954 2006
#> 2      GB4   1124       Owen Sound Owen Sound East Wall  44.5789 -80.93954 2006
#> 3      GB4   1124       Owen Sound Owen Sound East Wall  44.5789 -80.93954 2006
#> 4      GB4   1124       Owen Sound  Os Harbour-Goodyear  44.6016  -80.9208 2006
#> 5      GB4   1124       Owen Sound  Os Harbour-Goodyear  44.6016  -80.9208 2006
#> 6      GB4   1124       Owen Sound Owen Sound East Wall  44.5789 -80.93954 2006
#>   month day spc                  strain year_class mark clipcode          stage
#> 1     2  10 LAT             Seneca Lake       2001   NA       AD age-2 or older
#> 2     2  10 LAT             Seneca Lake       2002   NA       AD age-2 or older
#> 3     2  10 LAT             Seneca Lake       2003   NA       AD age-2 or older
#> 4     2  27 LAT    Huron - Iroquois Bay       2001   NA       AD age-2 or older
#> 5     2  27 LAT    Huron - Iroquois Bay       2002   NA       AD age-2 or older
#> 6     1   6 LAT Superior - Slate Island       2004   NA       AD age-2 or older
#>    method no_stocked event_tag_numbers
#> 1 unknown        267            630157
#> 2 unknown        311            630157
#> 3 unknown        358            630157
#> 4 unknown        402            630157
#> 5 unknown        279            630157
#> 6 unknown        638            630157
```
