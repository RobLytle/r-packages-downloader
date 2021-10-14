# load packages
#updates installed pkgs, installs new packages, then updates pkgs.csv to reconcile difference
# -----------------------
# update current packages
# -----------------------
update.packages(ask = FALSE, checkBuilt = TRUE)

# ---------------------------------
# install missing packages
# ---------------------------------
pkgs_df <- read.csv("https://raw.githubusercontent.com/RobLytle/r-packages-downloader/master/pkgs.csv")
packages <- pkgs_df$package
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
	install.packages(setdiff(packages, rownames(installed.packages())))  
}

# ----------------------------------
# create a df of packages on machine
# ----------------------------------
library(magrittr)
packages <- data.frame(installed.packages(), stringsAsFactors = FALSE) %>%
	dplyr::select(package = Package, version = Version) %>%
	readr::write_csv("pkgs.csv")
