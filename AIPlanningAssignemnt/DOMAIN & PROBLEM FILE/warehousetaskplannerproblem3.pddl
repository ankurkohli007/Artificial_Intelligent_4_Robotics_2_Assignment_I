(define (problem warehousetaskplannerproblem3)
    (:domain warehousetaskplanner)
    (:objects
        h1 h2 - heavy
        l1 - light
        f - fragile
        mvr1 - mover1
        mvr2 - mover2
        l - loader
    )

    (:init
        (empty-top-mover mvr1)
        (empty-top-mover mvr2)
        (idleloader l)
        (mover-placed-loadingbay mvr1)
        (mover-placed-loadingbay mvr2)
        ;Crate in group A for extension 1
        (crate-initial-position f)
        (crate-initial-position h1)
        (crate-initial-position h2)
        ;Crate in no group 
        (crate-initial-position l1)
        
        
	 ;Crate in group A for extension 1 
        (= (wt-of-crate f) 80)
        (= (wt-of-crate h1) 70)
        (= (wt-of-crate h2) 60)
        ;Crate in no group 
        (= (wt-of-crate l1) 30)
        
        ;Crate in group A for extension 1 
        (= (dis-of-crate f) 20)
        (= (dis-of-crate h1) 20)
        (= (dis-of-crate h2) 30)
        ;Crate in no group 
        (= (dis-of-crate l1) 10)
    )

    (:goal
        (and (crate-placed-convyrbelt f)
             (crate-placed-convyrbelt h1)
             (crate-placed-convyrbelt h2)
             ;Crate in group A for extension 1 
             (crate-placed-convyrbelt l1)
             ;Crate in no group 
        )
    )

    (:metric minimize
        (total-time)
    )
)
