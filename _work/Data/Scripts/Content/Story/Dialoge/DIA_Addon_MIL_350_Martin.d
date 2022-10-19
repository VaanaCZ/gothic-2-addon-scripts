///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Martin_EXIT   (C_INFO)
{
	npc         = Mil_350_Addon_Martin;
	nr          = 999;
	condition   = DIA_Addon_Martin_EXIT_Condition;
	information = DIA_Addon_Martin_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Martin_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Martin_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Martin_PICKPOCKET (C_INFO)
{
	npc			= Mil_350_Addon_Martin;
	nr			= 900;
	condition	= DIA_Addon_Martin_PICKPOCKET_Condition;
	information	= DIA_Addon_Martin_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Martin_PICKPOCKET_Condition()
{
	C_Beklauen (65, 77);
};
 
FUNC VOID DIA_Addon_Martin_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Martin_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Martin_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Martin_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Martin_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Martin_PICKPOCKET_DoIt);
};

func void DIA_Addon_Martin_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Martin_PICKPOCKET);
};
	
func void DIA_Addon_Martin_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Martin_PICKPOCKET);
};

///////////////////////////////////////////////////////////////////////
//	Info MeetingIsRunning
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_MeetingIsRunning		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	1;
	condition	 = 	DIA_Addon_Martin_MeetingIsRunning_Condition;
	information	 = 	DIA_Addon_Martin_MeetingIsRunning_Info;
	important	 = 	TRUE;
	permanent	 = 	TRUE;
};

func int DIA_Addon_Martin_MeetingIsRunning_Condition ()
{
	if (Npc_IsInState (self,ZS_Talk))
	&& (RangerMeetingRunning == LOG_RUNNING)
		{
			return TRUE;
		};	
};
var int DIA_Addon_Martin_MeetingIsRunning_OneTime;
func void DIA_Addon_Martin_MeetingIsRunning_Info ()
{
	if (DIA_Addon_Martin_MeetingIsRunning_OneTime == FALSE)
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_00"); //Ainsi, c'est vous, le nouveau ? Bienvenue parmi nous, frère de l'Anneau.
		DIA_Addon_Martin_MeetingIsRunning_OneTime = TRUE;
	}
	else
	{
		AI_Output			(self, other, "DIA_Addon_Cord_MeetingIsRunning_07_01"); //Allez d'abord voir Vatras. Ensuite, peut-être aurai-je du temps à vous consacrer.
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Hallo		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Hallo_Condition;
	information	 = 	DIA_Addon_Martin_Hallo_Info;
	
	important	 = 	TRUE;
};

func int DIA_Addon_Martin_Hallo_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<1000)
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	&& (RangerMeetingRunning != LOG_SUCCESS)
	&& (SC_IsRanger == FALSE)
	&& (other.guild != GIL_MIL)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Addon_Martin_Hallo_Info ()
{
	AI_Output	(self, other, "DIA_Addon_Martin_Hallo_07_00"); //Hé, vous ! Vous n'avez rien à faire ici. Seuls les paladins et les miliciens ont accès à cet endroit.
};


///////////////////////////////////////////////////////////////////////
//	Info WasMachstDu
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_WasMachstDu		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_WasMachstDu_Condition;
	information	 = 	DIA_Addon_Martin_WasMachstDu_Info;

	description	 = 	"Que se passe-t-il donc ici ?";
};

func int DIA_Addon_Martin_WasMachstDu_Condition ()
{
	if (Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<1000)
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_WasMachstDu_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_WasMachstDu_15_00"); //Que se passe-t-il donc ici ?
	AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_01"); //Il s'agit du cellier à provisions de la garde royale des paladins.
	
	if (other.guild == GIL_NONE)
	&& (SC_IsRanger == FALSE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_02"); //Je suis le maître du cellier - j'ai ordre de veiller à ce que les réserves des paladins ne disparaissent pas inopinément. Aussi, votre présence ici n'est pas souhaitable.
		AI_Output	(self, other, "DIA_Addon_Martin_WasMachstDu_07_03"); //Alors gardez vos mains dans vos poches, ou je les trancherai.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_PreTrade		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_PreTrade_Condition;
	information	 = 	DIA_Addon_Martin_PreTrade_Info;

	description	 = 	"Pouvez-vous me vendre des marchandises issues des réserves des paladins ?";
};

func int DIA_Addon_Martin_PreTrade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_PreTrade_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_00"); //Pouvez-vous me vendre des marchandises issues des réserves des paladins ?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_01"); //Vous voulez acheter quelque chose ? Hmm. Disons que si vous me dédommagez en contrepartie des soucis que me donneront la disparition de certains biens des paladins, peut-être pourrons-nous faire affaires.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_02"); //Est-ce que cela arrive souvent, que des biens disparaissent ?
	AI_Output	(self, other, "DIA_Addon_Martin_PreTrade_07_03"); //Tant que le maître du cellier constate que tout va bien, non.
	AI_Output	(other, self, "DIA_Addon_Martin_PreTrade_15_04"); //Je vois...
};

