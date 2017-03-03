#!/bin/bash

: ${OPENSCAD:="openscad"}
: ${CONVERTSTL:="../../../../openforge/bin/convertSTL.rb"}

for x in {2..4}
do
	$OPENSCAD -o magnetic_base.${x}x${x}.corner.external.stl \
			-D "x=$x" -D "y=$x" -D 'back_edge="true"' -D 'right_edge="true"' \
			../magnetic_base.square.scad
	$CONVERTSTL magnetic_base.${x}x${x}.corner.external.stl
	mv magnetic_base.${x}x${x}.corner.external-binary.stl magnetic_base.${x}x${x}.corner.external.stl
done

