
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Skip_NW_EXIT   (C_INFO)
{
	npc         = PIR_1301_Addon_Skip_NW;
	nr          = 999;
	condition   = DIA_Addon_Skip_NW_EXIT_Condition;
	information = DIA_Addon_Skip_NW_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Skip_NW_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Skip_NW_EXIT_Info()
{
	AI_StopProcessInfos (self);
	
	PlayerTalkedToSkipNW = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Hallo		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Skip_NW_Hallo_Condition;
	information	 = 	DIA_Addon_Skip_NW_Hallo_Info;
	important	 = 	TRUE;
};
func int DIA_Addon_Skip_NW_Hallo_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_00"); //(irrit�) Vous voil� enfin. Cela fait des heures que vous attends ici.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_01"); //(perplexe) Un instant... Vous ne seriez pas un marchand de la ville, des fois ?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Hallo_08_02"); //(en col�re) O� est Baltram ?
};

///////////////////////////////////////////////////////////////////////
//	Info WerBistDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_WerBistDu		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_WerBistDu_Condition;
	information	 = 	DIA_Addon_Skip_NW_WerBistDu_Info;

	description	 = 	"Qui �tes-vous ?";
};

func int DIA_Addon_Skip_NW_WerBistDu_Condition ()
{
	return TRUE;
};

func void DIA_Addon_Skip_NW_WerBistDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_00"); //Qui �tes-vous ?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_01"); //Je ne vois pas en quoi �a vous regarde. Mais si vous tenez vraiment � le savoir, mon nom est Skip. �a vous para�t familier ?
	AI_Output	(other, self, "DIA_Addon_Skip_NW_WerBistDu_15_02"); //(feignant de n'avoir pas compris) Comment ?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_03"); //Vous dites que vous n'avez jamais entendu parler de Skip ? Bon sang, dans quel trou � rats vivez-vous ?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_04"); //Je suis l'un des criminels les plus recherch�s de Khorinis. Mes gars et moi sommes la terreur des eaux de cette �le mis�rable depuis des ann�es, maintenant !
	AI_Output	(self, other, "DIA_Addon_Skip_NW_WerBistDu_08_05"); //(outr�) Allez, faites un effort - vous avez s�rement entendu parler de moi !
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Vous �tes un pirate...?", DIA_Addon_Skip_NW_WerBistDu_pirat );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Devrais-je vous conna�tre ?", DIA_Addon_Skip_NW_WerBistDu_keineAhnung );
	Info_AddChoice	(DIA_Addon_Skip_NW_WerBistDu, "Bien s�r... �a me revient, maintenant.", DIA_Addon_Skip_NW_WerBistDu_ja );
};
func void DIA_Addon_Skip_NW_WerBistDu_ja ()
{
	AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_00"); //Bien s�r... �a me revient, maintenant.
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_01"); //(perplexe) Vraiment ?  Vous avez vraiment entendu parler de moi ?
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_02"); //Oh, bon sang ! Et moi qui comptais aller faire un tour en ville...
	AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_03"); //J'ai bien fait de m'en abstenir.

	if (hero.guild != GIL_MIL)
	&& (hero.guild != GIL_PAL)
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_04"); //La milice m'aurait enferm� dans la seconde !
	}
	else 
	{
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_05"); //Vous n'�tes pas venu me d�noncer, j'esp�re ?
		AI_Output (other, self, "DIA_Addon_Skip_NW_WerBistDu_ja_15_06"); //Eh bien...
		AI_Output (self, other, "DIA_Addon_Skip_NW_WerBistDu_ja_08_07"); //Tant mieux pour vous. D�fiez ce vieux skip Skip en duel, et vous pouvez choisir o� vous voulez reposer.
	};
	
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_keineAhnung ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_15_00"); //Devrais-je vous conna�tre ?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_keineAhnung_08_01"); //Surveillez votre langue, mon gar�on, ou le vieux Skip le fera pour vous !
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};

