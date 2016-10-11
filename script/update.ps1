#!/bin/sh

# script/update: Update application to run for its current checkout.

Resolve-Path "$PSScriptRoot\.."

git pull
git submodule update