///////////////////////////////////////////////////////////////////////
//	Info Farim
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Farim		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Farim_Condition;
	information	 = 	DIA_Addon_Martin_Farim_Info;

	description	 = 	"Farim le pêcheur a des problèmes avec la milice.";
};

func int DIA_Addon_Martin_Farim_Condition ()
{
	if (MIS_Addon_Farim_PaladinFisch == LOG_RUNNING)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_PreTrade))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_Farim_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_00"); //Farim le pêcheur a des soucis avec la milice. Les hommes lui dérobent sans cesse du poisson.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_01"); //Et en quoi est-ce que cela me regarde ?
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_02"); //Vous avez une certaine influence ici, auprès des paladins.
	AI_Output	(other, self, "DIA_Addon_Martin_Farim_15_03"); //Farim a besoin de votre protection. Il est prêt à vous remettre une partie de sa pêche, en contrepartie de vos services...
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_04"); //Je vois ce que vous voulez dire.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_05"); //(dédaigneux) Du poisson ! Comme si je n'avais pas déjà assez de camelote en tout genre sur les bras !
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_06"); //Dites à votre ami de venir me voir et de me dire exactement ce qui ne va pas avec la milice.
	AI_Output	(self, other, "DIA_Addon_Martin_Farim_07_07"); //J'y veillerai.
	
	B_LogEntry (TOPIC_Addon_FarimsFish,	"Martin, le maître du cellier, s'occupera de cette affaire."); 

	Martin_KnowsFarim = TRUE;
	B_GivePlayerXP (XP_Addon_FarimSchutz);
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Trade		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	80;
	condition	 = 	DIA_Addon_Martin_Trade_Condition;
	information	 = 	DIA_Addon_Martin_Trade_Info;
	Trade		 = 	TRUE;
	permanent	 = 	TRUE;

	description	 = 	"Qu'avez-vous à m'offrir ?";
};

func int DIA_Addon_Martin_Trade_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_PreTrade))
		{
			return TRUE;
		};
};
var int DIA_Addon_Martin_Trade_OneTime;
func void DIA_Addon_Martin_Trade_Info ()
{
	if (DIA_Addon_Martin_Trade_OneTime == FALSE)
	{
		Log_CreateTopic	(TOPIC_CityTrader, LOG_NOTE);
		B_LogEntry (TOPIC_CityTrader, LogText_Addon_MartinTrade); 
		DIA_Addon_Martin_Trade_OneTime = TRUE;
	};
	
	
	AI_Output	(other, self, "DIA_Addon_Martin_Trade_15_00"); //Que proposez-vous ?
	B_GiveTradeInv (self);
	AI_Output	(self, other, "DIA_Addon_Martin_Trade_07_01"); //Alors écoutez-moi bien.
};


///////////////////////////////////////////////////////////////////////
//	Info Rangerhelp
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Rangerhelp		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_Rangerhelp_Condition;
	information	 = 	DIA_Addon_Martin_Rangerhelp_Info;

	description	 = 	"C'est Lares qui m'envoie.";
};