func void DIA_Addon_Skip_NW_WerBistDu_pirat ()
{
	AI_Output			(other, self, "DIA_Addon_Skip_NW_WerBistDu_pirat_15_00"); //Vous �tes un pirate...?
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_01"); //(irrit�) Oui, bon sang ! �a se voit, non ? Et en col�re, qui plus est.
	AI_Output			(self, other, "DIA_Addon_Skip_NW_WerBistDu_pirat_08_02"); //Je m'ennuie tellement que j'en mangerais presque les planches de mon comptoir !
	Info_ClearChoices	(DIA_Addon_Skip_NW_WerBistDu);
};
///////////////////////////////////////////////////////////////////////
//	Info Baltram
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Baltram		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Baltram_Condition;
	information	 = 	DIA_Addon_Skip_NW_Baltram_Info;

	description	 = 	"Baltram ? Vous attendez un marchand ?";
};

func int DIA_Addon_Skip_NW_Baltram_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Hallo))
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_Baltram_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Baltram_15_00"); //Baltram ? Vous attendez un marchand ?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_01"); //Bravo, quelle perspicacit� !
	if (C_BodyStateContains (self, BS_SIT))
	{
		AI_StandUp (self);
		B_TurnToNpc (self,other);
	};
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_02"); //C'est ce que je viens de vous dire, non ?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_03"); //Ce bon � rien de brocanteur semble m'avoir oubli� !
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Baltram_08_04"); //Si seulement je pouvais mettre la main sur lui...
	
	Log_CreateTopic (TOPIC_Addon_BaltramSkipTrade, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_BaltramSkipTrade, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,"Le pirate Skip m'a appris que le commer�ant Baltram a fait affaires avec les pirates."); 
	
	SCKnowsBaltramAsPirateTrader = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info BaltramPaket
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_BaltramPaket		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_BaltramPaket_Condition;
	information	 = 	DIA_Addon_Skip_BaltramPaket_Info;

	description	 = 	"J'ai un paquet pour vous, de la part de Baltram.";
};

func int DIA_Addon_Skip_BaltramPaket_Condition ()
{
	if (MIS_Addon_Baltram_Paket4Skip == LOG_RUNNING)
	&& (Npc_HasItems (other,ItMi_Packet_Baltram4Skip_Addon))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_BaltramPaket_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_00"); //J'ai un paquet pour vous... de la part de Baltram.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_01"); //Quoi ? Il m'envoie un livreur d�soeuvr� ?
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_02"); //Il a peur, hein ? Bah... Quoi de plus normal pour un grippe-sou path�tique tel que lui ?
	B_GiveInvItems (other, self, ItMi_Packet_Baltram4Skip_Addon,1);
	AI_Output	(other, self, "DIA_Addon_Skip_BaltramPaket_15_03"); //Il m'a dit de lui ramener 3 bouteilles de tafia en �change.
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_04"); //(rires) Oh, vraiment ? D'abord, il me fait attendre ind�finiment, ensuite, il ne vient m�me pas en personne, et pour finir, il a le culot d'avoir des exigences !
	AI_Output	(self, other, "DIA_Addon_Skip_BaltramPaket_08_05"); //Tenez, vous lui donnerez 2 bouteilles. C'est bien assez pour lui.
	CreateInvItems (self, ItFo_Addon_Rum, 2);									
	B_GiveInvItems (self, other, ItFo_Addon_Rum, 2);		
	B_GivePlayerXP (XP_Addon_Skip_BaltramPaket);

	B_LogEntry (TOPIC_Addon_BaltramSkipTrade,LogText_Addon_SkipsRumToBaltram); 
	Skip_Rum4Baltram = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Woher
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Woher		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Woher_Condition;
	information	 = 	DIA_Addon_Skip_NW_Woher_Info;

	description	 = 	"D'o� venez-vous ?";
};

func int DIA_Addon_Skip_NW_Woher_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_WerBistDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Woher_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Woher_15_00"); //D'o� venez-vous ?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_01"); //Vous voulez savoir o� se trouve notre repaire ?

	if (hero.guild == GIL_MIL)
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_02"); //C'est bien la derni�re information que je donnerai � un milicien...
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_03"); //Quitte � vous le dire, j'aimerais autant inviter la milice � m'arr�ter...
	};

	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_04"); //Et m�me si vous comptiez nous rendre visite, cela ne vous avancerait � rien.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_05"); //L'�le de Khorinis est grande, et personne n'a encore d�couvert l'endroit o� se situe notre repaire. A moins, �videmment, de poss�der une caravane ou un navire...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_06"); //En plus, il faudrait que vous soyez capable de vous rep�rer parmi les falaises. Personne ne peut les franchir � moins de conna�tre le chemin secret.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Woher_08_07"); //Seules deux personnes connaissent ce chemin, et vous n'�tes pas l'une d'elles.
};


