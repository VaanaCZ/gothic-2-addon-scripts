///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_EXIT   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 999;
	condition   = DIA_Mika_EXIT_Condition;
	information = DIA_Mika_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Mika_EXIT_Condition()
{
	if Kapitel <=2
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Mika_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Refuse Talk wenn Lares am Start
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_Refuse   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 1;
	condition   = DIA_Mika_Refuse_Condition;
	information = DIA_Mika_Refuse_Info;
	permanent   = TRUE;
	important 	= TRUE;
};

FUNC INT DIA_Mika_Refuse_Condition()
{
	if (Npc_IsInState(self, ZS_Talk))
	&& (Lares.aivar[AIV_PARTYMEMBER] == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Mika_Refuse_Info()
{
	B_Say(self, other, "$NOTNOW");
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Wohin
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WOHIN		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr    	 = 4;     
	condition	 = 	DIA_Mika_WOHIN_Condition;
	information	 = 	DIA_Mika_WOHIN_Info;
	important	 = 	TRUE;
};

func int DIA_Mika_WOHIN_Condition ()
{
	if (Lares.aivar[AIV_PARTYMEMBER] == FALSE)
	{
		return TRUE;
	};
};

func void DIA_Mika_WOHIN_Info ()
{
	AI_Output			(self, other, "DIA_Mika_WOHIN_12_00"); //Hé-là, pas si vite ! C'est dangereux de se promener seul dans le coin. D'où venez-vous ?

	Info_ClearChoices	(DIA_Mika_WOHIN);

	Info_AddChoice	(DIA_Mika_WOHIN, "Cela ne vous regarde pas.", DIA_Mika_WOHIN_weg );
	Info_AddChoice	(DIA_Mika_WOHIN, "De l'une des fermes.", DIA_Mika_WOHIN_Bauern );
	Info_AddChoice	(DIA_Mika_WOHIN, "De la ville !", DIA_Mika_WOHIN_stadt );
};
func void DIA_Mika_WOHIN_stadt ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_stadt_15_00"); //De la ville.
	AI_Output			(self, other, "DIA_Mika_WOHIN_stadt_12_01"); //Eh bien, eh bien... et que faites-vous ici, si loin des murailles de la ville ?

	Info_ClearChoices	(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_Bauern ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_Bauern_15_00"); //De l'une des fermes.
	AI_Output			(self, other, "DIA_Mika_WOHIN_Bauern_12_01"); //Ah, un fermier ! Hmm... dans ce cas, vous ne devriez pas vous promener seul par ici. C'est trop dangereux. Qui sait ce que vous pourriez rencontrer au détour d'un chemin ?

	Info_ClearChoices	(DIA_Mika_WOHIN);
};

func void DIA_Mika_WOHIN_weg ()
{
	AI_Output			(other, self, "DIA_Mika_WOHIN_weg_15_00"); //Cela ne vous concerne pas.
	AI_Output			(self, other, "DIA_Mika_WOHIN_weg_12_01"); //Si vous le dites. Mais n'allez pas vous plaindre si jamais quelqu'un vous écorche vif. Bonne fin de journée...

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info WasGefaehrlich
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WASGEFAEHRLICH		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	5;
	condition	 = 	DIA_Mika_WASGEFAEHRLICH_Condition;
	information	 = 	DIA_Mika_WASGEFAEHRLICH_Info;

	description	 = 	"Qu'est-ce qui est si dangereux ici ?";
};

func int DIA_Mika_WASGEFAEHRLICH_Condition ()
{
	return TRUE;
};

func void DIA_Mika_WASGEFAEHRLICH_Info ()
{
	AI_Output			(other, self, "DIA_Mika_WASGEFAEHRLICH_15_00"); //Qu'y a-t-il de si dangereux, ici ?
	AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_01"); //Des tas de choses...
	if (other.protection[PROT_EDGE]	< ITAR_Leather_L.protection [PROT_EDGE])	//Joly: kleiner als die Lederrüstung
	{
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_02"); //Les brigands, pour commencer. Des freluquets comme vous, ils en croquent une demi-douzaine au petit déjeuner.
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_03"); //Si les brigands ne se chargent pas de vous, ce sont les animaux sauvages ou les mercenaires qui le feront.
		AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_04"); //Alors, trouvez-vous une armure digne de ce nom avant de vous aventurer par là.
	};
	AI_Output			(self, other, "DIA_Mika_WASGEFAEHRLICH_12_05"); //Je parie que vous m'appellerez à l'aide dès le premier virage.
	
};

///////////////////////////////////////////////////////////////////////
//	Info waskostetHilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WASKOSTETHILFE		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	6;
	condition	 = 	DIA_Mika_WASKOSTETHILFE_Condition;
	information	 = 	DIA_Mika_WASKOSTETHILFE_Info;

	description	 = 	"Je pensais pouvoir compter sur votre aide.";
};

func int DIA_Mika_WASKOSTETHILFE_Condition ()
{
	if 	(Npc_KnowsInfo(other, DIA_Mika_WASGEFAEHRLICH))
				{
						return TRUE;
				};
};

func void DIA_Mika_WASKOSTETHILFE_Info ()
{
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_15_00"); //Si jamais je vous demandais votre aide, combien cela me coûterait-il ?
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_01"); //Je ne suis qu'un humble serviteur du roi. Ne croyez pas que cela me ferait plaisir de vider les poches d'un citoyen sans défense.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_02"); //Mais si l'on présente la chose ainsi, c'est vrai qu'une petite motivation financière ne pourrait que favoriser notre relation professionnelle naissante.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_12_03"); //10 pièces d'or devraient faire l'affaire, pour commencer. Qu'en dites-vous ?

	Info_ClearChoices	(DIA_Mika_WASKOSTETHILFE);

	Info_AddChoice	(DIA_Mika_WASKOSTETHILFE, "Je vais y réfléchir.", DIA_Mika_WASKOSTETHILFE_nochnicht );
	Info_AddChoice	(DIA_Mika_WASKOSTETHILFE, "Pourquoi pas ? Voici vos 10 pièces.", DIA_Mika_WASKOSTETHILFE_ja );

};