func int DIA_Addon_Martin_Rangerhelp_Condition ()
{
	if (RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
	&& (hero.guild == GIL_NONE)
		{
			return TRUE;
		};		
};

func void DIA_Addon_Martin_Rangerhelp_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_00"); //C'est Lares qui m'envoie. Il m'a dit que vous pourriez m'aider.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_01"); //Vraiment ? Ha ! Dites toujours. Que voulez-vous de moi ?
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_02"); //Je veux intégrer la milice.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_03"); //(rires) Oh, vous aimeriez intégrer la milice, hein ? Nous n'acceptons pas la vermine comme vous sans raison.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_04"); //Vous devriez déjà...
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_05"); //Epargnez-moi vos inepties. Dites-moi ce que je dois faire pour me joindre à vous.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_06"); //(étonné) Bien. Alors écoutez-moi attentivement.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_07"); //Le travail du maître du cellier ce n'est pas sinécure, je vous l'assure. La gestion des caisses et des sacs dans cet entrepôt est déjà bien pénible.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_08"); //Mais chaque fois que je passe une soirée à la taverne de Kardif, quelqu'un vient regarder les caisses de plus près... et lorsque je reviens, le lendemain matin, il manque toujours quelque chose.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_09"); //(en colère) Etrangement, les paladins ne voient jamais rien.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_10"); //(irrité) Je deviens fou. Je refuse de passer la nuit planté ici, comme un imbécile.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_11"); //Vous, en revanche...
	AI_Output	(other, self, "DIA_Addon_Martin_Rangerhelp_15_12"); //J'ai compris. Je monte la garde ici pendant que vous allez vous désaltérer à la taverne.
	AI_Output	(self, other, "DIA_Addon_Martin_Rangerhelp_07_13"); //C'est à prendre ou à laisser.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Je suis censé surveiller les caisses de Martin, le maître du cellier. Si je parviens à attraper le type qui fouille dans ses caisses, Martin m'aidera à intégrer la milice."); 

}; 

///////////////////////////////////////////////////////////////////////
//	Info Auftrag
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Auftrag		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_Auftrag_Condition;
	information	 = 	DIA_Addon_Martin_Auftrag_Info;

	description	 = 	"Je surveillerai vos caisses de provisions ce soir.";
};

func int DIA_Addon_Martin_Auftrag_Condition ()
{
	if (RangerHelp_gildeMIL == TRUE)
	&& (Npc_KnowsInfo (other, DIA_Addon_Martin_Rangerhelp))
	&& (hero.guild == GIL_NONE)
		{
			return TRUE;
		};
};

var int MIS_Addon_Martin_GetRangar_Day;

func void DIA_Addon_Martin_Auftrag_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Auftrag_15_00"); //Je surveillerai vos caisses de provisions ce soir.
	AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_01"); //(satisfait) Bien.
	
	if (Wld_IsTime (23,00,04,00))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_02"); //Dans ce cas, je vais me mettre en route pour la taverne de Kardif. Et je vous souhaite qu'il ne manque rien à mon retour.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Auftrag_07_03"); //Bien, dans ce cas, revenez ici ce soir et gardez un œil sur les marchandises entreposées ici. Entre-temps, je vais faire un tour à la taverne de Kardif.
	};

	B_StartOtherRoutine	(MIL_321_Rangar,"PrePalCampKlau"); 

	Info_ClearChoices	(DIA_Addon_Martin_Auftrag);
	Info_AddChoice	(DIA_Addon_Martin_Auftrag, "(plus)", DIA_Addon_Martin_Auftrag_weiter );

};

func void DIA_Addon_Martin_Auftrag_weiter ()
{
	MIS_Addon_Martin_GetRangar = LOG_RUNNING;
	MIS_Addon_Martin_GetRangar_Day = Wld_GetDay(); 
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
	B_StartOtherRoutine	(MIL_321_Rangar,"PalCampKlau");
};



