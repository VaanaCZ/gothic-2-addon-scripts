///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Saturas_EXIT   (C_INFO)
{
	npc         = KDW_1400_Addon_Saturas_NW;
	nr          = 999;
	condition   = DIA_Addon_Saturas_EXIT_Condition;
	information = DIA_Addon_Saturas_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Addon_Saturas_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Saturas_EXIT_Info()
{
	if (MIS_Addon_Saturas_BringRiordian2Me == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_01"); //Puisque personne ne peut vous emp�cher de nuire au travail des autres Mages, autant que vous portiez un message � l'un d'eux de ma part.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_02"); //Dites � Riordian que je souhaite qu'il me retrouve ici.
		AI_Output	(self, other, "DIA_Addon_Saturas_auftrag_14_03"); //Il se trouve au fond de la crypte. Vous le trouverez s�rement l�-bas.
		MIS_Addon_Saturas_BringRiordian2Me = LOG_RUNNING;
	
		Log_CreateTopic (TOPIC_Addon_HolRiordian, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_HolRiordian, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_HolRiordian,"Saturas me demande d'aller qu�rir le Mage de l'eau Riordian. Celui-ci devrait se trouver dans les cryptes, sur le site des fouilles."); 
	};
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Nefarius
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Nefarius		(C_INFO)
{
	npc			 = 	KDW_1400_Addon_Saturas_NW;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Saturas_Nefarius_Condition;
	information	 = 	DIA_Addon_Saturas_Nefarius_Info;
 
 	description	 = 	"Je suis cens� retrouver les fragments �gar�s du bijou pour Nefarius.";
};

func int DIA_Addon_Saturas_Nefarius_Condition ()
{
	if (MIS_Addon_Nefarius_BringMissingOrnaments == LOG_RUNNING)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_Nefarius_Info ()
{
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_00"); //Je suis cens� retrouver les fragments �gar�s du bijou pour Nefarius.
	AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_01"); //Quoi ? C'est inconcevable ? Vous �tes encore impliqu� dans une affaire ?
	AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_02"); //Ne vous inqui�tez pas, je ram�nerai tout cela ici.
	
	if (ORNAMENT_SWITCHED_FOREST == FALSE)
	&& (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon))
	{
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_03"); //(soupire) Savez-vous au moins ce que vous recherchez ?
		AI_Output (other, self, "DIA_ADDON_Saturas_Nefarius_15_04"); //Nefarius m'a remis cette carte...
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_05"); //Montrez-la moi !
		B_UseFakeScroll ();
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_06"); //Hmmm... La grande for�t est un lieu extr�mement dangereux. Vous ne devriez pas vous y aventurer seul.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_07"); //Allez � Khorinis et trouvez quelqu'un pour vous y accompagner.
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_08"); //Je ne voudrais pas que vous - et le bijou - vous fassiez d�vorer par des monstres...
		AI_Output (self, other, "DIA_ADDON_Saturas_Nefarius_14_09"); //Tenez, reprenez votre carte.

		Log_CreateTopic (TOPIC_Addon_Ornament, LOG_MISSION);
		Log_SetTopicStatus(TOPIC_Addon_Ornament, LOG_RUNNING);
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas m'a d�conseill� de partir seul aux confins de la grande for�t � la recherche du fragment de bijou qui s'y trouve. Je devrais me rendre � Khorinis et rechercher une personne pour m'accompagner."); 
	};
};
 
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Hallo		(C_INFO)
{
	npc			 = 	KDW_1400_Addon_Saturas_NW;
	nr			 = 	2;
	condition	 = 	DIA_Addon_Saturas_Hallo_Condition;
	information	 = 	DIA_Addon_Saturas_Hallo_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Addon_Saturas_Hallo_Condition ()
{
	Npc_PerceiveAll (self);
	if (Wld_DetectNpc (self,Gobbo_Skeleton,ZS_MM_Attack,-1) == FALSE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Saturas_Hallo_wei�tdu ()
{
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_00"); //Avez-vous la moindre id�e de ce que vous avez fait ?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_01"); //Vous avez tellement perturb� la structure de la magie que cela s'est entendu jusqu'� Khorinis !
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_02"); //Estimez-vous heureux que la Barri�re se soit simplement effondr�e, autrefois.
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_wei�tdu_15_03"); //De quoi vous plaignez-vous ? Tout s'est bien d�roul�.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_04"); //(crie) Tenez votre langue !
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_wei�tdu_14_05"); //(furieux) Que diable venez-vous chercher ici, de toutes fa�ons ?!
	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);

};

