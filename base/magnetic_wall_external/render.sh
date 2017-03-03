#!/bin/bash

: ${OPENSCAD:="openscad"}
: ${CONVERTSTL:="../../../../openforge/bin/convertSTL.rb"}

for x in {1..4}
do
	for y in {1..4}
	do
		$OPENSCAD -o magnetic_base.${x}x${y}.wall.external.stl \
				-D "x=$x" -D "y=$y" -D 'back_edge="true"' \
				../magnetic_base.square.scad
		$CONVERTSTL magnetic_base.${x}x${y}.wall.external.stl
		mv magnetic_base.${x}x${y}.wall.external-binary.stl magnetic_base.${x}x${y}.wall.external.stl
	done
done

