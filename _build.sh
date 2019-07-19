#!/bin/sh

set -ev

Rscript -e "brocks::blog_gen()"