// ********************************************************************
// 							Banditen + Waffen
// ********************************************************************
///////////////////////////////////////////////////////////////////////
//	From Vatras
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_FromVatras (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_FromVatras_Condition;
	information	= DIA_Addon_Martin_FromVatras_Info;

	description	= "Vous recherchez l'homme qui revend des armes aux bandits ?";
};
func int DIA_Addon_Martin_FromVatras_Condition ()
{
	if (Vatras_ToMartin == TRUE)
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_FromVatras_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_00"); //Vous recherchez l'homme qui revend des armes aux bandits ?
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_01"); //Selon qui ?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_02"); //Selon Vatras.
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_03"); //Oh. Et qu'est-ce que vous en savez ?
	AI_Output (other, self, "DIA_Addon_Martin_FromVatras_15_04"); //Pas grand-chose, mais je pourrais me renseigner...
	AI_Output (self, other, "DIA_Addon_Martin_FromVatras_07_05"); //(comprend) Ah, vraiment...?
};	
///////////////////////////////////////////////////////////////////////
//	Tell Me
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_TellAll (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_TellAll_Condition;
	information	= DIA_Addon_Martin_TellAll_Info;

	description	= "Dites-moi un peu, que savez-vous du marchand d'armes ?";
};
func int DIA_Addon_Martin_TellAll_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_FromVatras))
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_TellAll_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_TellAll_15_00"); //Dites-moi un peu, que savez-vous du marchand d'armes ?
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_01"); //Ecoutez. Nous savons qu'un citoyen influent de la haute ville est certainement responsable de ce marché.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_02"); //De plus, certaines armes proviendraient des réserves de la milice.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_03"); //Mais nous ne connaissons toujours pas l'identité du responsable.
	AI_Output (self, other, "DIA_Addon_Martin_TellAll_07_04"); //Si vous avez le courage d'affronter un groupe de cinq bandits au moins, peut-être pouvez-vous tenter d'en apprendre davantage...
	B_LogEntry (TOPIC_Addon_BanditTrader,"Aux dires de Martin, le marchand d'armes est un citoyen influent de la haute ville."); 
};	
///////////////////////////////////////////////////////////////////////
//	About Bandits
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_AboutBandits (C_INFO)
{
	npc		 	= Mil_350_Addon_Martin;
	nr		 	= 5;
	condition	= DIA_Addon_Martin_AboutBandits_Condition;
	information	= DIA_Addon_Martin_AboutBandits_Info;

	description	= "Quel est le problème avec les bandits ?";
};
func int DIA_Addon_Martin_AboutBandits_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_TellAll))
	{
		return TRUE;
	};
};
func void DIA_Addon_Martin_AboutBandits_Info ()
{
	AI_Output (other, self, "DIA_Addon_Martin_AboutBandits_15_00"); //Quel est le problème avec les bandits ?
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_01"); //Nous savons que les bandits ont érigé des barrages sur les routes reliant les fermes à la ville.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_02"); //De plus, je sais qu'une cargaison d'armes a dû leur être livrée ces dernières jours.
	AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_03"); //Peut-être les bandits détiennent-ils quelques indices qui vous permettront de dévoiler l'identité du marchand d'armes...?
	//AI_Output (self, other, "DIA_Addon_Martin_AboutBandits_07_04"); //Ich werd sehen, was ich tun kann
	
	MIS_Martin_FindTheBanditTrader = LOG_RUNNING;
	B_LogEntry (TOPIC_Addon_BanditTrader,"Les bandits ont établi des barrages sur les routes entre le port et les fermes. Peut-être pourrai-je y trouver un indice susceptible de confondre le marchand d'armes..."); 
};	

///////////////////////////////////////////////////////////////////////
//	Info Fernando
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Fernando		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Martin_Fernando_Condition;
	information	 = 	DIA_Addon_Martin_Fernando_Info;
	permanent	 = 	TRUE;

	description	 = 	"A propos du marchand d'armes...";
};

func int DIA_Addon_Martin_Fernando_Condition ()
{
	if (MIs_Martin_FindTheBanditTrader == LOG_RUNNING)
		{
			return TRUE;
		};
};

var int Martin_IrrlichtHint;

