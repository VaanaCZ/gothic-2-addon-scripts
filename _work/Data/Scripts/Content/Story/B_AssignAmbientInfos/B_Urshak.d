var int URSHAK_SUCKED;
//*********************************************************************
//	Info EXIT 
//*********************************************************************
INSTANCE DIA_Urshak_EXIT   (C_INFO)
{
	npc         = NONE_110_Urshak;
	nr          = 999;
	condition   = DIA_Urshak_EXIT_Condition;
	information = DIA_Urshak_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Urshak_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Urshak_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HALLO		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	5;
	condition	 = 	DIA_Urshak_HALLO_Condition;
	information	 = 	DIA_Urshak_HALLO_Info;
	important	 = 	TRUE;
};

func int DIA_Urshak_HALLO_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (URSHAK_SUCKED	== FALSE)
		{
			return TRUE;
		};	
};

func void DIA_Urshak_HALLO_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_00"); //(agressif) KHROTOK JABARTH !!!
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_01"); //Attendez ! Moi conna�tre vous. Vous ami humain avec voix douce.
	AI_Output			(self, other, "DIA_Urshak_HALLO_18_02"); //Ami tuer d�mon mal�fique KRUSHAK.
	
	B_GivePlayerXP (XP_UrshakFound);
	
	Log_CreateTopic (TOPIC_Urshak, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Urshak, LOG_RUNNING);
	B_LogEntry (TOPIC_Urshak,"J'ai retrouv� mon vieil ami orque Ur-Shak."); 

	Info_ClearChoices	(DIA_Urshak_HALLO);
	Info_AddChoice	(DIA_Urshak_HALLO, "Que faites-vous ici ?", DIA_Urshak_HALLO_freund );
	Info_AddChoice	(DIA_Urshak_HALLO, "Un orque qui parle ?", DIA_Urshak_HALLO_wer );
};
func void DIA_Urshak_HALLO_wer ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_wer_15_00"); //Un orque qui parle ?
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_01"); //Vous oublier Ur-Shak ? Moi triste.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_02"); //Ur-Shak aider ami beaucoup jours avant que faire aller ULU-MULU � village. Alors orque respecter ami et ami pas mourir � cause orques.
	AI_Output			(self, other, "DIA_Urshak_HALLO_wer_18_03"); //Ami aller alors dans temple orque et bannir mauvais d�mon. Beaucoup jours avant. Vous pas souvenir ?

};

func void DIA_Urshak_HALLO_freund ()
{
	AI_Output			(other, self, "DIA_Urshak_HALLO_freund_15_00"); //Vous n'avez pas choisi le meilleur moment pour croiser ma route. J'ai presque failli vous tuer. Que faites-vous ici ?
	AI_Output			(self, other, "DIA_Urshak_HALLO_freund_18_01"); //Ur-Shak regarder dans r�gion et voir ce que devenir r�gion et peuple � lui.
	Info_ClearChoices	(DIA_Urshak_HALLO);
};



///////////////////////////////////////////////////////////////////////
//	Info WasmachenOrks
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_WASMACHENORKS		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	6;
	condition	 = 	DIA_Urshak_WASMACHENORKS_Condition;
	information	 = 	DIA_Urshak_WASMACHENORKS_Info;

	description	 = 	"Pourquoi les orques attaquent-ils les humains ?";
};

func int DIA_Urshak_WASMACHENORKS_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_WASMACHENORKS_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_WASMACHENORKS_15_00"); //Pourquoi les orques attaquent-ils les humains ?
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_01"); //Ur-Shak toujours dire aux orques que humains pas m�chants et beaucoup amis chez eux.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_02"); //Mais chaman pas �couter Ur-Shak. Ur-Shak toujours rejet� par peuple � lui.
	AI_Output			(self, other, "DIA_Urshak_WASMACHENORKS_18_03"); //Alors Ur-Shak pas savoir quoi �tre grand plan de guerre contre humains.
	B_LogEntry (TOPIC_Urshak,"Il n'a pas encore r�ussi � convaincre son peuple de l'�couter. Il est toujours exil�."); 
};


///////////////////////////////////////////////////////////////////////
//	Info soviele
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_SOVIELE		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	7;
	condition	 = 	DIA_Urshak_SOVIELE_Condition;
	information	 = 	DIA_Urshak_SOVIELE_Info;

	description	 = 	"Pourquoi �tes-vous soudain si nombreux ?";
};

