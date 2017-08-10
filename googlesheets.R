require("googlesheets")

### Authorisation
## Not run:
## load/refresh existing credentials, if available
## otherwise, go to browser for authentication and authorization
 gs_auth()
## force a new token to be obtained
 gs_auth(new_user = TRUE)
## store token in an object and then to file
 google_token <- gs_auth()
 saveRDS(google_token, ".google_token.rds")
## load a pre-existing token
# gs_auth(token = google_token) # from an object
gs_auth(token = ".google_token.rds") # from .rds file
## End(Not run)


# list sheets
gs_ls()
# Define sheet name 
x = c("Friends") # names of the sheet on the drive (registered gogle sheet)
# Create pointer to the googlesheet
y = gs_title(x, verbose = TRUE) 
# Download
gs_download(from = y, ws = NULL, to = "./GoogleDrive/test.csv", overwrite = FALSE,
            verbose = TRUE)
# Copy sheet on the drive
# z <- gs_copy(from = y, to = "Friends_test", verbose = TRUE)
# view the sheet in the browser
# gs_browse(y, ws = 1)
# delete the sheet
# gs_delete(z)


# Read data from googlesheet into data frame
dataFrame <- gs_read(y)

# Rename googlesheet
gs_rename(ss = y, to = "FriendsTwo", verbose = FALSE)




gs_upload(file = "./dics/dics_clean.csv", sheet_title = NULL, verbose = TRUE, overwrite = FALSE)

## Not run:
foo <- gs_new("new_sheet")
#

gs_ls()
sheet_name <- c("Friends")
google_sheet = gs_title(sheet_name, verbose = TRUE) 
gs_copy(from = google_sheet, to = "Friends_test", verbose = TRUE)
google_copy_sheet = gs_title("Friends_test", verbose = TRUE) 
gs_delete(google_copy_sheet)

gs_upload(file = "./dics/Friends.csv", sheet_title = NULL,
          verbose = TRUE, overwrite = FALSE)



foo <- gs_new()
foo
gs_delete(foo)

