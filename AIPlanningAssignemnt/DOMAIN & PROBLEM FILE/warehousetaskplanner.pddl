(define (domain warehousetaskplanner)
    (:requirements :strips :typing :negative-preconditions :durative-actions :numeric-fluents)
    (:types
        crate mover loader - objects
        heavy light fragile - crate
        mover1 mover2 - mover
        loader - loader
    )

    (:predicates
        (carrying-lightcrate ?mvr - mover ?c - light)
        (carrying-heavycrate ?mvr1 ?mvr2 - mover ?c - heavy)
        (carrying-fragilecrate ?mvr1 ?mvr2 - mover ?c - fragile)
        (idleloader ?l - loader)
        (empty-top-mover ?mvr - mover)
        (mover-placed-loadingbay ?mvr - mover)
        (mover-at-crate ?mvr - mover ?c - crate)
        (crate-initial-position ?c - crate)
        (crate-placed-loadingbay ?c - crate)
        (crate-placed-convyrbelt ?c - crate)
    )

    (:functions
        (dis-of-crate ?c - crate)
        (wt-of-crate ?c - crate)
    )

    (:durative-action carry-heavycrate-towards-bay 
        :parameters (?mvr1 - mover1 ?mvr2 - mover2 ?c - heavy ?l - loader)
        :duration (= ?duration (/ (* (dis-of-crate ?c)(wt-of-crate ?c)) 100))
        :condition (and (at start (not (mover-placed-loadingbay ?mvr1)))
                        (at start (not (mover-placed-loadingbay ?mvr2)))
                        (over all (carrying-heavycrate ?mvr1 ?mvr2 ?c))
                        (at end (idleloader ?l))
                        )
        :effect (and (at end  (mover-placed-loadingbay ?mvr1))
                     (at end  (mover-placed-loadingbay ?mvr2)))
    )

    (:durative-action carry-lightcrate-towards-bay
        :parameters (?mvr - mover ?c - light ?l - loader)
        :duration (= ?duration (/ (* (dis-of-crate ?c)(wt-of-crate ?c)) 100))
        :condition (and (at start (not (mover-placed-loadingbay ?mvr)))
                        (over all (carrying-lightcrate ?mvr ?c))
                        (at end (idleloader ?l))
                        )
        :effect (and (at end  (mover-placed-loadingbay ?mvr)))
    )
    
    
    (:durative-action carry-fragilecrate-towards-bay 
        :parameters (?mvr1 - mover1 ?mvr2 - mover2 ?c - fragile ?l - loader)
        :duration (= ?duration (/ (* (dis-of-crate ?c)(wt-of-crate ?c)) 100))
        :condition (and (at start (not (mover-placed-loadingbay ?mvr1)))
                        (at start (not (mover-placed-loadingbay ?mvr2)))
                        (over all (carrying-fragilecrate ?mvr1 ?mvr2 ?c))
                        (at end (idleloader ?l))
                        )
        :effect (and (at end  (mover-placed-loadingbay ?mvr1))
                     (at end  (mover-placed-loadingbay ?mvr2)))
    )
    
    
    (:durative-action mover-towards-heavy-crate
        :parameters (?mvr1 - mover1 ?mvr2 - mover2 ?c - heavy)
        :duration (= ?duration (/ (dis-of-crate ?c) 10))
        :condition (and (at start (empty-top-mover ?mvr1))
                        (at start (empty-top-mover ?mvr2))
                        (at start (mover-placed-loadingbay ?mvr1))
                        (at start (not (mover-at-crate ?mvr1 ?c)))
                        (at start (mover-placed-loadingbay ?mvr2))
                        (at start (not (mover-at-crate ?mvr2 ?c)))
                        (over all (crate-initial-position ?c)))
        :effect (and (at end (not (mover-placed-loadingbay ?mvr1)))
                     (at end (mover-at-crate ?mvr1 ?c))
                     (at end (not (mover-placed-loadingbay ?mvr2)))
                     (at end (mover-at-crate ?mvr2 ?c)))
    )

    (:durative-action mover-towards-light-crate
        :parameters (?mvr - mover ?c - light)
        :duration (= ?duration (/ (dis-of-crate ?c) 10))
        :condition (and (at start (empty-top-mover ?mvr))
                        (at start (mover-placed-loadingbay ?mvr))
                        (at start (not (mover-at-crate ?mvr ?c)))
                        (over all (crate-initial-position ?c)))
        :effect (and (at end (not (mover-placed-loadingbay ?mvr)))
                     (at end (mover-at-crate ?mvr ?c)))
    )
    
    
    (:durative-action mover-towards-fragile-crate
        :parameters (?mvr1 - mover1 ?mvr2 - mover2 ?c - fragile)
        :duration (= ?duration (/ (dis-of-crate ?c) 10))
        :condition (and (at start (empty-top-mover ?mvr1))
                        (at start (empty-top-mover ?mvr2))
                        (at start (mover-placed-loadingbay ?mvr1))
                        (at start (not (mover-at-crate ?mvr1 ?c)))
                        (at start (mover-placed-loadingbay ?mvr2))
                        (at start (not (mover-at-crate ?mvr2 ?c)))
                        (over all (crate-initial-position ?c)))
        :effect (and (at end (not (mover-placed-loadingbay ?mvr1)))
                     (at end (mover-at-crate ?mvr1 ?c))
                     (at end (not (mover-placed-loadingbay ?mvr2)))
                     (at end (mover-at-crate ?mvr2 ?c)))
    )
    
    
    (:durative-action mover-pickup-heavycrate
        :parameters (?mvr1 - mover1 ?mvr2 - mover2 ?c - heavy)
        :duration (= ?duration 2)
        :condition (and (at start (crate-initial-position ?c)) 
                        (over all (mover-at-crate ?mvr1 ?c))
                        (over all (mover-at-crate ?mvr2 ?c))
                        (at start (empty-top-mover ?mvr1))
                        (at start (empty-top-mover ?mvr2)))
        :effect (and (at end (not (empty-top-mover ?mvr1)))
                     (at end (not (empty-top-mover ?mvr2)))
                     (at end (carrying-heavycrate ?mvr1 ?mvr2 ?c))
                     (at end (not (crate-initial-position ?c))))
    )
    
    
    (:durative-action mover-drop-heavycrate-at-loadingbay
        :parameters (?mvr1 - mover1 ?mvr2 - mover2 ?c - heavy)
        :duration (= ?duration 2)
        :condition (and (at start (carrying-heavycrate ?mvr1 ?mvr2 ?c))
                        (over all (mover-placed-loadingbay ?mvr1))
                        (over all (mover-placed-loadingbay ?mvr2)))
        :effect (and (at end (not (carrying-heavycrate ?mvr1 ?mvr2 ?c)))
                     (at end (crate-placed-loadingbay ?c))
                     (at end (empty-top-mover ?mvr1))
                     (at end (empty-top-mover ?mvr2)))
    )
    
    
    (:durative-action mover-pickup-lightcrate
        :parameters (?mvr - mover ?c - light)
        :duration (= ?duration 1)
        :condition (and (at start (empty-top-mover ?mvr))
                        (over all (mover-at-crate ?mvr ?c))
                        (at start (crate-initial-position ?c)))
        :effect (and (at end (not (empty-top-mover ?mvr))) 
                     (at end (not (crate-initial-position ?c)))
                     (at end (carrying-lightcrate ?mvr ?c)))
    )

    (:durative-action mover-drop-lightcrate-at-loadingbay
        :parameters (?mvr - mover ?c - light)
        :duration (= ?duration 1)
        :condition (and (at start (carrying-lightcrate ?mvr ?c)) 
                        (over all (mover-placed-loadingbay ?mvr)))
        :effect (and (at start (not (carrying-lightcrate ?mvr ?c))) 
                        (at end (crate-placed-loadingbay ?c))
                        (at end (empty-top-mover ?mvr)))
    )

    (:durative-action mover-pickup-fragilecrate
        :parameters (?mvr1 - mover1 ?mvr2 - mover2 ?c - fragile)
        :duration (= ?duration 4)
        :condition (and (at start (crate-initial-position ?c)) 
                        (over all (mover-at-crate ?mvr1 ?c))
                        (over all (mover-at-crate ?mvr2 ?c))
                        (at start (empty-top-mover ?mvr1))
                        (at start (empty-top-mover ?mvr2)))
        :effect (and (at end (not (empty-top-mover ?mvr1)))
                     (at end (not (empty-top-mover ?mvr2)))
                     (at end (carrying-fragilecrate ?mvr1 ?mvr2 ?c))
                     (at end (not (crate-initial-position ?c))))
    )    
      
    (:durative-action mover-drop-fragilecrate-at-loadingbay
        :parameters (?mvr1 - mover1 ?mvr2 - mover2 ?c - fragile)
        :duration (= ?duration 4)
        :condition (and (at start (carrying-fragilecrate ?mvr1 ?mvr2 ?c))
                        (over all (mover-placed-loadingbay ?mvr1))
                        (over all (mover-placed-loadingbay ?mvr2)))
        :effect (and (at end (not (carrying-fragilecrate ?mvr1 ?mvr2 ?c)))
                     (at end (crate-placed-loadingbay ?c))
                     (at end (empty-top-mover ?mvr1))
                     (at end (empty-top-mover ?mvr2)))
    )

    (:durative-action loading-crate-on-conveyorbelt
        :parameters (?l - loader ?c - crate)
        :duration (= ?duration 6)
        :condition (and (at start (crate-placed-loadingbay ?c))
                        (at start (not (crate-placed-convyrbelt ?c))))
        :effect (and (at end (not (crate-placed-loadingbay ?c)))
                     (at end (crate-placed-convyrbelt ?c))
                     (at start (not (idleloader ?l)))
                     (at end (idleloader ?l)))
                     
    )
)