func int DIA_Urshak_SOVIELE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_SOVIELE_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_SOVIELE_15_00"); //Pourquoi �tes-vous soudain aussi nombreux ?
	AI_Output			(self, other, "DIA_Urshak_SOVIELE_18_01"); //Orques venir des montagnes mais d'autres venir par bateau et faire grande palissade.
};


///////////////////////////////////////////////////////////////////////
//	Info Zaun
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_ZAUN		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	8;
	condition	 = 	DIA_Urshak_ZAUN_Condition;
	information	 = 	DIA_Urshak_ZAUN_Info;

	description	 = 	"Qu'est-ce qui est cach� derri�re la longue palissade orque � l'est ?";
};

func int DIA_Urshak_ZAUN_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_ZAUN_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_ZAUN_15_00"); //Qu'est-ce qui est cach� derri�re la palissade orque � l'est ?
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_01"); //Orques toujours faire grande palissade et campement pour la guerre.
	AI_Output			(self, other, "DIA_Urshak_ZAUN_18_02"); //Palissade bien pour guerre. Cache arm�e et prot�ge orques.
};



///////////////////////////////////////////////////////////////////////
//	Info washastduvor
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_WASHASTDUVOR		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	9;
	condition	 = 	DIA_Urshak_WASHASTDUVOR_Condition;
	information	 = 	DIA_Urshak_WASHASTDUVOR_Info;

	description	 = 	"Que comptez-vous faire maintenant ?";
};

func int DIA_Urshak_WASHASTDUVOR_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HALLO))
	&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_WASHASTDUVOR_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_00"); //Que comptez-vous faire maintenant ?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_01"); //Ur-Shak attendre �claireurs orques conduire lui � Hosh-Pak.
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_15_02"); //Qui est Hosh-Pak ?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_18_03"); //Lui �tre tr�s grand chaman. Lui �tre tr�s influent sur guerriers et faire grand plan pour orques.

	B_LogEntry (TOPIC_Urshak,"Le plan d'Ur-Shak est de rencontrer le chaman orque Hosh-Pak pour le persuader de le laisser r�int�grer le conseil des chamans."); 

	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);

	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, DIALOG_BACK, DIA_Urshak_WASHASTDUVOR_weiter );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "O� puis-je trouver ce Hosh-Pak ?", DIA_Urshak_WASHASTDUVOR_ );
	Info_AddChoice	(DIA_Urshak_WASHASTDUVOR, "Alors pourquoi ne pas y aller vous-m�me ?", DIA_Urshak_WASHASTDUVOR_hoshpak );
};
func void DIA_Urshak_WASHASTDUVOR_hoshpak ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_hoshpak_15_00"); //Alors pourquoi ne pas aller le voir ?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_01"); //Ur-Shak essayer et essayer encore avoir honneur et ancienne place dans conseil de chamans.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_02"); //Mais Hosh-Pak pas vouloir �couter Ur-Shak. Orques tuer Ur-Shak si voir lui sans �claireurs. Ur-Shak devoir parler � Hosh-Pak.
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_hoshpak_18_03"); //Peut-�tre chance aujourd'hui.
	
};

func void DIA_Urshak_WASHASTDUVOR_ ()
{
	AI_Output			(other, self, "DIA_Urshak_WASHASTDUVOR_Urshak_15_00"); //O� puis-je trouver cet Hosh-Pak ?
	AI_Output			(self, other, "DIA_Urshak_WASHASTDUVOR_Urshak_18_01"); //Lui avoir endroit o� lui pouvoir voir guerriers orques dans forteresse du volcan. Comme �a Hosh-Pak contr�ler guerriers.

};

func void DIA_Urshak_WASHASTDUVOR_weiter ()
{
	Info_ClearChoices	(DIA_Urshak_WASHASTDUVOR);
};



///////////////////////////////////////////////////////////////////////
//	Info hoshpakDead
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HOSHPAKDEAD		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	nr		 = 	9;
	condition	 = 	DIA_Urshak_HOSHPAKDEAD_Condition;
	information	 = 	DIA_Urshak_HOSHPAKDEAD_Info;

	description	 = 	"Hosh-Pak est mort.";
};