func void DIA_Addon_Saturas_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_00"); //Etes-vous fou ? Sortez d'ici !
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_01"); //Ces cryptes sont beaucoup trop dangereuses pour un jeune aventurier !
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_02"); //(irrit�) Mais dites donc, je ne vous connais pas ? Bien s�r... esp�ce de crapule !
	AI_Output	(self, other, "DIA_Addon_Saturas_Hallo_14_03"); //(irrit�) Ne croyez pas que j'ai oubli� de quelle mani�re vous nous avez trahi, au nouveau camp.

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "(embarrass�) Eh bien, euh...", DIA_Addon_Saturas_Hallo_Video ); 
};

func void DIA_Addon_Saturas_Hallo_Video ()
{
	PlayVideo ("oreheap.bik");
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_00"); //(irrit�) Vous avez drain� notre r�serve de minerai de toute sa puissance magique, puis vous vous �tes simplement �vapor� !
	AI_Output	(self, other, "DIA_Addon_Saturas_Video_14_01"); //(irrit�) Qu'est-ce que vous esp�riez faire, au juste ?

	Info_ClearChoices	(DIA_Addon_Saturas_Hallo);
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "Je suis d�sol�. Je ne savais pas ce que je faisais.", DIA_Addon_Saturas_Hallo_sorry );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "De toutes fa�ons, votre plan n'aurait pas fonctionn�.", DIA_Addon_Saturas_Hallo_Spott );
	Info_AddChoice	(DIA_Addon_Saturas_Hallo, "C'�tait n�cessaire.", DIA_Addon_Saturas_Hallo_notwendig );
};

func void DIA_Addon_Saturas_Hallo_notwendig ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_notwendig_15_00"); //C'�tait n�cessaire. Sans la puissance du minerai, jamais je n'aurais pu vaincre le Dormeur.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_notwendig_14_01"); //(en col�re) Que sont encore ces sornettes ? Dormeur ? Vaincre ?
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};

func void DIA_Addon_Saturas_Hallo_Spott ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_00"); //Votre plan l'aurait pas fonctionn�, de toutes fa�ons. Faire exploser la Barri�re en utilisant la r�serve de minerai �tait l'id�e la plus absurde que j'ai jamais entendue !
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_Spott_15_01"); //Au final, vous auriez fini par vous d�sint�grer vous-m�me !
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_02"); //(en col�re) Vous d�passez les bornes ! Qui vous donne le droit de nous juger, nous et nos desseins ?
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_Spott_14_03"); //Si je n'�tais pas quelqu'un d'aussi pacifique, je ferais s'abattre sur vous la furie d'Adanos, mon gar�on !
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};

func void DIA_Addon_Saturas_Hallo_sorry ()
{
	AI_Output			(other, self, "DIA_Addon_Saturas_Hallo_sorry_15_00"); //Je suis d�sol�. Je ne savais pas ce que je faisais.
	AI_Output			(self, other, "DIA_Addon_Saturas_Hallo_sorry_14_01"); //Oh ? Et vous pensez que cela suffit, comme excuse ?
	DIA_Addon_Saturas_Hallo_wei�tdu ();
};



///////////////////////////////////////////////////////////////////////
//	Info keineAhnung
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_keineAhnung		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_keineAhnung_Condition;
	information	 = 	DIA_Addon_Saturas_keineAhnung_Info;

	description	 = 	"�a ne m'int�resse pas.";
};

func int DIA_Addon_Saturas_keineAhnung_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_keineAhnung_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_keineAhnung_15_00"); //Je n'en sais rien. Je me suis juste dit que je m'arr�terais m'enqu�rir sur ce qu'il se passe ici.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_01"); //Vous me faites perdre mon temps. Partez d'ici, maintenant.
	AI_Output	(self, other, "DIA_Addon_Saturas_keineAhnung_14_02"); //(pour lui-m�me) Je m'occuperai de vous plus tard.
	
	Log_CreateTopic (TOPIC_Addon_KDW, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_KDW, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_KDW,"J'ai retrouv� les Mages de l'eau sur le lieu des fouilles. Je dois d'abord d�couvrir ce que ces gars font vraiment ici, et Saturas refuse de me le dire. Il est toujours sur la d�fensive en raison de toutes ces l�gendes autour de la colonie p�nitentiaire."); 

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info raus
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_raus		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_raus_Condition;
	information	 = 	DIA_Addon_Saturas_raus_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;

};

