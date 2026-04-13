zip_file <- "J:/Nexford/R and Python/Module 2/Employee_Profile.zip"
output_dir <- "J:/Nexford/R and Python/Module 2/unzipped_data"

# check file exists
if (!file.exists(zip_file)) {
  stop("Zip file not found. Check path.")
}

# create folder
dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

# unzip safely
unzip(zip_file, exdir = output_dir)

# List files in extracted folder
files <- list.files(output_dir, full.names = TRUE)

# Check if files exist
if (length(files) == 0) {
  stop("No files found in the unzipped folder.")
}

files <- list.files("unzipped_data", full.names = TRUE)
print(files)

# Read first CSV file (with safety check)
first_file <- files[1]

if (grepl("\\.csv$", first_file, ignore.case = TRUE)) {
  data <- read.csv(first_file)
  print(head(data))  # shows only first few rows for readability
} else {
  stop("First file is not a CSV file: ", first_file)
}