func void DIA_Addon_Martin_Fernando_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_00"); //Heu, à propos du marchand d'armes...

	if 	(Npc_HasItems (other,ItMw_Addon_BanditTrader))
	||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
	||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
	||(Fernando_HatsZugegeben == TRUE)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_01"); //Montrez-moi ce que vous avez trouvé.
	
		var int FernandoHints;
		FernandoHints = 0;
		
		if 	(
			(Npc_HasItems (other,ItMw_Addon_BanditTrader))
			||(Npc_HasItems (other,ItRi_Addon_BanditTrader))
			||((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
			)
			{
				
				if (Npc_HasItems (other,ItMw_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_02"); //J'ai trouvé cette rapière chez les bandits. La lettre 'F' est gravée sur le pommeau.
					FernandoHints = (FernandoHints + 1);
				};
				if (Npc_HasItems (other,ItRi_Addon_BanditTrader))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_03"); //Les bandits détenaient cette bague. Elle porte la marque d'un commerçant étranger.
					FernandoHints = (FernandoHints + 1);
				};
				if ((Npc_HasItems (other,ItWr_Addon_BanditTrader))&&(BanditTrader_Lieferung_Gelesen == TRUE))
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_04"); //Cette liste d'armes et d'autres biens livrés aux bandits est signée de la main d'un certain Fernando.
					FernandoHints = (FernandoHints + 3);
				};
			
				if (Fernando_HatsZugegeben == TRUE)
				{
					AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_05"); //De plus, Fernando, le vieux marchand de la haute ville, a avoué avoir fait affaires avec les bandits.
					FernandoHints = (FernandoHints + 1);
				};
			}
			else
			{
				AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_06"); //Fernando a avoué avoir fourni des armes aux bandits.
			};
			
		if (FernandoHints >= 3)
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_07"); //Je pense que cela suffira. Fernando, donc... Eh bien, il va désormais récolter ce qu'il a semé.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_08"); //Et dire qu'il agit toujours comme s'il était en odeur de sainteté...
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_09"); //Je veillerai personnellement à ce qu'il soit enfermé jusqu'à la fin de sa misérable vie.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_10"); //Du beau travail, je l'avoue.
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_11"); //Vatras sera heureux d'apprendre cette nouvelle.
			B_StartOtherRoutine	(Fernando,"Prison");
			Fernando_ImKnast = TRUE;
			MIs_Martin_FindTheBanditTrader = LOG_SUCCESS;
			B_LogEntry (TOPIC_Addon_BanditTrader,"Martin veillera à ce que Fernando purge sa peine. Je devrais en informer Vatras."); 

			B_GivePlayerXP (XP_Addon_FernandoMartin);
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_12"); //Et ? Quoi d'autre ?
			AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_13"); //C'est tout.
		
			if (Fernando_HatsZugegeben == TRUE)
			{
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_14"); //C'est bien qu'il l'admette, mais malheureusement, sans preuve plus solide, je ne peux rien faire de plus.
				AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_15"); //Je ne désire pas avoir l'air idiot lorsque je ferai face au seigneur Hagen. Il va falloir que vous me rameniez davantage d'indices.
			}
			else
			{
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_16"); //Cela ne suffit pas. Il pourrait s'agir de presque n'importe quel habitant de la haute ville.
				AI_Output (self, other, "DIA_Addon_Martin_Fernando_07_17"); //Visiblement, vous allez devoir remonter la filière des bandits et des armes jusqu'à ce que nous découvrions le responsable de ce commerce...
				if (Martin_IrrlichtHint == FALSE)
				{
					AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_18"); //Peut-être devriez-vous retourner voir Vatras...
					Martin_IrrlichtHint = TRUE;
				};
			};
		};
	}
	else
	{
		AI_Output	(other, self, "DIA_Addon_Martin_Fernando_15_19"); //Qu'avez-vous dit ?
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_20"); //Ecoutez. Vous devez trouver le responsable des livraisons d'armes que reçoivent les bandits et m'apporter la preuve de ses agissements.
		AI_Output	(self, other, "DIA_Addon_Martin_Fernando_07_21"); //Mais il me faudra des preuves réellement incontestables. Dans le cas contraire, je ne pourrai pas arrêter ce félon.
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_Perm		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	90;
	condition	 = 	DIA_Addon_Martin_Perm_Condition;
	information	 = 	DIA_Addon_Martin_Perm_Info;
	permanent	 = 	TRUE;

	description	 = 	"Toutes les caisses sont toujours là ?";
};