func void DIA_Mika_WASKOSTETHILFE_ja ()
{
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_ja_15_00"); //Pourquoi pas ? Tenez, voici vos 10 pièces d'or.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
			{
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_01"); //Splendide ! Si vous avez besoin d'aide, vous savez ou me trouver.
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_02"); //Mais faites moi plaisir... ne venez pas geindre pour des peccadilles, d'accord ? Je ne peux pas le supporter.
				
				Mika_Helps = TRUE;
			}
		else
			{
				AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_ja_12_03"); //Vous n'avez pas cet argent. Vous devriez peut-être vous demander sérieusement si vous voulez vraiment que je vous aide.
			};
	AI_StopProcessInfos (self);
};

func void DIA_Mika_WASKOSTETHILFE_nochnicht ()
{
	AI_Output			(other, self, "DIA_Mika_WASKOSTETHILFE_nochnicht_15_00"); //Je vais y réfléchir.
	AI_Output			(self, other, "DIA_Mika_WASKOSTETHILFE_nochnicht_12_01"); //Comme vous voudrez. J'espère que votre mort vous plaira.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Ueberlegt
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_UEBERLEGT		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	7;
	condition	 = 	DIA_Mika_UEBERLEGT_Condition;
	information	 = 	DIA_Mika_UEBERLEGT_Info;
	permanent	 = 	TRUE;

	description	 = 	"J'ai changé d'avis. Je vous paierai 10 pièces d'or.";
};

