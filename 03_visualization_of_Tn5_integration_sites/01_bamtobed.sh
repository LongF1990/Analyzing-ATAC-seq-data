#!/bin/bash
bedtools bamtobed -i W82_ATAC.bam > W82_ATAC.bed &
bedtools bamtobed -i W05_ATAC.bam > W05_ATAC.bed &
