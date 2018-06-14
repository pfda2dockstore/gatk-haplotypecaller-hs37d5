baseCommand: []
class: CommandLineTool
cwlVersion: v1.0
id: gatk-haplotypecaller-hs37d5
inputs:
  bai_in:
    doc: BAI file associated with BAM file
    inputBinding:
      position: 2
      prefix: --bai_in
    type: File
  bam_in:
    doc: 'BAM file to call germline SNPs and indels '
    inputBinding:
      position: 1
      prefix: --bam_in
    type: File
  command_args:
    doc: Specify additional HaplotypeCaller specific arguments
    inputBinding:
      position: 4
      prefix: --command_args
    type: string?
  targets_interval_list:
    doc: Restrict your analysis to specific intervals
    inputBinding:
      position: 5
      prefix: --targets_interval_list
    type: string?
  use_hs37d5:
    default: true
    doc: Select this to use the hs37d5 reference genome (i.e. GRCh37 plus decoy sequences
      and EBV).
    inputBinding:
      position: 6
      prefix: --use_hs37d5
    type: boolean
  vcf_filename:
    default: output
    doc: Prefix that will be used to name the output VCF file.
    inputBinding:
      position: 3
      prefix: --vcf_filename
    type: string
label: GATK HaplotypeCaller + hs37d5
outputs:
  vcf_out:
    doc: 'VCF output file '
    outputBinding:
      glob: vcf_out/*
    type: File
requirements:
- class: DockerRequirement
  dockerOutputDirectory: /data/out
  dockerPull: pfda2dockstore/gatk-haplotypecaller-hs37d5:3
s:author:
  class: s:Person
  s:name: Alan Zhu
