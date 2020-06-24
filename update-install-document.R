# load packages
library(tidyverse)
#updates installed pkgs, installs new packages, then updates pkgs.csv to reconcile difference
# -----------------------
# update current packages
# -----------------------
update.packages(ask = FALSE, checkBuilt = TRUE)

# ---------------------------------
# install missing packages
# ---------------------------------
pkgs_df <- read_csv("https://raw.githubusercontent.com/RobLytle/r-packages-downloader/master/pkgs.csv") %>%
	glimpse()
packages <- pkgs_df$package
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
	install.packages(setdiff(packages, rownames(installed.packages())))  
}

# ----------------------------------
# create a df of packages on machine
# ----------------------------------
packages <- data.frame(installed.packages(), stringsAsFactors = FALSE) %>%
	select(package = Package, version = Version) %>%
	write_csv("pkgs.csv") %>%
	glimpse()