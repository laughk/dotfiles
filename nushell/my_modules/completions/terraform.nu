# # terraform: Prepare your working directory for other commands
# export extern "terraform init" [
#  ...args
# ]
# 
# # terraform: Check whether the configuration is valid
# export extern "terraform validate" [
#  ...args
# ]
# 
# # terraform: Show changes required by the current configuration
# export extern "terraform plan" [
#  ...args
# ]
# 
# # terraform: Create or update infrastructure
# export extern "terraform apply" [
#  ...args
# ]
# 
# # terraform: Destroy previously-created infrastructure
# export extern "terraform destroy" [
#  ...args
# ]
# 
# # terraform: Try Terraform expressions at an interactive command prompt
# export extern "terraform console" [
#  ...args
# ]
# 
# # terraform: Reformat your configuration in the standard style
# export extern "terraform fmt" [
#   --list(-list):bool    # Don't list files whose formatting differs (always disabled if using STDIN)
#   --write(-write):bool   # Don't write to source files (always disabled if using STDIN or -check)
#   --diff(-diff)         # Display diffs of formatting changes
#   --check(-check)        # Check if the input is formatted. Exit status will be 0 if all input is properly formatted and non-zero otherwise.
#   --no-color(-no-color)     # If specified, output won't contain any color.
#   --recursive(-recursive)    # Also process files in subdirectories. By default, only the given directory (or current directory) is processed.
# ]
# 
# # terraform: Release a stuck lock on the current workspace
# export extern "terraform force-unlock" [
#  ...args
# ]
# 
# # terraform: Install or upgrade remote Terraform modules
# export extern "terraform get" [
#  ...args
# ]
# 
# # terraform: Generate a Graphviz graph of the steps in an operation
# export extern "terraform graph" [
#  ...args
# ]
# 
# # terraform: Associate existing infrastructure with a Terraform resource
# export extern "terraform import" [
#  ...args
# ]
# 
# # terraform: Obtain and save credentials for a remote host
# export extern "terraform login" [
#  ...args
# ]
# 
# # terraform: Remove locally-stored credentials for a remote host
# export extern "terraform logout" [
#  ...args
# ]
# 
# # terraform: Show output values from your root module
# export extern "terraform output" [
#  ...args
# ]
# 
# # terraform: Show the providers required for this configuration
# export extern "terraform providers" [
#  ...args
# ]
# 
# # terraform: Update the state to match remote systems
# export extern "terraform refresh" [
#  ...args
# ]
# 
# # terraform: Show the current state or a saved plan
# export extern "terraform show" [
#  ...args
# ]
# 
# # terraform: Advanced state management
# export extern "terraform state" [
#  ...args
# ]
# 
# # terraform: Mark a resource instance as not fully functional
# export extern "terraform taint" [
#  ...args
# ]
# 
# # terraform: Experimental support for module integration testing
# export extern "terraform test" [
#  ...args
# ]
# 
# # terraform: Remove the 'tainted' state from a resource instance
# export extern "terraform untaint" [
#  ...args
# ]
# 
# # terraform: Show the current Terraform version
# export extern "terraform version" [
#  ...args
# ]
# 
# # terraform: Workspace management
# export extern "terraform workspace" [
#  ...args
# ]