func int DIA_Addon_Martin_Perm_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_WasMachstDu))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_Perm_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_Perm_15_00"); //Toutes les caisses sont toujours là ?
	
	if (MIS_Addon_Martin_GetRangar_Day <= (Wld_GetDay()-2))
	&&	(MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_01"); //(en colère) Espèce d'ordure, vous étiez censé veiller sur mes caisses. Maintenant, il manque encore quelque chose.

		if (Wld_IsTime (24,00,03,00))
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_02"); //(fort) Rendez-vous tout de suite au cellier du port et ramenez-moi l'ordure qui m'a volé, compris ?
		}
		else
		{
			AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_03"); //Et vous aurez intérêt à faire plus attention ce soir lorsque je serai parti, c'est bien compris ?!
		};	
	}	
	else if ((MIS_Addon_Martin_GetRangar != 0) || (hero.guild != GIL_NONE) || (Sc_IsRanger == TRUE))
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_04"); //Allez-y, moquez-vous de moi. Essayez donc de rester debout sur la jetée à longueur de journée pour surveiller toute cette pagaille.
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_05"); //Les paladins ont apporté tellement de gadgets en tout genre que ça n'est même plus drôle.
	}
	else
	{
		AI_Output	(self, other, "DIA_Addon_Martin_Perm_07_06"); //Ne touchez à rien ou j'appelle la garde, c'est compris ?
	};
};

///////////////////////////////////////////////////////////////////////
//	Info GotRangar
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GotRangar		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_GotRangar_Condition;
	information	 = 	DIA_Addon_Martin_GotRangar_Info;

	description	 = 	"J'ai attrapé le voleur.";
};

func int DIA_Addon_Martin_GotRangar_Condition ()
{
	if (MIS_Addon_Martin_GetRangar == LOG_RUNNING)
	&& (SC_GotRangar == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_GotRangar_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_00"); //J'ai attrapé le voleur.
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_01"); //C'est Rangar qui farfouille dans vos réserves.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_02"); //Ah, enfin. Maintenant, je sais au moins qui je dois garder à l'œil. Cette crapule... Si je le prends la main dans le sac, il le sentira passer !
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_03"); //Je me suis toujours demandé pourquoi aucun des paladins n'avait jamais rien vu...
	AI_Output	(other, self, "DIA_Addon_Martin_GotRangar_15_04"); //Et ? Pourquoi ?
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_05"); //C'est évident. Ces imbéciles n'arrivent pas à distinguer un milicien de l'autre. Pour eux, nous nous ressemblons tous.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_06"); //C'est du beau travail, mon gars.
	AI_Output	(self, other, "DIA_Addon_Martin_GotRangar_07_07"); //Si je peux faire quoi que ce soit pour vous, n'hésitez pas à me demander.

	MIS_Addon_Martin_GetRangar = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_Martin_GotRangar_Report);
};

///////////////////////////////////////////////////////////////////////
//	Info GetMiliz
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Martin_GetMiliz		(C_INFO)
{
	npc		 = 	Mil_350_Addon_Martin;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Martin_GetMiliz_Condition;
	information	 = 	DIA_Addon_Martin_GetMiliz_Info;

	description	 = 	"Vous savez ce que je demande de vous...";
};

func int DIA_Addon_Martin_GetMiliz_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Addon_Martin_GotRangar))
		{
			return TRUE;
		};
};

func void DIA_Addon_Martin_GetMiliz_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Martin_GetMiliz_15_00"); //Vous savez ce que je demande de vous...
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_01"); //Oh, ouais - vous voulez intégrer la milice, c'est ça ?
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_02"); //En ce qui me concerne, vous avez déjà prouvé de quoi vous êtes capable.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_03"); //Eh bien, disons que je préfère vous savoir de mon côté que du côté de quelqu'un d'autre.
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_04"); //C'est pourquoi je vais vous aider. Prenez cette lettre de recommandation et montrez-la à André, le commandant des paladins.
	CreateInvItems (self, ItWr_Martin_MilizEmpfehlung_Addon, 1);									
	B_GiveInvItems (self, other, ItWr_Martin_MilizEmpfehlung_Addon, 1);		
	AI_Output	(self, other, "DIA_Addon_Martin_GetMiliz_07_05"); //Vous le trouverez dans la caserne. Je suis sûr qu'il aurait bien besoin de vos services.

	B_LogEntry (TOPIC_Addon_RangerHelpMIL,"Martin m'a remis une lettre de recommandation pour André, le commandant des paladins. Grâce à elle, André me permettra d'intégrer la milice. Je trouverai certainement André à la caserne."); 
};


