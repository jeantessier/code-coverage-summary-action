# code-coverage-summary-action

A GitHub Action to summarize JaCoCo code coverage in Gradle builds

It collects JaCoCo results from each subproject and reports on code coverage for
each subproject.  The report is a simple table written to the
`GITHUB_STEP_SUMMARY`.

## To Use

Here is an example workflow as an example of using this GitHub Action in a job's
steps.

```yaml
jobs:
  build:
    steps:
    - name: Checkout the repo
      uses: actions/checkout@v4

    - name: Set up JDK 17
      uses: actions/setup-java@v4
      with:
        java-version: '17'
        distribution: 'temurin'
    - name: Setup Gradle
      uses: gradle/actions/setup-gradle@v3
    - name: Build with Gradle Wrapper
      run: ./gradlew testCodeCoverageReport

    - name: Summarize tests results
      uses: jeantessier/code-coverage-summary-action@v1
```

It will produce a summary table like the following.

### code-coverage-report

| Package                                  | Type        | Coverage | Covered | Total | Missed  |
|------------------------------------------|-------------|:--------:|:-------:|:-----:|:-------:|
| **_default_**                            |             |          |         |       |         |
|                                          | instruction |    0%    |    0    |  73   |  _73_   |
|                                          | line        |    0%    |    0    |  25   |  _25_   |
|                                          | complexity  |    0%    |    0    |  21   |  _21_   |
|                                          | method      |    0%    |    0    |  21   |  _21_   |
|                                          | class       |    0%    |    0    |  10   |  _10_   |
|                                          |             |          |         |       |         |
| **com.jeantessier.classreader**          |             |          |         |       |         |
|                                          | instruction |   68%    |  9768   | 14252 | _4484_  |
|                                          | branch      |   70%    |   495   |  707  |  _212_  |
|                                          | line        |   68%    |  2186   | 3206  | _1020_  |
|                                          | complexity  |   68%    |   863   | 1263  |  _400_  |
|                                          | method      |   69%    |   622   |  899  |  _277_  |
|                                          | class       |   93%    |   61    |  65   |   _4_   |
|                                          |             |          |         |       |         |
| **com.jeantessier.classreader.impl**     |             |          |         |       |         |
|                                          | instruction |   79%    |  11407  | 14301 | _2894_  |
|                                          | branch      |   55%    |   381   |  684  |  _303_  |
|                                          | line        |   77%    |  2485   | 3187  |  _702_  |
|                                          | complexity  |   68%    |  1045   | 1521  |  _476_  |
|                                          | method      |   76%    |   880   | 1151  |  _271_  |
|                                          | class       |   90%    |   205   |  226  |  _21_   |
|                                          |             |          |         |       |         |
| **com.jeantessier.commandline**          |             |          |         |       |         |
|                                          | instruction |   82%    |  1304   | 1572  |  _268_  |
|                                          | branch      |   79%    |   54    |  68   |  _14_   |
|                                          | line        |   84%    |   331   |  393  |  _62_   |
|                                          | complexity  |   79%    |   160   |  202  |  _42_   |
|                                          | method      |   81%    |   137   |  168  |  _31_   |
|                                          | class       |   100%   |   18    |  18   |   _0_   |
|                                          |             |          |         |       |         |
| **com.jeantessier.dependency**           |             |          |         |       |         |
|                                          | instruction |   84%    |  7486   | 8869  | _1383_  |
|                                          | branch      |   75%    |   487   |  645  |  _158_  |
|                                          | line        |   85%    |  1768   | 2079  |  _311_  |
|                                          | complexity  |   76%    |   798   | 1043  |  _245_  |
|                                          | method      |   81%    |   582   |  717  |  _135_  |
|                                          | class       |   96%    |   60    |  62   |   _2_   |
|                                          |             |          |         |       |         |
| **com.jeantessier.dependencyfinder**     |             |          |         |       |         |
|                                          | instruction |   41%    |   187   |  447  |  _260_  |
|                                          | branch      |   34%    |   11    |  32   |  _21_   |
|                                          | line        |   42%    |   56    |  131  |  _75_   |
|                                          | complexity  |   20%    |   14    |  67   |  _53_   |
|                                          | method      |   27%    |   14    |  51   |  _37_   |
|                                          | class       |   75%    |    3    |   4   |   _1_   |
|                                          |             |          |         |       |         |
| **com.jeantessier.dependencyfinder.ant** |             |          |         |       |         |
|                                          | instruction |    8%    |   559   | 6238  | _5679_  |
|                                          | branch      |   15%    |   68    |  451  |  _383_  |
|                                          | line        |    9%    |   171   | 1725  | _1554_  |
|                                          | complexity  |   12%    |   93    |  763  |  _670_  |
|                                          | method      |   11%    |   61    |  537  |  _476_  |
|                                          | class       |   23%    |    3    |  13   |  _10_   |
|                                          |             |          |         |       |         |
| **com.jeantessier.dependencyfinder.cli** |             |          |         |       |         |
|                                          | instruction |   36%    |  2344   | 6425  | _4081_  |
|                                          | branch      |   29%    |   112   |  377  |  _265_  |
|                                          | line        |   39%    |   521   | 1320  |  _799_  |
|                                          | complexity  |   35%    |   161   |  450  |  _289_  |
|                                          | method      |   47%    |   123   |  261  |  _138_  |
|                                          | class       |   92%    |   24    |  26   |   _2_   |
|                                          |             |          |         |       |         |
| **com.jeantessier.dependencyfinder.gui** |             |          |         |       |         |
|                                          | instruction |    0%    |    0    | 7143  | _7143_  |
|                                          | branch      |    0%    |    0    |  147  |  _147_  |
|                                          | line        |    0%    |    0    | 1723  | _1723_  |
|                                          | complexity  |    0%    |    0    |  288  |  _288_  |
|                                          | method      |    0%    |    0    |  212  |  _212_  |
|                                          | class       |    0%    |    0    |  30   |  _30_   |
|                                          |             |          |         |       |         |
| **com.jeantessier.diff**                 |             |          |         |       |         |
|                                          | instruction |   90%    |  5452   | 6013  |  _561_  |
|                                          | branch      |   84%    |   607   |  722  |  _115_  |
|                                          | line        |   90%    |  1104   | 1216  |  _112_  |
|                                          | complexity  |   76%    |   497   |  653  |  _156_  |
|                                          | method      |   79%    |   232   |  292  |  _60_   |
|                                          | class       |   96%    |   25    |  26   |   _1_   |
|                                          |             |          |         |       |         |
| **com.jeantessier.metrics**              |             |          |         |       |         |
|                                          | instruction |   89%    |  9621   | 10739 | _1118_  |
|                                          | branch      |   81%    |   608   |  743  |  _135_  |
|                                          | line        |   90%    |  2062   | 2282  |  _220_  |
|                                          | complexity  |   76%    |   757   |  991  |  _234_  |
|                                          | method      |   80%    |   459   |  567  |  _108_  |
|                                          | class       |   96%    |   32    |  33   |   _1_   |
|                                          |             |          |         |       |         |
| **com.jeantessier.text**                 |             |          |         |       |         |
|                                          | instruction |   95%    |   550   |  573  |  _23_   |
|                                          | branch      |   89%    |   41    |  46   |   _5_   |
|                                          | line        |   97%    |   135   |  139  |   _4_   |
|                                          | complexity  |   85%    |   60    |  70   |  _10_   |
|                                          | method      |   89%    |   42    |  47   |   _5_   |
|                                          | class       |   100%   |    5    |   5   |   _0_   |
|                                          |             |          |         |       |         |
| **otherpackage**                         |             |          |         |       |         |
|                                          | instruction |    0%    |    0    |  19   |  _19_   |
|                                          | line        |    0%    |    0    |   8   |   _8_   |
|                                          | complexity  |    0%    |    0    |   5   |   _5_   |
|                                          | method      |    0%    |    0    |   5   |   _5_   |
|                                          | class       |    0%    |    0    |   3   |   _3_   |
|                                          |             |          |         |       |         |
| **sloc**                                 |             |          |         |       |         |
|                                          | instruction |    0%    |    0    |  39   |  _39_   |
|                                          | branch      |    0%    |    0    |   6   |   _6_   |
|                                          | line        |    0%    |    0    |  18   |  _18_   |
|                                          | complexity  |    0%    |    0    |  10   |  _10_   |
|                                          | method      |    0%    |    0    |   5   |   _5_   |
|                                          | class       |    0%    |    0    |   3   |   _3_   |
|                                          |             |          |         |       |         |
| **testpackage**                          |             |          |         |       |         |
|                                          | instruction |    0%    |    0    |  50   |  _50_   |
|                                          | line        |    0%    |    0    |  22   |  _22_   |
|                                          | complexity  |    0%    |    0    |  11   |  _11_   |
|                                          | method      |    0%    |    0    |  11   |  _11_   |
|                                          | class       |    0%    |    0    |   5   |   _5_   |
|                                          |             |          |         |       |         |
| **_total_**                              |             |          |         |       |         |
|                                          | instruction |   63%    |  48678  | 76753 | _28075_ |
|                                          | branch      |   61%    |  2864   | 4628  | _1764_  |
|                                          | line        |   61%    |  10819  | 17474 | _6655_  |
|                                          | complexity  |   60%    |  4448   | 7358  | _2910_  |
|                                          | method      |   63%    |  3152   | 4944  | _1792_  |
|                                          | class       |   82%    |   436   |  529  |  _93_   |
|                                          |             |          |         |       |         |
