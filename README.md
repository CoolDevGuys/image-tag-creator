A simple Github action that helps tagging images to be build and push to a container registry.

### How it works?
The action gets the current $github.ref value which could be the current branch or tag, 
the ref value could be something like: `refs/heads/feature-branch-1` it uses only the "short" 
branch name, in this case would be `feature-branch-1`, and for the tags it's something like this 
`refs/tags/v1.2.3` and it will return `v1.2.3`.

When the branch name has a complex name something like `feature/something-else` it will convert 
the `/` to `-` so the tag value would be `feature-something-else`

### Example
Here an example of using this action to build and push an image to the github registry
```yaml
name: CI Pipelines

on:
  push:
    branches-ignore:
      - main
jobs:
  build-and-push-app-image:
    runs-on: ubuntu-latest
    name: Docker build, tag, push

    steps:
      - name: Checkout
        uses: actions/checkout@v1
      - name: Login to Gihub Packages
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{github.repository_owner}}
          password: ${{secrets.GITHUB_TOKEN}}
      - name: Creating version
        uses: CoolDevGuys/image-tag-creator@1.0.0
        id: image_tag
      - name: Build app image
        id: image_build
        uses: docker/build-push-action@v2
        with:
          push: true
          tags: ghcr.io/${{github.repository}}/app:${{steps.image_tag.outputs.tag}}
```