func int DIA_Addon_Saturas_raus_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Saturas_keineAhnung))
	&& (MIS_Addon_Lares_Ornament2Saturas == 0)
	&& (Npc_IsInState (self,ZS_Talk))
		{
			return TRUE;
		};	
};

func void DIA_Addon_Saturas_raus_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Saturas_raus_14_00"); //Disparaissez d'ici avant qu'il ne vous arrive malheur.
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Lares
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Lares		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Lares_Condition;
	information	 = 	DIA_Addon_Saturas_Lares_Info;

	description	 = 	"Je suis venu ici avec Lares.";
};

func int DIA_Addon_Saturas_Lares_Condition ()
{
	if (Lares_Angekommen == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Lares_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_00"); //Je suis venu ici avec Lares.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_01"); //(inquiet) Lares ? Vraiment ? O� est-il ?
	AI_Output	(other, self, "DIA_Addon_Saturas_Lares_15_02"); //Je suis seul. Lares est retourn� � la ville.
	AI_Output	(self, other, "DIA_Addon_Saturas_Lares_14_03"); //Quoi ? Il vous envoie seul � nous ? Que s'imaginait-il ?
};

///////////////////////////////////////////////////////////////////////
//	Info Ornament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Ornament		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_Ornament_Condition;
	information	 = 	DIA_Addon_Saturas_Ornament_Info;

	description	 = 	"Je vous apporte votre bijou ?";
};

func int DIA_Addon_Saturas_Ornament_Condition ()
{
	//if (Npc_KnowsInfo (other, DIA_Addon_Saturas_Lares))
	//&& (MIS_Addon_Lares_Ornament2Saturas == LOG_RUNNING)
	if ( Npc_HasItems (other,ItMi_Ornament_Addon_Vatras) && (Lares_Angekommen == FALSE) )
	|| ( (Lares_Angekommen == TRUE) && Npc_KnowsInfo(other, DIA_Addon_Saturas_Lares) && Npc_HasItems (other,ItMi_Ornament_Addon_Vatras) )
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Ornament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_00"); //Je vous apporte votre bijou ?
	B_GiveInvItems (other, self, ItMi_Ornament_Addon_Vatras,1);
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_ADD_14_00"); //Qu'est-ce que �a signifie, bon sang ?! 

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_01"); //Qui vous a remis cela ? Ne me dites pas que Lares vous l'a simplement donn� !
	};
	
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_02"); //Arr�tez, maintenant. Je vous l'ai apport�. Vous le voulez ou pas ?
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_03"); //Certainement. Mais je suis d�pit� de constater qu'une fois encore, vous avez toutes les cartes en main.
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_04"); //Pourquoi attachez-vous autant d'importance � cette vieille histoire autour de la r�serve de minerai ?
	AI_Output	(other, self, "DIA_Addon_Saturas_Ornament_15_05"); //Apr�s tout, j'avais d�j� travaill� pour vous, � l'�poque. Et vous ne pouvez pas dire que je n'�tais pas quelqu'un de fiable.
	AI_Output	(self, other, "DIA_Addon_Saturas_Ornament_14_06"); //(soupire) Et qu'est-ce que �a m'a rapport�, au final ? Pff, n'imaginez pas pour autant que j'ai quelque confiance en vous...
	MIS_Addon_Lares_Ornament2Saturas = LOG_SUCCESS;

	//Joly: Monster auff�llen, die bei Lares gest�rt haben
	Wld_InsertNpc 	(Bloodfly, 	"FP_ROAM_NW_TROLLAREA_RUINS_07");
	Wld_InsertNpc 	(Giant_Bug, 	"FP_ROAM_NW_TROLLAREA_RUINS_03");
	Wld_InsertNpc 	(Lurker, 		"NW_TROLLAREA_RIVERSIDE_01");
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 

	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_TROLLAREA_MONSTER_01_01"); 
  	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_BIGFARM_MONSTER_01"); 
	Wld_InsertNpc 	(Scavenger,	"NW_TAVERNE_BIGFARM_MONSTER_01"); 
	Wld_InsertNpc 	(Scavenger, 	"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc 	(Scavenger, 	"NW_FOREST_CONNECT_MONSTER");
	Wld_InsertNpc 	(Gobbo_Green, 	"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc 	(Gobbo_Green, 	"NW_TROLLAREA_PORTALTEMPEL_02");
	Wld_InsertNpc 	(Gobbo_Green, "NW_CITY_TO_FARM2_02"); //auf Treppe
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
	Wld_InsertNpc 	(Giant_Rat, 			"NW_TROLLAREA_RATS_01");
};

///////////////////////////////////////////////////////////////////////
//	Info geheimbund
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_geheimbund		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_geheimbund_Condition;
	information	 = 	DIA_Addon_Saturas_geheimbund_Info;

	description	 = 	"Je veux rejoindre l'Anneau de l'eau.";
};

