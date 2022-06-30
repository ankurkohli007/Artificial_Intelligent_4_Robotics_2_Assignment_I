(define (problem warehousetaskplannerproblem1)
    (:domain warehousetaskplanner)
    (:objects
        h - heavy
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
        (crate-initial-position l1)
        ;Crate in no group  
        (crate-initial-position h)
         
        ;Crate in group A for extension 1 
        (= (wt-of-crate f) 20)
        (= (wt-of-crate l1) 20)
        ;Crate in no group 
        (= (wt-of-crate h) 70)
      
        ;Crate in group A for extension 1 
        (= (dis-of-crate f) 20)
        (= (dis-of-crate l1) 20)
        ;;Crate in no group 
        (= (dis-of-crate h) 10)
    )

    (:goal
        (and (crate-placed-convyrbelt f)
             (crate-placed-convyrbelt l1)
             ;Crate in group A for extension 1 
             (crate-placed-convyrbelt h)
             ;Crate in no group 
        )
    )
    
    (:metric minimize
        (total-time)
    )
)
