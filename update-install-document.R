# load packages
library(tidyverse)
#updates installed pkgs, installs new packages, then updates pkgs.csv to reconcile difference
# -----------------------
# update current packages
# -----------------------
update.packages(ask = FALSE, checkBuilt = TRUE)

# ---------------------------------
# install packages missing packages
# ---------------------------------
pkgs_df <- read_csv("https://raw.githubusercontent.com/pos5737/r-packages/master/pkgs.csv?token=AB4OvpgLeVPeDy9tX_6RtZ40c6dWNc1Vks5bgCu3wA%3D%3D") %>%
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