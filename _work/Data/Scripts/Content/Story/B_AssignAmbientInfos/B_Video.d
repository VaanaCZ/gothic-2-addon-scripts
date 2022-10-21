// *********************************
// Sprachausgabe der Video-Sequenzen
// *********************************

func void B_Video()
{
	// ------ Intro ------
	AI_Output (self, other, "INTRO_Xardas_Speech_14_00"); //Un seul prisonnier a chang� le destin de plusieurs centaines d'hommes.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_01"); //Mais il a d� payer le prix fort...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_02"); //Il a vaincu le Dormeur, d�truit la Barri�re...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_03"); //� mais bien que tous les prisonniers se soient �chapp�s, il est rest� dans les ruines...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_04"); //C'est moi qui l'ai envoy� contre le Dormeur.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_05"); //C'est moi qui d�sormais le ram�ne.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_06"); //Il est faible et a oubli� beaucoup de choses.
	AI_Output (self, other, "INTRO_Xardas_Speech_14_07"); //Mais il est vivant...
	AI_Output (self, other, "INTRO_Xardas_Speech_14_08"); //Il est de retour !
	
	// ------ Lagerfeuer ------
	AI_Output (self, other, "INTRO_DiegoGorn_12_00"); //(au campement) Bien s�r qu'il est encore en vie. Qu'est-ce que vous croyiez ?
	AI_Output (self, other, "INTRO_DiegoGorn_11_01"); //Esp�rons-le...
	AI_Output (self, other, "INTRO_DiegoGorn_12_02"); //(le sol tremble) Avez-vous senti �a ?
	AI_Output (self, other, "INTRO_DiegoGorn_11_03"); //Quoi ?
	AI_Output (self, other, "INTRO_DiegoGorn_12_04"); //Le sol...
	
	
	// ------ Extro ------
	AI_Output (other, self, "Extro_Tempel_15_01"); //(stup�fait) Xardas ! Que...
	AI_Output (other, self, "Extro_Tempel_14_02"); //(plaintif) Pas maintenant...
	AI_Output (other, self, "Extro_Tempel_14_03"); //(avec fanatisme) Je suis pr�t... choisissez-moi ! Oui...
	AI_Output (other, self, "Extro_Tempel_15_04"); //(� lui-m�me) O� est-il ?
	
	// ------ Outro ------
	AI_Output (self, other, "OUTRO_Xardas_14_00"); //(r�citant) Et l'homme tua la b�te et il p�n�tra dans le royaume de B�liar...
	AI_Output (other, self, "OUTRO_Xardas_15_01"); //Xardas ! Que s'est-il pass� exactement dans le temple d'Irdorath ?
	AI_Output (self, other, "OUTRO_Xardas_14_02"); //Avec l'aide d'Innos, vous avez vaincu l'avatar du Mal.
	AI_Output (self, other, "OUTRO_Xardas_14_03"); //Et j'ai absorb� ses pouvoirs...
	AI_Output (self, other, "OUTRO_Xardas_14_04"); //Depuis que j'ai quitt� le Cercle de feu, cela a �t� mon unique objectif.
	AI_Output (self, other, "OUTRO_Xardas_14_05"); //Pour l'atteindre, je vous ai aid� � accomplir votre destin�e.
	AI_Output (self, other, "OUTRO_Xardas_14_06"); //Ce qui m'a �t� refus� dans le temple du Dormeur est d�sormais advenu.
	AI_Output (self, other, "OUTRO_Xardas_14_07"); //B�liar m'a choisi.
	AI_Output (other, self, "OUTRO_Xardas_15_08"); //Alors maintenant vous �tes aux ordres du seigneur des t�n�bres ?
	AI_Output (self, other, "OUTRO_Xardas_14_09"); //Non, je ne lui ob�is pas plus que vous n'ob�issez � Innos !
	AI_Output (self, other, "OUTRO_Xardas_14_10"); //M�me les dieux ignorent tout de notre destin...
	AI_Output (self, other, "OUTRO_Xardas_14_11"); //Et je ne fais qu'� peine percevoir les choix qui s'offrent � nous...
	AI_Output (self, other, "OUTRO_Xardas_14_12"); //Mais une chose est certaine. Nous nous reverrons...
	
	// ------ Outro Xardas Kapit�n ------
	AI_Output (self, other, "OUTRO_Xardas_04_00"); //(il crie) Appareillez !
	
	// ------ Drachenangriff ------
	AI_Output (self, other, "Cutscene_Drachen_04_00"); //(il regarde au loin et voit quelque chose) Hum ?
	AI_Output (self, other, "Cutscene_Drachen_04_01"); //(Il marmonne) Oh ! Merde !
	AI_Output (self, other, "Cutscene_Drachen_04_02"); //(toux douloureuse, �touffement) - (plusieurs)
	AI_Output (self, other, "Cutscene_Drachen_04_03"); //Aaaaargh ! (plusieurs)
	AI_Output (self, other, "Cutscene_Drachen_04_04"); //(long cri d'agonie, 4 secondes)
	
	// ------ OrkSturm ------
	AI_Output (self, other, "Cutscene_OrcSturm_04_00"); //Fermez la porte !!! (plusieurs)
	AI_Output (self, other, "Cutscene_OrcSturm_04_01"); //Arr�tez-les !!! (plusieurs)
	AI_Output (self, other, "Cutscene_OrcSturm_04_02"); //Aaaaargh ! (plusieurs)
	
	// ------ Outro Credits ------
	AI_Output (self, other, "OUTRO_Schiff_12_00"); //Nous sommes surcharg�s. Nous devons larguer de l'or par-dessus bord.
	AI_Output (other, self, "OUTRO_Schiff_15_01"); //Ne touchez pas � l'or !
	AI_Output (self, other, "OUTRO_Schiff_12_02"); //Ecoutez, il serait pr�f�rable de...
	AI_Output (other, self, "OUTRO_Schiff_15_03"); //Je ne veux plus en entendre parler...
	AI_Output (self, other, "OUTRO_Schiff_11_04"); //J'ai entendu dire que la guerre contre les orques se passait mal...
	AI_Output (other, self, "OUTRO_Schiff_15_05"); //Et ?
	AI_Output (self, other, "OUTRO_Schiff_11_06"); //On ne pourra certainement pas d�penser l'or o� que ce soit...
	AI_Output (other, self, "OUTRO_Schiff_15_07"); //L'or reste � bord !
	AI_Output (self, other, "OUTRO_Schiff_12_08"); //A quoi nous servira cet or si le bateau coule � la moindre temp�te ?
	AI_Output (other, self, "OUTRO_Schiff_15_09"); //Mais je ne vois aucune temp�te...
	AI_Output (self, other, "OUTRO_Schiff_12_10"); //Pas ENCORE...
	AI_Output (other, self, "OUTRO_Schiff_15_11"); //D�tendez-vous ! Tout se passera tr�s bien !
	
	//ADDON
	AI_Output	(other, self, "DIA_Addon_AddonIntro_15_00"); //(�bahi) ...des humains ?
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_01"); //(avec m�pris) Les humains sont faibles.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_02"); //(avec m�pris) Ils ne c�dent que trop facilement � la tentation du mal...
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_03"); //...et se retrouvent ainsi m�l�s � des puissances qu'ils ne peuvent comprendre, et ne sont gu�re en mesure de contr�ler.
	AI_Output	(self, other, "DIA_Addon_AddonIntro_14_04"); //Ceux dont la foi est in�branlable ont d�j� commenc� � combattre l'ennemi...
	
	//ADDON - NEU
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_00"); //Depuis la chute de la Barri�re et le bannissement du dormeur, la furie de Beliar est plus intense que jamais auparavant.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_01"); //Un puissant artefact, ainsi est-il �crit dans les �crits anciens, sera ramen� parmi les habitants de ce monde.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_02"); //(cite) 'Lorsque le dieu des t�n�bres d�p�che ses serviteurs � sa recherche'.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_03"); //Or c'est exactement ce qui s'est produit. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_04"); //Cette recherche... a commenc� depuis longtemps d�j� !
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_05"); //Au cours de leurs recherches, les serviteurs de Beliar profanent les plus anciens sanctuaires des dieux.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_06"); //Les serviteurs de Beliar profanent les plus anciens sanctuaires des dieux.
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_07"); //Les veilleurs de ces lieux sacr�s se sont �veill�s. Et leur furie est ce qui fait trembler la terre !
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_08"); //Parmi les grands magiciens de cette �le, nul n'est insensible � cette furie. 
	AI_Output	(self, other, "DIA_Addon_Xardas_AddonIntro_Add_14_09"); //Et certains parmi eux sont d�sormais pr�ts � se dresser contre cette menace.
};