func int DIA_Addon_Saturas_geheimbund_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (SC_KnowsRanger == TRUE)
	&& (SC_IsRanger == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_geheimbund_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_00"); //Je veux rejoindre l'Anneau de l'eau.

	if (Lares_Angekommen == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_01"); //(furieux) QUOI ? Comment savez-vous... ?! Qui... ?! LARES ! Je le tuerai !
		AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_02"); //Il a enfreint notre premi�re r�gle. Ne parler � personne de l'Anneau de l'eau.
	};

	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_03"); //(compl�tement abattu) Je ne sais pas quoi dire. Je n'ai confiance en vous que lorsque je vous ai � l'�il.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_04"); //C'est Vatras qui m'a parl� de l'Anneau.
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_05"); //(r�sign�) Quoi ? Vatras ? (sarcastique) Merveilleux ! De tous les Mages de l'eau sur cette �le, il faut que vous rencontriez celui qui ne vous conna�t PAS !
	AI_Output	(self, other, "DIA_Addon_Saturas_geheimbund_14_06"); //Je vous pr�viens, ne faites rien de stupide cette fois.
	AI_Output	(other, self, "DIA_Addon_Saturas_geheimbund_15_07"); //(s�chement) Je ferai un effort...
	
	Log_CreateTopic (TOPIC_Addon_RingOfWater, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_RingOfWater, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas n'est pas pr�par� � m'admettre au sein de l'Anneau de l'eau. Il laisse cette d�cision � Vatras."); 

};

///////////////////////////////////////////////////////////////////////
//	Info wasmachstdu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_wasmachstdu		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_wasmachstdu_Condition;
	information	 = 	DIA_Addon_Saturas_wasmachstdu_Info;

	description	 = 	"Qu'est-ce que vous faites ici�?";
};

func int DIA_Addon_Saturas_wasmachstdu_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_wasmachstdu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_wasmachstdu_15_00"); //Que faites-vous ici ?
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_01"); //(avec r�v�rence) Ces salles dissimulent des secrets ancestraux... des secrets bien myst�rieux.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_02"); //Les inscriptions et les fresques murales en ces lieux indiquent une culture tr�s ancienne.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_03"); //Tout ce que vous voyez ici est �crit dans une langue qui nous est totalement inconnue.
	AI_Output	(self, other, "DIA_Addon_Saturas_wasmachstdu_14_04"); //Nous commen�ons juste � l'apprendre et � en comprendre la signification.
};

///////////////////////////////////////////////////////////////////////
//	Info Erdbeben
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_Erdbeben		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	6;
	condition	 = 	DIA_Addon_Saturas_Erdbeben_Condition;
	information	 = 	DIA_Addon_Saturas_Erdbeben_Info;

	description	 = 	"Que sont ces �tranges s�ismes ?!";
};

