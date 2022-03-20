<<<<<<< HEAD
#
=======

    DELETE pmcoworkinghostel FROM coworkinghostel_postmeta pmcoworkinghostel
	LEFT JOIN coworkinghostel_posts wpcoworkinghostel ON wpcoworkinghostel.ID = pmcoworkinghostel.post_id
	WHERE wpcoworkinghostel.ID IS NULL;

    DELETE pmcriptorobo FROM criptorobo_postmeta pmcriptorobo
	LEFT JOIN criptorobo_posts wpcriptorobo ON wpcriptorobo.ID = pmcriptorobo.post_id
	WHERE wpcriptorobo.ID IS NULL;

    DELETE pmcursowp FROM cursowp_postmeta pmcursowp
	LEFT JOIN cursowp_posts wpcursowp ON wpcursowp.ID = pmcursowp.post_id
	WHERE wpcursowp.ID IS NULL;

    DELETE pmf5sites FROM f5sites_postmeta pmf5sites
	LEFT JOIN f5sites_posts wpf5sites ON wpf5sites.ID = pmf5sites.post_id
	WHERE wpf5sites.ID IS NULL;

    DELETE pmfocalizador FROM focalizador_postmeta pmfocalizador
	LEFT JOIN focalizador_posts wpfocalizador ON wpfocalizador.ID = pmfocalizador.post_id
	WHERE wpfocalizador.ID IS NULL;

    DELETE pmfranciscomat FROM franciscomat_postmeta pmfranciscomat
	LEFT JOIN franciscomat_posts wpfranciscomat ON wpfranciscomat.ID = pmfranciscomat.post_id
	WHERE wpfranciscomat.ID IS NULL;

    DELETE pmfranciscomatelli FROM franciscomatelli_postmeta pmfranciscomatelli
	LEFT JOIN franciscomatelli_posts wpfranciscomatelli ON wpfranciscomatelli.ID = pmfranciscomatelli.post_id
	WHERE wpfranciscomatelli.ID IS NULL;

    DELETE pmlojasdomago FROM lojasdomago_postmeta pmlojasdomago
	LEFT JOIN lojasdomago_posts wplojasdomago ON wplojasdomago.ID = pmlojasdomago.post_id
	WHERE wplojasdomago.ID IS NULL;

    DELETE pmpomodoros FROM pomodoros_postmeta pmpomodoros
	LEFT JOIN pomodoros_posts wppomodoros ON wppomodoros.ID = pmpomodoros.post_id
	WHERE wppomodoros.ID IS NULL;

    DELETE pmprojectimer FROM projectimer_postmeta pmprojectimer
	LEFT JOIN projectimer_posts wpprojectimer ON wpprojectimer.ID = pmprojectimer.post_id
	WHERE wpprojectimer.ID IS NULL;

    DELETE pmtreinamentoemfoco FROM treinamentoemfoco_postmeta pmtreinamentoemfoco
	LEFT JOIN treinamentoemfoco_posts wptreinamentoemfoco ON wptreinamentoemfoco.ID = pmtreinamentoemfoco.post_id
	WHERE wptreinamentoemfoco.ID IS NULL;

    DELETE pmvamoslonge FROM vamoslonge_postmeta pmvamoslonge
	LEFT JOIN vamoslonge_posts wpvamoslonge ON wpvamoslonge.ID = pmvamoslonge.post_id
	WHERE wpvamoslonge.ID IS NULL;

    DELETE pmveraoitacare FROM veraoitacare_postmeta pmveraoitacare
	LEFT JOIN veraoitacare_posts wpveraoitacare ON wpveraoitacare.ID = pmveraoitacare.post_id
	WHERE wpveraoitacare.ID IS NULL;

>>>>>>> f9134aa55d960a6b6eaa0866da41588b68f62e25
