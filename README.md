A simple Github action that helps tagging images to be build and push to a container registry.

### How it works?
The action gets the current $github.ref value which could be the current branch or tag, 
the ref value could be something like: `refs/heads/feature-branch-1` it uses only the "short" 
branch name, in this case would be `feature-branch-1`, and for the tags it's something like this 
`refs/tags/v1.2.3` and it will return `v1.2.3`.

When the branch name has a complex name something like `feature/something-else` it will convert 
the `/` to `-` so the tag value would be `feature-something-else`