func int DIA_Urshak_HOSHPAKDEAD_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_WASHASTDUVOR))
		&& (Npc_IsDead(Hosh_pak))
		&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_HOSHPAKDEAD_Info ()
{
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_00"); //Hosh-Pak est mort.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_01"); //Hosh-Pak mort ? RUSHTASOK !
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_02"); //C�ur � moi �tre lourd. Ur-Shak jamais oublier grand orque faire Ur-Shak chaman.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKDEAD_15_03"); //Je comprends. Hosh-Pak �tait votre mentor.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_04"); //Ur-Shak devoir maintenant porter poids du chagrin, doit donner derniers rites � Hosh-Pak. Ur-Shak devoir partir.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_05"); //Ami ferait mieux franchir passe. Etre trop dangereux ici.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKDEAD_18_06"); //Ur-Shak triste si ami humain mourir aussi.

	B_LogEntry (TOPIC_Urshak,"Hosh-Pak est mort. Mon ami orque s'est rendu dans la tente de ce dernier. Il est attrist� par la mort de son mentor. Je devrais le laisser partir."); 

	AI_StopProcessInfos (self);
	Npc_SetRefuseTalk (self,20);
	Npc_ExchangeRoutine	(self,"Start");
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_01");	
	Wld_InsertNpc   (OrcWarrior_Rest,"FP_CAMPFIRE_HOSHPAK_02");	
};


///////////////////////////////////////////////////////////////////////
//	Info geh
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_GEH		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_GEH_Condition;
	information	 = 	DIA_Urshak_GEH_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Urshak_GEH_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKDEAD))
		&& ((Npc_GetDistToWP(self,"OW_HOSHPAK_04")<1000) == FALSE)
		&& (Npc_RefuseTalk(self) == FALSE)
		&& (URSHAK_SUCKED	== FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_GEH_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_GEH_18_00"); //Ami mieux franchir col maintenant.
	Npc_SetRefuseTalk (self,10);
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info HoshpakRache
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_HOSHPAKRACHE		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_HOSHPAKRACHE_Condition;
	information	 = 	DIA_Urshak_HOSHPAKRACHE_Info;
	important	 = 	TRUE;
};

func int DIA_Urshak_HOSHPAKRACHE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKDEAD))
		&& ((Npc_GetDistToWP(self,"OW_HOSHPAK_04")<=1000))
		&& (URSHAK_SUCKED == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Urshak_HOSHPAKRACHE_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_00"); //(agressif) KHROTOK ! Moi savoir vous pr�sent quand Hosh-Pak mourir. Vous faire grave erreur, �tranger.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_01"); //Je vois que vous avez pris sa place. Vous m'avez manipul� depuis le d�but.
	AI_Output			(other, self, "DIA_Urshak_HOSHPAKRACHE_15_02"); //Votre position aupr�s de votre peuple �tait bien plus importante que vous ne vouliez l'admettre. Vous n'�tes plus d�sormais qu'un serviteur du mal.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_03"); //Etranger avoir raison. Ur-Shak plein de haine et de vengeance d�sormais.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_04"); //Ur-Shak d�couvrir grande erreur de faire confiance � m�chant humain. Ur-Shak regretter appeler humain ami et pas aider � tuer lui.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_05"); //Etranger devoir quitter vall�e et franchir passe. Ur-Shak pas pouvoir tuer �tranger maintenant. Honneur des chamans interdire � Ur-Shak de tuer.
	AI_Output			(self, other, "DIA_Urshak_HOSHPAKRACHE_18_06"); //Prochaine fois nous voir, nous �tre ennemis. Vous partir maintenant.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
	B_LogEntry (TOPIC_Urshak,"Ur-Shak a r�int�gr� le conseil des chamans orques. Il est d�sormais du c�t� de l'ennemi et un peu nerveux. Je ferais bien de ne pas rester sur son chemin avant d'avoir r�gl� le probl�me orque. Il devrait s'�tre calm� d'ici l�."); 
	B_GivePlayerXP (XP_UrshakBecomesShaman);
};


///////////////////////////////////////////////////////////////////////
//	Info keineWahl
///////////////////////////////////////////////////////////////////////
instance DIA_Urshak_KEINEWAHL		(C_INFO)
{
	npc		 = 	NONE_110_Urshak;
	condition	 = 	DIA_Urshak_KEINEWAHL_Condition;
	information	 = 	DIA_Urshak_KEINEWAHL_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Urshak_KEINEWAHL_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Urshak_HOSHPAKRACHE))
	&& (Npc_IsInState (self,ZS_Talk))
		{
				return TRUE;
		};
};

func void DIA_Urshak_KEINEWAHL_Info ()
{
	AI_Output			(self, other, "DIA_Urshak_KEINEWAHL_18_00"); //Vous partir. Moi pas parler � �tranger.
	AI_StopProcessInfos (self);
	URSHAK_SUCKED = TRUE;
};





