func int DIA_Addon_Saturas_Erdbeben_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (Npc_KnowsInfo (other, DIA_Addon_Saturas_wasmachstdu))
	&& (Npc_KnowsInfo (other, DIA_Addon_Merdarion_Bedrohung))
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_Erdbeben_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_Erdbeben_15_00"); //Que sont ces �tranges s�ismes ?!
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_01"); //C'est l'une des �nigmes que je tente de r�soudre.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_02"); //La source de la perturbation qui affecte la structure de la magie se trouve quelque part au-del� de ces montagnes.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_03"); //Visiblement, quelqu'un met tout en �uvre pour briser une puissante magie.
	AI_Output	(self, other, "DIA_Addon_Saturas_Erdbeben_14_04"); //Je crains qu'il ne faille gu�re longtemps avant que ces s�ismes ne se propagent � l'�le toute enti�re.
};
///////////////////////////////////////////////////////////////////////
//	Info WhatsOrnament
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_WhatsOrnament		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_WhatsOrnament_Condition;
	information	 = 	DIA_Addon_Saturas_WhatsOrnament_Info;

	description	 = 	"Pourquoi attachez-vous tant d'importance � ce bijou ?";
};

func int DIA_Addon_Saturas_WhatsOrnament_Condition ()
{
	if (MIS_Addon_Lares_Ornament2Saturas == LOG_SUCCESS)
	&& (SC_KnowsOrnament == FALSE)
	&& (RitualRingRuns == 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_WhatsOrnament_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_WhatsOrnament_15_00"); //Pourquoi attachez-vous tant d'importance � ce bijou ?
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_01"); //(irrit�) Il s'agit de la clef d'un portail.
	AI_Output	(self, other, "DIA_Addon_Saturas_WhatsOrnament_14_02"); //Je ne vous en dirai pas davantage.
};
///////////////////////////////////////////////////////////////////////
//	Info ScRanger
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_ScRanger		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_ScRanger_Condition;
	information	 = 	DIA_Addon_Saturas_ScRanger_Info;
	permanent	 = 	TRUE;

	description	 = 	"J'appartiens maintenant � l'Anneau de l'eau.";
};

func int DIA_Addon_Saturas_ScRanger_Condition ()
{
	if (SaturasKnows_SC_IsRanger == FALSE)
	&& (SC_IsRanger == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_ScRanger_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_ScRanger_15_00"); //Je fais partie de l'Anneau de l'eau.
	var C_Item itm; 
	itm = Npc_GetEquippedArmor(other);
		
	if 	(
		((SCIsWearingRangerRing == TRUE) && (RangerRingIsLaresRing == FALSE))	//-> Der SC IST Ranger! SC tr�gt eigenen (nicht Lares') Ring
		|| (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)							//-> Der SC IST Ranger! Nur als Ranger hat er diese R�stung bekommen.
		)
		{
			if (Hlp_IsItem(itm, ITAR_RANGER_Addon) == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_01"); //Je vois, vous portez en effet l'armure de nos enfants.
			}
			else 
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_02"); //Je vois, vous portez en effet notre embl�me secret... l'anneau d'aigue-marine.
			};
			
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_03"); //Et je vois dans vos yeux que vous dites la v�rit�.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_04"); //(marmonne) Tr�s bien. J'accepte votre int�gration dans nos rangs.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_05"); //Mais n'oubliez pas que celle-ci s'accompagne d'une immense responsabilit�.
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_06"); //Et, dans votre int�r�t, j'esp�re que vous lui ferez honneur.
			SaturasKnows_SC_IsRanger = TRUE;
			B_LogEntry (TOPIC_Addon_RingOfWater,"Saturas a accept� de m'int�grer � l'Anneau de l'eau."); 
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_07"); //Et comment puis-je savoir que �tes vraiment l'un des n�tres ?
	
			if (RangerRingIsLaresRing == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_08"); //L'anneau d'aigue-marine que vous transportez appartient � Lares. Je le vois.
			};

			AI_Output	(self, other, "DIA_Addon_Saturas_ScRanger_14_09"); // Vous tentez de me berner, n'est-ce pas ? Je n'attendais rien de moins de votre part.
			AI_StopProcessInfos (self);		
		};
};