///////////////////////////////////////////////////////////////////////
//	Info SCSawGreg
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_SCSawGreg		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_SCSawGreg_Condition;
	information	 = 	DIA_Addon_Skip_SCSawGreg_Info;

	description	 = 	"Connaissez-vous une personne portant un bandeau sur l'�il ?";
};

func int DIA_Addon_Skip_SCSawGreg_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (SC_KnowsConnectionSkipGreg == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_SCSawGreg_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_00"); //Connaissez-vous une personne portant un bandeau sur l'�il ?
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_01"); //Je connais un sacr� paquet d'hommes portant un bandeau sur l'�il.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_02"); //Quelqu'un sur Khorinis semble bien vous conna�tre...
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_03"); //Je ne vois pas qui cela pourrait �tre. Je n'ai aucun lien avec les culs-terreux.
	AI_Output	(other, self, "DIA_Addon_Skip_SCSawGreg_15_04"); //Mais...
	AI_Output	(self, other, "DIA_Addon_Skip_SCSawGreg_08_05"); //Oubliez �a. Je ne suis vraiment pas int�ress�.
	B_GivePlayerXP (XP_Ambient);
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_MissingPeople		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_MissingPeople_Condition;
	information	 = 	DIA_Addon_Skip_NW_MissingPeople_Info;

	description	 = 	"Beaucoup de citoyens sont port�s manquants.";
};

func int DIA_Addon_Skip_NW_MissingPeople_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (MIS_Addon_Vatras_WhereAreMissingPeople == LOG_RUNNING)
	{
		return TRUE;
	};
};

func void DIA_Addon_Skip_NW_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_MissingPeople_15_00"); //Beaucoup de citoyens sont port�s disparus. Et tout porte � croire que vous n'�tes pas totalement innocent � ce propos.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_01"); //(se sentant pi�g�) Heu... bon sang, ce n'est pas ce que vous croyez.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_02"); //J'ai l'air d'un marchand d'esclaves, selon vous ? Non, je transporte uniquement des denr�es. Leur provenance et leur destinataire ne me regardent pas.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_03"); //Nous avons transport� toutes sortes de marchandises pour ces ordures.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_04"); //D'abord, ce n'�tait que des marchandises ordinaires... quoique cela ait parfois �t� de la contrebande.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_05"); //Mais ensuite, ils ont commenc� � enlever les habitants de la ville. Je ne sais pas du tout ce qu'ils comptent en faire.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_MissingPeople_08_06"); //Nous, tout ce que nous avons fait, c'est les convoyer jusqu'� l'�le.
};
///////////////////////////////////////////////////////////////////////
//	Info Dexter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Dexter		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Dexter_Condition;
	information	 = 	DIA_Addon_Skip_NW_Dexter_Info;

	description	 = 	"De qui parlez-vous�?";
};

func int DIA_Addon_Skip_NW_Dexter_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Dexter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Dexter_15_00"); //De qui parlez-vous ?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_01"); //Des bandits, bien entendu ! De qui d'autre ? Ces ordures qui prennent chaque jour leurs aises sur cette �le toute enti�re !
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Dexter_08_02"); //Et pas seulement ici... tout autour de Khorinis, �galement.
};


func void B_Skip_SaysDextersName ()
{
	AI_Output	(self, other, "DIA_Addon_Skip_SaysDextersName_08_00"); //Je me souviens de son nom, maintenant. Dexter. Oui, il me semble qu'ils l'ont appel� Dexter.

	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Dexter, le capitaine des bandits, a particip� � l'enl�vement des habitants de Khorinis. Dexter se trouverait quelque part au sud de la ferme d'Onar."); 

	SC_KnowsDexterAsKidnapper = TRUE;			
	Ranger_SCKnowsDexter = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info Name
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Name		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Skip_NW_Name_Condition;
	information	 = 	DIA_Addon_Skip_NW_Name_Info;

	description	 = 	"C'est trop vague pour moi, 'bandits'... je veux des noms.";
};

