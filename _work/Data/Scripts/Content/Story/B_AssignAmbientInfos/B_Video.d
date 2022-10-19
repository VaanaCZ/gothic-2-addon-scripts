// *********************************
// Sprachausgabe der Video-Sequenzen
// *********************************

func void B_Video()
{
	// ------ Intro ------
	AI_Output (self, other, "INTRO_Xardas_Speech_14_00"); //Un seul prisonnier a changé le destin de plusieurs centaines d'hommes.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_01"); //Mais il a dû payer le prix fort...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_02"); //Il a vaincu le Dormeur, détruit la Barrière...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_03"); //… mais bien que tous les prisonniers se soient échappés, il est resté dans les ruines...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_04"); //C'est moi qui l'ai envoyé contre le Dormeur.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_05"); //C'est moi qui désormais le ramène.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_06"); //Il est faible et a oublié beaucoup de choses.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_07"); //Mais il est vivant...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_08"); //Il est de retour !
	
	// ------ Lagerfeuer ------
	AI_Output (self, other, "INTRO_DiegoGorn_12_00"); //(au campement) Bien sûr qu'il est encore en vie. Qu'est-ce que vous croyiez ?
	AI_Output (self, other, "INTRO_DiegoGorn_11_01"); //Espérons-le...
	AI_Output (self, other, "INTRO_DiegoGorn_12_02"); //(le sol tremble) Avez-vous senti ça ?
	AI_Output (self, other, "INTRO_DiegoGorn_11_03"); //Quoi ?
	AI_Output (self, other, "INTRO_DiegoGorn_12_04"); //Le sol...
	
	
	// ------ Extro ------
	AI_Output (other, self, "Extro_Tempel_15_01"); //(stupéfait) Xardas ! Que...
	AI_Output (other, self, "Extro_Tempel_14_02"); //(plaintif) Pas maintenant...
	AI_Output (other, self, "Extro_Tempel_14_03"); //(avec fanatisme) Je suis prêt... choisissez-moi ! Oui...
	AI_Output (other, self, "Extro_Tempel_15_04"); //(à lui-même) Où est-il ?
	
	// ------ Outro ------
	AI_Output (self, other, "OUTRO_Xardas_14_00"); //(récitant) Et l'homme tua la bête et il pénétra dans le royaume de Béliar...
	AI_Output (other, self, "OUTRO_Xardas_15_01"); //Xardas ! Que s'est-il passé exactement dans le temple d'Irdorath ?
	AI_Output (self, other, "OUTRO_Xardas_14_02"); //Avec l'aide d'Innos, vous avez vaincu l'avatar du Mal.
	AI_Output (self, other, "OUTRO_Xardas_14_03"); //Et j'ai absorbé ses pouvoirs...
	AI_Output (self, other, "OUTRO_Xardas_14_04"); //Depuis que j'ai quitté le Cercle de feu, cela a été mon unique objectif.
	AI_Output (self, other, "OUTRO_Xardas_14_05"); //Pour l'atteindre, je vous ai aidé à accomplir votre destinée.
	AI_Output (self, other, "OUTRO_Xardas_14_06"); //Ce qui m'a été refusé dans le temple du Dormeur est désormais advenu.
	AI_Output (self, other, "OUTRO_Xardas_14_07"); //Béliar m'a choisi.
	AI_Output (other, self, "OUTRO_Xardas_15_08"); //Alors maintenant vous êtes aux ordres du seigneur des ténèbres ?
	AI_Output (self, other, "OUTRO_Xardas_14_09"); //Non, je ne lui obéis pas plus que vous n'obéissez à Innos !
	AI_Output (self, other, "OUTRO_Xardas_14_10"); //Même les dieux ignorent tout de notre destin...
	AI_Output (self, other, "OUTRO_Xardas_14_11"); //Et je ne fais qu'à peine percevoir les choix qui s'offrent à nous...
	AI_Output (self, other, "OUTRO_Xardas_14_12"); //Mais une chose est certaine. Nous nous reverrons...
	
	// ------ Outro Xardas Kapitän ------
	AI_Output (self, other, "OUTRO_Xardas_04_00"); //(il crie) Appareillez !
	
	// ------ Drachenangriff ------
	AI_Output (self, other, "Cutscene_Drachen_04_00"); //(il regarde au loin et voit quelque chose) Hum ?
	AI_Output (self, other, "Cutscene_Drachen_04_01"); //(Il marmonne) Oh ! Merde !
	AI_Output (self, other, "Cutscene_Drachen_04_02"); //(toux douloureuse, étouffement) - (plusieurs)
	AI_Output (self, other, "Cutscene_Drachen_04_03"); //Aaaaargh ! (plusieurs)
	AI_Output (self, other, "Cutscene_Drachen_04_04"); //(long cri d'agonie, 4 secondes)
	
	// ------ OrkSturm ------
	AI_Output (self, other, "Cutscene_OrcSturm_04_00"); //Fermez la porte !!! (plusieurs)
	AI_Output (self, other, "Cutscene_OrcSturm_04_01"); //Arrêtez-les !!! (plusieurs)
	AI_Output (self, other, "Cutscene_OrcSturm_04_02"); //Aaaaargh ! (plusieurs)
	
	// ------ Outro Credits ------
	AI_Output (self, other, "OUTRO_Schiff_12_00"); //Nous sommes surchargés. Nous devons larguer de l'or par-dessus bord.
	AI_Output (other, self, "OUTRO_Schiff_15_01"); //Ne touchez pas à l'or !
	AI_Output (self, other, "OUTRO_Schiff_12_02"); //Ecoutez, il serait préférable de...
	AI_Output (other, self, "OUTRO_Schiff_15_03"); //Je ne veux plus en entendre parler...
	AI_Output (self, other, "OUTRO_Schiff_11_04"); //J'ai entendu dire que la guerre contre les orques se passait mal...
	AI_Output (other, self, "OUTRO_Schiff_15_05"); //Et ?
	AI_Output (self, other, "OUTRO_Schiff_11_06"); //On ne pourra certainement pas dépenser l'or où que ce soit...
	AI_Output (other, self, "OUTRO_Schiff_15_07"); //L'or reste à bord !
	AI_Output (self, other, "OUTRO_Schiff_12_08"); //A quoi nous servira cet or si le bateau coule à la moindre tempête ?
	AI_Output (other, self, "OUTRO_Schiff_15_09"); //Mais je ne vois aucune tempête...
	AI_Output (self, other, "OUTRO_Schiff_12_10"); //Pas ENCORE...
	AI_Output (other, self, "OUTRO_Schiff_15_11"); //Détendez-vous ! Tout se passera très bien !
	
	//ADDON
	AI_Output	(other, self, "DIA_Addon_AddonIntro_15_00"); //(ébahi) ...des humains ?
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_01"); //(avec mépris) Les humains sont faibles.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_02"); //(avec mépris) Ils ne cèdent que trop facilement à la tentation du mal...
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_03"); //...et se retrouvent ainsi mêlés à des puissances qu'ils ne peuvent comprendre, et ne sont guère en mesure de contrôler.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_04"); //Ceux dont la foi est inébranlable ont déjà commencé à combattre l'ennemi...
	
	//ADDON - NEU
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_00"); //Depuis la chute de la Barrière et le bannissement du dormeur, la furie de Beliar est plus intense que jamais auparavant.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_01"); //Un puissant artefact, ainsi est-il écrit dans les écrits anciens, sera ramené parmi les habitants de ce monde.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_02"); //(cite) 'Lorsque le dieu des ténèbres dépêche ses serviteurs à sa recherche'.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_03"); //Or c'est exactement ce qui s'est produit. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_04"); //Cette recherche... a commencé depuis longtemps déjà !
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_05"); //Au cours de leurs recherches, les serviteurs de Beliar profanent les plus anciens sanctuaires des dieux.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_06"); //Les serviteurs de Beliar profanent les plus anciens sanctuaires des dieux.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_07"); //Les veilleurs de ces lieux sacrés se sont éveillés. Et leur furie est ce qui fait trembler la terre !
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_08"); //Parmi les grands magiciens de cette île, nul n'est insensible à cette furie. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_09"); //Et certains parmi eux sont désormais prêts à se dresser contre cette menace.
};
