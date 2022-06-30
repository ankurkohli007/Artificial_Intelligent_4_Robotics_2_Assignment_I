(define (problem warehousetaskplannerproblem3)
    (:domain warehousetaskplanner)
    (:objects
        h - heavy
        l1 l2 - light
        f1 f2 f3 f4 - fragile
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
        ;Crate in group B for extension 1
        (crate-initial-position f4)
        (crate-initial-position f3)
        (crate-initial-position f2)
        ;Crate in group A for extension 1
        (crate-initial-position f1)
        (crate-initial-position l1)
        ;Crate in no group 
        (crate-initial-position l2)

        ;Crate in group B for extension 1 
        (= (wt-of-crate f4) 30)
        (= (wt-of-crate f3) 20)
        (= (wt-of-crate f2) 30)
        ;Crate in group A for extension 1 
        (= (wt-of-crate f1) 20)
        (= (wt-of-crate l1) 30)        
        ;Crate in no group 
        (= (wt-of-crate l2) 10)

        ;Crate in group B for extension 1 
        (= (dis-of-crate f4) 10)
        (= (dis-of-crate f3) 20)
        (= (dis-of-crate f2) 30)
        ;Crate in group A for extension 1 
        (= (dis-of-crate f1) 20)
        (= (dis-of-crate l1) 20)        
        ;Crate in no group 
        (= (dis-of-crate l2) 10)
    )

    (:goal
        (and (crate-placed-convyrbelt f4)
             (crate-placed-convyrbelt f3)
             (crate-placed-convyrbelt f2)
             ;Crate in group B for extension 1 
             (crate-placed-convyrbelt f1)
             (crate-placed-convyrbelt l1)
             ;Crate in group B for extension 1 
             (crate-placed-convyrbelt l2)
             ;Crate in no group 
        )
    )

    (:metric minimize
        (total-time)
    )
)