func int DIA_Addon_Skip_NW_Name_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Dexter))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Name_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_00"); //C'est trop vague pour moi 'bandits', je veux des noms...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_01"); //Des noms ? Vous voulez le nom du chef des bandits ? Bon sang, comment s'appelle cette crapule, d�j�...?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_02"); //Hmm. Rien � faire, je ne souviens pas de son nom. Pourtant, �a n'�tait rien de compliqu�...
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_03"); //Mais je peux vous indiquer o� trouver le chef du gang dans cette r�gion de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_04"); //Vous avez une bonne carte ?
	
	if (Npc_HasItems (other,ItWr_Map_NewWorld) == FALSE)
	{
		if (Npc_HasItems (other,ItWr_Map_NewWorld_Ornaments_Addon) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Shrine_MIS) == TRUE)
		|| (Npc_HasItems (other,ItWr_Map_Caves_MIS) == TRUE)
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_05"); //J'ai une carte ici m�me.
			AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_06"); //Mais quelqu'un a d�j� �crit quelque chose dessus. Alors quel int�r�t aurais-je � la rendre illisible pour vous ?
		}
		else
		{
			AI_Output	(other, self, "DIA_Addon_Skip_NW_Name_15_07"); //Non...
		};
		
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_08"); //Dans ce cas, je vais devoir vous donner une description.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_09"); //A l'est d'ici se trouve une tr�s grande ferme. Le nom du fermier est Onar, il me semble.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_10"); //Il poss�de des champs plut�t vastes. Au sud de ces champs se trouve une petite forteresse, au sommet d'une haute falaise.
		AI_Output	(self, other, "DIA_Addon_Skip_NW_Name_08_11"); //Voil� o� se trouve votre homme.
		B_Skip_SaysDextersName ();
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Landkarte
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Landkarte		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Skip_NW_Landkarte_Condition;
	information	 = 	DIA_Addon_Skip_NW_Landkarte_Info;

	description	 = 	"Tenez. Voici une carte de Khorinis.";
};

func int DIA_Addon_Skip_NW_Landkarte_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Name))
	&& (Npc_HasItems (other,ItWr_Map_NewWorld))
	&& (SCKnowsMissingPeopleAreInAddonWorld == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Landkarte_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Landkarte_15_00"); //Tenez. Voici une carte de Khorinis.
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_01"); //Bien. Je vais vous indiquer l'endroit o� se trouve la cache de ce type.
	B_GiveInvItems (other, self, ItWr_Map_NewWorld,1);
	B_Skip_SaysDextersName ();
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Landkarte_08_02"); //Voici votre carte.
	
	Npc_RemoveInvItems	(self,ItWr_Map_NewWorld ,1 );
	CreateInvItems (self, ItWr_Map_NewWorld_Dexter, 1);									
	B_GiveInvItems (self, other, ItWr_Map_NewWorld_Dexter, 1);		
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Skip_NW_Wohin		(C_INFO)
{
	npc		 = 	PIR_1301_Addon_Skip_NW;
	nr		 = 	99;
	condition	 = 	DIA_Addon_Skip_NW_Wohin_Condition;
	information	 = 	DIA_Addon_Skip_NW_Wohin_Info;
	permanent	 = 	TRUE;

	description	 = 	"O� avez-vous emmen� ces personnes ?";
};

func int DIA_Addon_Skip_NW_Wohin_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_Woher))
	&& (Npc_KnowsInfo (other, DIA_Addon_Skip_NW_MissingPeople))
		{
			return TRUE;
		};
};

func void DIA_Addon_Skip_NW_Wohin_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Skip_NW_Wohin_15_00"); //O� avez-vous emmen� ces personnes ?
	AI_Output	(self, other, "DIA_Addon_Skip_NW_Wohin_08_01"); //Je vous ai d�j� dit - il est hors de question que je vous indique l'endroit o� se trouve notre baie.
};
