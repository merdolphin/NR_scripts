#!/bin/bash

for f in *_agonist_energy-4
    do
        more $f | grep ${f%%\_agonist\_energy-4} | sort -nk2 | awk '!a[$1]++' | awk '{print $2,$3}' > ${f%%-4}-6-500
    done

for f in *_antagonist_energy-4
    do
        more $f | grep ${f%%\_antagonist\_energy-4} | sort -nk2 | awk '!a[$1]++' | awk '{print $2,$3}' > ${f%%-4}-6-500
    done
    
        

for f in *_agonist_energy-6-500 ; 
    do
        more $f | grep "_agonist" | awk 'BEGIN{a=0;b=0;c=0;d=0;e=0;t=0}{if($1<=-60){a++;t++}if($1<=-50&&$1>-60){b++;t++}if($1<=-40&&$1>-50){c++;t++}if($1<=-30&&$1>-40){d++;t++}if($1>-30){e++;t++}}END{print a*100/t","b*100/t","c*100/t","d*100/t","e*100/t}' > ${f%%\_energy-6-500}
        more $f | grep "antagonist" | awk 'BEGIN{a=0;b=0;c=0;d=0;e=0;t=0}{if($1<=-60){a++;t++}if($1<=-50&&$1>-60){b++;t++}if($1<=-40&&$1>-50){c++;t++}if($1<=-30&&$1>-40){d++;t++}if($1>-30){e++;t++}}END{print a*100/t","b*100/t","c*100/t","d*100/t","e*100/t}' >> ${f%%\_energy-6-500}
    done

for f in *_antagonist_energy-6-500 ; 
    do        
        more $f | grep "_agonist" | awk 'BEGIN{a=0;b=0;c=0;d=0;e=0;t=0}{if($1<=-60){a++;t++}if($1<=-50&&$1>-60){b++;t++}if($1<=-40&&$1>-50){c++;t++}if($1<=-30&&$1>-40){d++;t++}if($1>-30){e++;t++}}END{print a*100/t","b*100/t","c*100/t","d*100/t","e*100/t}' > ${f%%\_energy-6-500}
        more $f | grep "antagonist" | awk 'BEGIN{a=0;b=0;c=0;d=0;e=0;t=0}{if($1<=-60){a++;t++}if($1<=-50&&$1>-60){b++;t++}if($1<=-40&&$1>-50){c++;t++}if($1<=-30&&$1>-40){d++;t++}if($1>-30){e++;t++}}END{print a*100/t","b*100/t","c*100/t","d*100/t","e*100/t}' >> ${f%%\_energy-6-500}

    done
    
    echo 'xlabs <- c ("<=-60","(-60,-50]","(-50,-40]","(-40,-30]",">-30")'

for f in ER_alpha_agonist ER_alpha_antagonist ER_beta_agonist ER_beta_antagonist GR_agonist GR_antagonist MR_agonist MR_antagonist PPAR_alpha_agonist PPAR_alpha_antagonist PPAR_gamma_agonist PPAR_gamma_antagonist PR_agonist PR_antagonist RAR_alpha_agonist RAR_alpha_antagonist ROR_gamma_agonist ROR_gamma_antagonist RXR_alpha_agonist RXR_alpha_antagonist
    do
        echo 'dd1 <- read.table('\"$f\"', header=F, sep = ",")

        png(filename="'$f'.png",
            units="in",
            width=5,
            height=4,
            pointsize=10,
            res=120)
        
        agonistPer <- round(100-dd1$V5[1],digits=1)
        antagonistPer <- round(100-dd1$V5[2],digits=1)

        agonistPerText <-  c(paste("'${f%%_a*gonist}'_agonist (",agonistPer,"%)",sep=''))
        antagonistPerText <-  c(paste("'${f%%_a*gonist}'_antagonist (",antagonistPer,"%)",sep=''))

                  
        barplot(as.matrix(dd1), main="'$f'",
                names.arg=xlabs, ylim=c(0,100),
                beside=TRUE, col=rainbow(2))
        legend("topleft", c(agonistPerText, antagonistPerText),
               cex=0.9, bty="n", fill=rainbow(2))
        
        dev.off()
        
        '
               
    done



