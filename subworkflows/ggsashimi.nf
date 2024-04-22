process ggsashimi_plot {
    label "ggsashimi_plot"
    input:
        file ref_annotation
        string chromosome
        int start_locus
        int end_locus
        tuple bam
    output:
        file("sahimi.pdf")
    script:
        """
        ggsashimi_plot.py -c ${chromosome}:${start_locus}-${end_locus} -g ${ref_annotation} -M 10 -C 3 -O 3
        """
}

workflow ggsashimi {
    take:
        bam
        ref_annotation
        chromosome
        start_locus
        end_locus
    main:
        ggsashimi_plot(bam, ref_annotation, chromosome, start_locus, end_locus)
}