#### Renaming images ####

#connecting to gitub


usethis::use_github()

Sys.setenv(
  PATH = paste(
    "C:/exiftool-13.41_64",
    Sys.getenv("PATH"),
    sep = ";"
  )
)
Sys.which("exiftool")

library(camtrapR)

#defining file paths

#location of raw images
wd_images_raw <-("F:/DCIM")

#where renamed images will go
raw_images_renamed <- ("E:/BHP_renamed")

#copying, renaming and relocating the images
renaming.table2 <- imageRename(inDir               = wd_images_raw,
                               outDir              = raw_images_renamed,
                               hasCameraFolders    = FALSE,
                               copyImages          = TRUE
)
