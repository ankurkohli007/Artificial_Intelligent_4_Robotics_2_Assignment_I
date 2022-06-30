(define (problem warehousetaskplannerproblem2)
    (:domain warehousetaskplanner)
    (:objects
        h1 h2 - heavy
        l1 l2 - light
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
        (crate-initial-position h1)
        (crate-initial-position h2)
        ;Crate in group B for extension 1 
        (crate-initial-position l1)
        (crate-initial-position l2)

        ;Crate in group A for extension 1 
        (= (wt-of-crate h1) 70)
        (= (wt-of-crate h2) 80)
        ;Crate in group B for extension 1 
        (= (wt-of-crate l1) 20)
        (= (wt-of-crate l2) 30)
      
        ;Crate in group A for extension 1 
        (= (dis-of-crate h1) 10)
        (= (dis-of-crate h2) 20)
        ;Crate in group B for extension 1 
        (= (dis-of-crate l1) 20)
        (= (dis-of-crate l2) 10)
    )


    (:goal
        (and (crate-placed-convyrbelt h1)
             (crate-placed-convyrbelt h2)
             ;Crate in group A for extension 1 
             (crate-placed-convyrbelt l1)
             (crate-placed-convyrbelt l2)
             ;Crate in group B for extension 1 
        )
    )

    (:metric minimize
        (total-time)
    )
)
