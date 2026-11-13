library(gh)

# Set your PAT once: gitcreds::gitcreds_set() OR Sys.setenv(GITHUB_PAT = "...")
res <- gh::gh(
  endpoint = "POST /repos/HoldenJe/legendary-couscous/issues",
  title    = "Bug: inputs not validated",
  body     = "Steps to reproduce...\nExpected...\nActual...",
  labels   = c("bug","triage")
)
print(res$html_url)


owner <- "HoldenJe"
repo  <- "legendary-couscous"      
num   <- 1                        

res <- gh::gh(
  "POST /repos/{owner}/{repo}/issues/{issue_number}/comments",
  owner        = owner,
  repo         = repo,
  issue_number = num,
  body         = "Thanks for opening this. We reproduced the bug on v0.3.1.\nNext step: add validation on input parsing."
)

res$html_url


res <- gh::gh(
  "PATCH /repos/{owner}/{repo}/issues/{issue_number}",
   owner        = owner,
  repo         = repo,
  issue_number = num,
  state        = "closed"
)

gh::gh(
  "POST /repos/owner/repo/issues",
  owner = "owner",
  repo = "repo",
  title = "title",
  body = "body text",
  labels = c("bug"),
  assignees = c("username")
)