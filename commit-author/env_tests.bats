#!/usr/bin/env bats
# bats file_tags=skills:commit-author

load "/usr/lib/bats/bats-support/load"
load "/usr/lib/bats/bats-assert/load"
load "/usr/lib/bats/bats-file/load"

@test "gawk exists" {
	command -v gawk
}

@test "rumdl exists" {
	command -v rumdl
}