func int DIA_Mika_UEBERLEGT_Condition ()
{
	if 	((Npc_KnowsInfo(other, DIA_Mika_WASKOSTETHILFE))
	&&	(Mika_Helps == FALSE))
	{
		return TRUE;
	};
};
func void DIA_Mika_UEBERLEGT_Info ()
{
	AI_Output			(other, self, "DIA_Mika_UEBERLEGT_15_00"); //J'ai changé d'avis. Va pour 10 pièces d'or.

	if (B_GiveInvItems (other, self, ItMi_Gold,10))
		{
			AI_Output			(self, other, "DIA_Mika_UEBERLEGT_12_01"); //Merveilleux ! Mieux vaut tard que jamais. Bon, et maintenant ?
			
			Mika_Helps = TRUE;
		}
		else
		{
			AI_Output			(self, other, "DIA_Mika_UEBERLEGT_12_02"); //(en colère) Revenez quand vous aurez l'argent.
			AI_StopProcessInfos (self);	
		};
};

///////////////////////////////////////////////////////////////////////
//	Info HILFE
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_HILFE		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	8;
	condition	 = 	DIA_Mika_HILFE_Condition;
	information	 = 	DIA_Mika_HILFE_Info;
	permanent	 = 	TRUE;

	description	 = 	"J'ai besoin de votre aide.";
};

func int DIA_Mika_HILFE_Condition ()
{
	if (Mika_Helps == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Mika_HILFE_Info ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_15_00"); //J'ai besoin de votre aide.
	AI_Output			(self, other, "DIA_Mika_HILFE_12_01"); //S'il le faut vraiment... Qu'y a-t-il ?

	Info_ClearChoices	(DIA_Mika_HILFE);
	
	Info_AddChoice	(DIA_Mika_HILFE, "Je suis traqué par des bandits.", DIA_Mika_HILFE_schongut );
	Info_AddChoice	(DIA_Mika_HILFE, "Des monstres en ont après moi.", DIA_Mika_HILFE_monster );

	if (!Npc_IsDead (Alvares)) 
	&& (!Npc_IsDead (Engardo))
	&& ( (Akils_SLDstillthere == TRUE) || (Npc_KnowsInfo (other, DIA_Sarah_Bauern)) )
	{
		Info_AddChoice	(DIA_Mika_HILFE, "Le fermier Akil est attaqué par des mercenaires.", DIA_Mika_HILFE_Akil );
	};
};

func void DIA_Mika_HILFE_Akil ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_Akil_15_00"); //Des mercenaires s'en prennent à Akil le fermier.
	AI_Output			(self, other, "DIA_Mika_HILFE_Akil_12_01"); //(agité) Quoi ? Cette racaille traîne aux alentours de la ferme d'Akil ? Dans ce cas, pas de temps à perdre ! Suivez-moi !

	AI_StopProcessInfos (self);
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	B_GivePlayerXP (Xp_Ambient);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"Mika veut m'aider à régler le problème des mercenaires de la ferme d'Akil."); 

	Npc_ExchangeRoutine	(self,"Akil"); 
};

func void DIA_Mika_HILFE_monster ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_monster_15_00"); //Je suis attaqué par des monstres.
	AI_Output			(self, other, "DIA_Mika_HILFE_monster_12_01"); //Je ne vois aucun monstre. Je parie que vous avez inventé cette histoire de toutes pièces.

	AI_StopProcessInfos (self);	
};

func void DIA_Mika_HILFE_schongut ()
{
	AI_Output			(other, self, "DIA_Mika_HILFE_schongut_15_00"); //Je suis poursuivi par des brigands.
	AI_Output			(self, other, "DIA_Mika_HILFE_schongut_12_01"); //Vraiment ? Et où sont-ils ? S'ils vous poursuivaient vraiment, je devrais au moins en apercevoir un ou deux, pas vrai ?

	AI_StopProcessInfos (self);	
};



///////////////////////////////////////////////////////////////////////
//	Info Zack
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_Zack		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr		 = 	8;
	condition	 = 	DIA_Mika_Zack_Condition;
	information	 = 	DIA_Mika_Zack_Info;
	important	 = 	TRUE;

};

func int DIA_Mika_Zack_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_FARM2_PATH_03")<500)
	&& ((!Npc_IsDead (Alvares))||(!Npc_IsDead (Engardo)))	
		{
			return TRUE;
		};
};

