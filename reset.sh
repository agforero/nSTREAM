#!/bin/bash

echo "deleting contents of /runs/ ..."
cd runs
for d in */ ; do
    rm -r $d
done
echo "done."