///////////////////////////////////////////////////////////////////////
//	Info OpenPortal
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_OpenPortal		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Saturas_OpenPortal_Condition;
	information	 = 	DIA_Addon_Saturas_OpenPortal_Info;
	permanent	 = 	TRUE;

	description	 = 	"Donnez-moi l'anneau. J'ouvrirai le portail.";
};
var int DIA_Addon_Saturas_OpenPortal_NoPerm;
func int DIA_Addon_Saturas_OpenPortal_Condition ()
{
	if (RitualRingRuns == LOG_SUCCESS)
	&& (DIA_Addon_Saturas_OpenPortal_NoPerm == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_OpenPortal_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_00"); //Donnez-moi l'anneau. J'ouvrirai le portail.

	if (SaturasKnows_SC_IsRanger == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_01"); //(sournois) Bien ! En tant que nouveau venu parmi les rangs de nos enfants, cet honneur vous revient.
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_02"); //Toutefois, j'attends toujours un message de Vatras. Tant que je ne l'aurai pas re�u, nous ne pourrons partir.
	
		
		if (RangerMeetingRunning == LOG_SUCCESS)
		&& ((Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)) || (Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened))) 
		{	
			AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_03"); //J'AI un message de Vatras pour vous.
	
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven)));
			B_GiveInvItems (other, self, ItWr_Vatras2Saturas_FindRaven_opened,(Npc_HasItems (other,ItWr_Vatras2Saturas_FindRaven_opened)));
		
			B_UseFakeScroll ();
			if (Vatras2Saturas_FindRaven_Open == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_04"); //(irrit�) Je vois. Et bien �videmment, vous n'avez pas pu vous emp�cher de l'ouvrir, j'imagine ?
				AI_Output	(other, self, "DIA_Addon_Saturas_OpenPortal_15_05"); //Eh bien, heu...
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_06"); //(mena�ant) Dans votre int�r�t, j'esp�re que la confiance fort t�nue que je vous porte ne sera pas �branl�e par votre r�ponse.
			}
			else
			{
				AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_07"); //(�bahi) Tr�s int�ressant. Bien.
				B_GivePlayerXP (XP_Ambient);
			};		
			
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_08"); //Tenez, prenez l'anneau. Nous allons nous rassembler devant le portail et vous attendre.
		
			CreateInvItems (self, ItMi_PortalRing_Addon, 1);									
			B_GiveInvItems (self, other, ItMi_PortalRing_Addon, 1);
		
			AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_09"); //Si Nefarius ne se trompe pas, le portail s'ouvrira d�s que vous aurez ins�r� l'anneau � cet endroit.
			
			DIA_Addon_Saturas_OpenPortal_NoPerm = TRUE;
			B_LogEntry (TOPIC_Addon_Ornament,"Saturas m'a remis la bague. Je suis cens� l'ins�rer dans le m�canisme du portail avant de traverser celui-ci."); 

			AI_StopProcessInfos (self);		
			Npc_ExchangeRoutine	(self,"OpenPortal");
			B_StartOtherRoutine	(KDW_1401_Addon_Cronos_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1402_Addon_Nefarius_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1403_Addon_Myxir_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1404_Addon_Riordian_NW,"OpenPortal");
			B_StartOtherRoutine	(KDW_1405_Addon_Merdarion_NW,"OpenPortal");
		}
		else
		{
			AI_StopProcessInfos (self);		
		};
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Saturas_OpenPortal_14_10"); //Tant que Vatras ne m'aura pas express�ment indiqu� que vous �tes digne de confiance, je garderai l'anneau pour moi.
		Saturas_WillVertrauensBeweis = TRUE;
		B_LogEntry (TOPIC_Addon_Ornament,"Saturas ne me remettra pas la bague tant que Vatras ne lui aura pas signifi� que je suis digne de confiance."); 
		AI_StopProcessInfos (self);		
	};
};

///////////////////////////////////////////////////////////////////////
//	Info PERM
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Saturas_PERM		(C_INFO)
{
	npc		 = 	KDW_1400_Addon_Saturas_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Saturas_PERM_Condition;
	information	 = 	DIA_Addon_Saturas_PERM_Info;
	permanent	 = 	TRUE;

	description	 = 	"Pouvez-vous m'enseigner quelque chose sur la magie ?";
};

func int DIA_Addon_Saturas_PERM_Condition ()
{
	if (MIS_Addon_Saturas_BringRiordian2Me != 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Saturas_PERM_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Saturas_PERM_15_00"); //Pouvez-vous m'apprendre quelque chose au sujet de la magie ?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_01"); //Pour que vous puissiez perturber la structure m�me de la magie, une fois encore ?
	AI_Output	(self, other, "DIA_Addon_Saturas_PERM_14_02"); //Non, je n'ai pas le temps de jouer � de tels jeux.
};
