rule zipf_test:
    input:
        zipf =  'source/zipf_test.py',
        book1 = 'processed_data/isles.dat',
        book2 = 'processed_data/abyss.dat',
        book3 = 'processed_data/last.dat'
    output:
        'results/results.txt'
    shell:
        'python {input.zipf} {input.book1} {input.book2} {input.book3} > {output}'

rule alldata:
     input:
         'processed_data/isles.dat',
         'processed_data/abyss.dat',
         'processed_data/last.dat'

rule clean:
    shell: 'rm -f processed_data/*.dat results/results.txt'

# Count words.
rule count_words:
    input: 'data/abyss.txt','source/wordcount.py'
    output: 'processed_data/abyss.dat'
    shell: 'python source/wordcount.py data/abyss.txt processed_data/abyss.dat'

rule count_words_isles:
     input:  'data/isles.txt','source/wordcount.py'
     output: 'processed_data/isles.dat'
     shell:  'python source/wordcount.py data/isles.txt processed_data/isles.dat'

rule count_words_last:
     input:  'data/last.txt','source/wordcount.py'
     output: 'processed_data/last.dat'
     shell:  'python source/wordcount.py data/last.txt processed_data/last.dat'

