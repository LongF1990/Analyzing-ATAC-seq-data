#!/bin/bash
macs2 callpeak -t W82_ATAC_downsample.bam -c W82Input_downsample.bam --nomodel --shift -100 --extsize 200 -f BAM -n W82 -g 906849215 --outdir W82 -q 0.01 --keep-dup all > W82.out 2>&1 &
macs2 callpeak -t W05_ATAC_downsample.bam -c W05Input.bam --nomodel --shift -100 --extsize 200 -f BAM -n W05 -g 841384692 --outdir W05 -q 0.01 --keep-dup all > W05.out 2>&1 &
