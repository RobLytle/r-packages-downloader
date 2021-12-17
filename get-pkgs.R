# create a .csv of installed packages
library(tidyverse)
packages <- data.frame(installed.packages(), stringsAsFactors = FALSE) %>%
	select(package = Package, version = Version) %>%
	write_csv("pkgs.csv") %>%
	glimpse()

package_test<-c("tidyverse","modelsummary")


library(tidyverse,
				modelsummary)
