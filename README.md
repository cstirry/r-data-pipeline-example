# R-Data-Pipeline-Template

Example R data pipeline to experiment with R packages for operationalizing data pipelines.

Pipeline ingests, processes, and validates data from the Baltimore City API.

### Packages/Tools

- [validate](https://cran.r-project.org/web/packages/validate/vignettes/cookbook.html) for data validation
- [testthat](https://cran.r-project.org/web/packages/testthat/index.html) for unit tests in CI
- [roxygen2](https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html) for documentation
- Github Actions

### File Structure

- .github/workflows/ci.yml: GitHub Actions workflow file for continuous integration.
- src/main.R: Main R script containing data fetching, loading, processing, and validation logic.
- src/helpers.R: Helper functions for data processing.
- src/tests/test_helpers.R: Unit tests for helper functions.
- src/validation_rules.yml: YAML file containing data validation rules.