resource "github_repository" "example" {
  name        = "first-repo-from-terraform"
  description = "test repo by sai"
  visibility = "public"
  auto_init = true
  //auto_init - (Optional) Set to true to produce an initial commit in the repository.
}
resource "github_repository" "secondexample" {
  name        = "second-repo-from-terraform"
  description = "test repo by sai"
  visibility = "public"
  auto_init = true
  
}