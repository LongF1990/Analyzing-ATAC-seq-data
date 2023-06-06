#!/bin/bash
wellington_footprints.py -p 20 -A -o W82 W82_peaks_deal.bed ../W82_ATAC.bam ./footprint &
wellington_footprints.py -p 20 -A -o W05 W05_peaks_deal.bed ../W05_ATAC.bam ./footprint &
