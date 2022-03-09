Copy Add Sandbox
---

# Description
This sandbox demos the effects of using copy, add and multistage dockerfiles on the images size. Dive is used to analyze the image at the end of each scenario.

# Prerequisites
- bash
- GNU make
- docker
- [dive](https://github.com/wagoodman/dive)

# Scenarios
## With Copy
This a 500MB archive is copied into the image via COPY command. It is then extracted to a directory. This creates a 1GB image.

Test with:  `make with-copy`

## With Copy Multistage
In one stage of the Dockerfile, a 500MB archive is copied into the image via COPY command. It is then extracted to a directory. In the second stage, the unarchived data is copied via the `COPY --from=<>` command. This creates a 500MB image

Test with:  `make with-copy-multistage`

## With Add
This a 500MB archive is copied and unachieved in one step via the ADD command.  This creates a 500MB image.

Test with:  `make with-add`

## Clean
`make clean`