func void DIA_Mika_Zack_Info ()
{
	AI_Output			(self, other, "DIA_Mika_Zack_12_00"); //Regardez comment cela fonctionne...
	Info_AddChoice	(DIA_Mika_Zack, DIALOG_ENDE, DIA_Mika_Zack_los );
};
func void DIA_Mika_Zack_los ()
{
	AI_StopProcessInfos (self);
	//Joly: B_attack funzt hier nicht und ist auch nicht nötig!!!!!!!!!!!
	if(!Npc_IsDead (Alvares))
	{
		Alvares.aivar[AIV_EnemyOverride] = FALSE;
	};	
	if (!Npc_IsDead (Engardo))
	{
		Engardo.aivar[AIV_EnemyOverride] = FALSE;
	};	
};

///////////////////////////////////////////////////////////////////////
//	Info WiederNachHause
///////////////////////////////////////////////////////////////////////
instance DIA_Mika_WIEDERNACHHAUSE		(C_INFO)
{
	npc		 = 	Mil_337_Mika;
	nr 		 = 9;
	condition	 = 	DIA_Mika_WIEDERNACHHAUSE_Condition;
	information	 = 	DIA_Mika_WIEDERNACHHAUSE_Info;
	important	 = 	TRUE;
};

func int DIA_Mika_WIEDERNACHHAUSE_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_FARM2_PATH_03")<10000)
	&& 	(Npc_IsDead (Alvares))
	&&  (Npc_IsDead (Engardo))	
	{
		return TRUE;
	};
};

func void DIA_Mika_WIEDERNACHHAUSE_Info ()
{
	AI_Output			(self, other, "DIA_Mika_WIEDERNACHHAUSE_12_00"); //Bon, ça suffit. Je m'en vais.

	AI_StopProcessInfos (self);		
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"Start"); 
	B_GivePlayerXP (Xp_Ambient);
};

//############################################
//##
//##	Kapitel 3
//##
//############################################

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_Kap3_EXIT   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 999;
	condition   = DIA_Mika_Kap3_EXIT_Condition;
	information = DIA_Mika_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Mika_Kap3_EXIT_Condition()
{
	if Kapitel >= 3
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Mika_Kap3_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//***************************************************
//		Perm Kap3
//***************************************************

///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Mika_Kap3u4u5_PERM   (C_INFO)
{
	npc         = Mil_337_Mika;
	nr          = 39;
	condition   = DIA_Mika_Kap3u4u5_PERM_Condition;
	information = DIA_Mika_Kap3u4u5_PERM_Info;
	permanent   = TRUE;
	description = "Tout est calme ?";
};

FUNC INT DIA_Mika_Kap3u4u5_PERM_Condition()
{
	if  (Kapitel >= 3)
	&& 	(Npc_KnowsInfo(other, DIA_Mika_WOHIN))
	&& 	(Npc_IsDead (Alvares))
	&&  (Npc_IsDead (Engardo))	
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Mika_Kap3u4u5_PERM_Info()
{
	AI_Output (other,self ,"DIA_Mika_Kap3u4u5_PERM_15_00"); //Tout est calme ?
	AI_Output (self ,other,"DIA_Mika_Kap3u4u5_PERM_12_01"); //Vous êtes toujours en vie ? Vous m'impressionnez...
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Mika_PICKPOCKET (C_INFO)
{
	npc			= Mil_337_Mika;
	nr			= 900;
	condition	= DIA_Mika_PICKPOCKET_Condition;
	information	= DIA_Mika_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Mika_PICKPOCKET_Condition()
{
	C_Beklauen (65, 75);
};
 
FUNC VOID DIA_Mika_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Mika_PICKPOCKET);
	Info_AddChoice		(DIA_Mika_PICKPOCKET, DIALOG_BACK 		,DIA_Mika_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Mika_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Mika_PICKPOCKET_DoIt);
};

func void DIA_Mika_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Mika_PICKPOCKET);
};
	
func void DIA_Mika_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Mika_PICKPOCKET);
};


