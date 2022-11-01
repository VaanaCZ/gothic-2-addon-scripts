///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_EXIT   (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 999;
	condition   = DIA_Constantino_EXIT_Condition;
	information = DIA_Constantino_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Constantino_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Constantino_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Constantino_PICKPOCKET (C_INFO)
{
	npc			= VLK_417_Constantino;
	nr			= 900;
	condition	= DIA_Constantino_PICKPOCKET_Condition;
	information	= DIA_Constantino_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Constantino_PICKPOCKET_Condition()
{
	C_Beklauen (59, 90);
};
 
FUNC VOID DIA_Constantino_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Constantino_PICKPOCKET);
	Info_AddChoice		(DIA_Constantino_PICKPOCKET, DIALOG_BACK 		,DIA_Constantino_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Constantino_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Constantino_PICKPOCKET_DoIt);
};

func void DIA_Constantino_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Constantino_PICKPOCKET);
};
	
func void DIA_Constantino_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Constantino_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_Hallo   (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_Hallo_Condition;
	information = DIA_Constantino_Hallo_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Constantino_Hallo_Condition()
{	
	if (Npc_IsInState (self, ZS_Talk))
	&& (self.aivar[AIV_TalkedToPlayer] == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_Hallo_Info()
{
	//ADDON	AI_Output (self, other,"DIA_Constantino_Hallo_10_00"); //Was willst du? Hier gibt es nichts umsonst und ich werde dir auch nichts verkaufen.
	AI_Output (self, other,"DIA_Addon_Constantino_Hallo_10_00"); //Que voulez-vous ? Je ne donne rien du tout.
};

///////////////////////////////////////////////////////////////////////
//	Suche Stelle als Lehrling
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_AboutLehrling (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_AboutLehrling_Condition;
	information = DIA_Constantino_AboutLehrling_Info;
	permanent   = FALSE;
	description = "Je cherche à devenir apprenti.";
};
FUNC INT DIA_Constantino_AboutLehrling_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_AboutLehrling_Info()
{
	AI_Output (other, self,"DIA_Constantino_AboutLehrling_15_00"); //Je cherche à devenir apprenti.
	AI_Output (self, other,"DIA_Constantino_AboutLehrling_10_01"); //Vraiment ? Et par qui comptez-vous vous faire engager ?
};

///////////////////////////////////////////////////////////////////////
//	Info Heilung
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_Heilung   (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 5;
	condition   = DIA_Constantino_Heilung_Condition;
	information = DIA_Constantino_Heilung_Info;
	permanent   = FALSE;
	Description = "Je cherche des soins.";
};
FUNC INT DIA_Constantino_Heilung_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_Heilung_Info()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_15_00"); //J'ai besoin de soins.
	AI_Output (self, other,"DIA_Constantino_Heilung_10_01"); //(sèchement) Pourquoi ? Vous êtes blessé ?
	
	Info_ClearChoices (DIA_Constantino_Heilung);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Pas vraiment.",DIA_Constantino_Heilung_Nein);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Oui.",DIA_Constantino_Heilung_Ja);
	
};
FUNC VOID DIA_Constantino_Heilung_Ja()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Ja_15_00"); //Oui.
	
	if (other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_01"); //Allez voir Vatras, il vous soignera. Et arrêtez de mettre du sang partout, vous voulez bien ?
	}
	else 
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_02"); //Vous avez à peine quelques égratignures et j'ai mieux à faire que perdre mon temps à vous parler.
	};
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Constantino_Heilung_Nein()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Nein_15_00"); //Pas vraiment.
	AI_Output (self, other,"DIA_Constantino_Heilung_Nein_10_01"); //Dans ce cas, fichez-moi le quand ou vous risquez fort de l'être dans quelques instants...
	
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info LestersKraeuter
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Constantino_LestersKraeuter		(C_INFO)
{
	npc		 = 	VLK_417_Constantino;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Constantino_LestersKraeuter_Condition;
	information	 = 	DIA_Addon_Constantino_LestersKraeuter_Info;

	description	 = 	"Puis-je vous vendre quelques herbes ?";
};

func int DIA_Addon_Constantino_LestersKraeuter_Condition ()
{
	if (MIS_Constantino_BringHerbs == 0)
	&& (MIS_Addon_Lester_PickForConstantino != 0)
		{
			return TRUE;
		};
};

func void DIA_Addon_Constantino_LestersKraeuter_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Constantino_LestersKraeuter_15_00"); //Puis-je vous vendre quelques herbes ?
	AI_Output	(self, other, "DIA_Addon_Constantino_LestersKraeuter_10_01"); //Si vous en avez à proposer
	B_GivePlayerXP (XP_Ambient);	
};

///////////////////////////////////////////////////////////////////////
//	Info Trade
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Constantino_Trade   (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 700;
	condition   = DIA_Constantino_Trade_Condition;
	information = DIA_Constantino_Trade_Info;
	permanent   = TRUE;
	description = "Montrez-moi vos marchandises.";
	trade		= TRUE;
};
FUNC INT DIA_Constantino_Trade_Condition()
{	
	return TRUE;								
};
FUNC VOID DIA_Constantino_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other, self,"DIA_Constantino_Trade_15_00"); //Montrez-moi vos marchandises.
	
	if ( Constantino_Logpatch1 == FALSE)
	{
		Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
		B_LogEntry (Topic_CityTrader,"Constantino vend du matériel d'alchimie."); 
		
		Constantino_Logpatch1 = TRUE;
	};
};

// *******************************************************
//						Bei Dir!		//e2
// *******************************************************
instance DIA_Constantino_BeiDir (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_BeiDir_Condition;
	information = DIA_Constantino_BeiDir_Info;
	permanent   = FALSE;
	description = "Je veux m'engager auprès de vous comme apprenti.";
};
FUNC INT DIA_Constantino_BeiDir_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Constantino_AboutLehrling))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_BeiDir_Info()
{
	AI_Output (other, self,"DIA_Constantino_BeiDir_15_00"); //Je voudrais devenir votre apprenti.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_01"); //MON apprenti ? Hors de question ! J'ai déjà eu l'honneur douteux d'avoir un apprenti il y a quelque temps, et je suis vacciné depuis, merci.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_02"); //J'ai investi plusieurs années de mon temps dans sa formation et, au bout du compte, il a fallu que cet ignare s'empoisonne.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_03"); //Allez donc vous faire engager par l'un des autres maîtres.
};

// *******************************************************
//						Bei anderem Meister		//e2
// *******************************************************
instance DIA_Constantino_ZUSTIMMUNG (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_ZUSTIMMUNG_Condition;
	information = DIA_Constantino_ZUSTIMMUNG_Info;
	permanent   = TRUE;
	description = "Je veux m'engager comme apprenti auprès d'un des autres maîtres.";
};
FUNC INT DIA_Constantino_ZUSTIMMUNG_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Constantino_AboutLehrling))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_ZUSTIMMUNG_Info()
{
	AI_Output (other, self,"DIA_Constantino_ZUSTIMMUNG_15_00"); //Je voudrais devenir l'apprenti de l'un des autres maîtres.
	AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_01"); //Et vous venez me demander mon accord, c'est ça ?
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_02"); //Bah. Pour ce que j'en ai à faire, vous pouvez devenir l'apprenti de n'importe qui.
		
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_03"); //Eh bien, vous ne l'aurez pas ! Ce que j'ai entendu à votre sujet ne me dit rien qui vaille.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_04"); //Il est hors de question que je permette à un criminel tel que vous d'être considéré comme un citoyen.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_05"); //Ma réponse sera négative tant que cette affaire n'aura pas été réglée avec le commandant de la garde.
		
	};
	
	if ( Constantino_Logpatch2 == FALSE)
	{
	 
	 Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	 Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	 B_LogEntry (TOPIC_Lehrling,"Constantino accepte que je devienne apprenti tant que je ne suis pas accusé d'un crime en ville.");	
	
	 Constantino_Logpatch2 = TRUE;
	  	
	};
};

// *******************************************************
//						Was muß ich tun?		//e3
// *******************************************************
instance DIA_Constantino_BringHerbs (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_BringHerbs_Condition;
	information = DIA_Constantino_BringHerbs_Info;
	permanent   = FALSE;
	description = "Que devrai-je faire pour devenir VOTRE apprenti ?";
};
FUNC INT DIA_Constantino_BringHerbs_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Constantino_BeiDir))
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_BringHerbs_Info()
{
	AI_Output (other, self,"DIA_Constantino_BringHerbs_15_00"); //Que faudrait-il que je fasse pour devenir votre apprenti ?
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_01"); //(soupire) Je ne pourrais pas supporter d'avoir la mort d'un autre amateur sur la conscience.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_02"); //Il existe un grand nombre de plantes. Selon les mélanges effectués et les quantités utilisées, le résultat obtenu peut être extrêmement varié.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_03"); //Et vous ne devez même pas connaître la moitié de ces plantes.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_04"); //(soupire) Tenez, voici la liste des plus importantes.
	B_GiveInvItems (self, other, ItWr_Kraeuterliste, 1);
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_05"); //Ramenez-moi une plante de chaque espèce et je réfléchirai à la question.
	
	MIS_Constantino_BringHerbs = LOG_RUNNING;
	Log_CreateTopic (TOPIC_ConstantinoPlants,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ConstantinoPlants,LOG_RUNNING);
	B_LogEntry (TOPIC_ConstantinoPlants,"Constantino veut une plante de chaque espèce sinon il ne m'acceptera pas comme apprenti.");
	
};

// *******************************************************
//					Wegen der Pflanzen		//e4
// *******************************************************
instance DIA_Constantino_HerbsRunning (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_HerbsRunning_Condition;
	information = DIA_Constantino_HerbsRunning_Info;
	permanent   = TRUE;
	description = "Au sujet des plantes...";
};
FUNC INT DIA_Constantino_HerbsRunning_Condition()
{	
	if (MIS_Constantino_BringHerbs == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_HerbsRunning_Info()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_15_00"); //Au sujet de vos plantes...
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_10_01"); //Si vous n'êtes pas capable de vous débrouiller seul, vous ne ferez jamais un bon alchimiste !
	
	Info_ClearChoices (DIA_Constantino_HerbsRunning);
	Info_AddChoice (DIA_Constantino_HerbsRunning, "Je vois.", DIA_Constantino_HerbsRunning_Running);
	if (Npc_HasItems (other, ItPl_Mana_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Mana_Herb_02) > 0)
	&& (Npc_HasItems (other, ItPl_Mana_Herb_03) > 0)
	&& (Npc_HasItems (other, ItPl_Health_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Health_Herb_02) > 0)
	&& (Npc_HasItems (other, ItPl_Health_Herb_03) > 0)
	&& (Npc_HasItems (other, ItPl_Dex_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Strength_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Speed_Herb_01) > 0)
	&& (Npc_HasItems (other, ItPl_Temp_Herb) > 0)
	&& (Npc_HasItems (other, ItPl_Perm_Herb) > 0)
	{
		Info_AddChoice (DIA_Constantino_HerbsRunning, "J'ai toutes les plantes que je devais vous rapporter !", DIA_Constantino_HerbsRunning_Success);
	};
};

func void DIA_Constantino_HerbsRunning_Success()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_Success_15_00"); //J'ai là toutes les plantes que vous vouliez que je vous ramène.
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_01"); //Comment ? Vous vous moquez de moi, non ?

	//11 Gegenstände gegeben (Pflanzen) HACK für Screen ADDON
	AI_PrintScreen ("11 Gegenstände gegeben (Pflanzen)", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
	Npc_RemoveInvItems (other, ItPl_Mana_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Mana_Herb_02,1);
	Npc_RemoveInvItems (other, ItPl_Mana_Herb_03,1);
	Npc_RemoveInvItems (other, ItPl_Health_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Health_Herb_02,1);
	Npc_RemoveInvItems (other, ItPl_Health_Herb_03,1);
	Npc_RemoveInvItems (other, ItPl_Dex_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Strength_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Speed_Herb_01,1);
	Npc_RemoveInvItems (other, ItPl_Temp_Herb,1);
	Npc_RemoveInvItems (other, ItPl_Perm_Herb,1);
	
	CreateInvItems (self, ItPl_Mana_Herb_01,1);
	CreateInvItems (self, ItPl_Mana_Herb_02,1);
	CreateInvItems (self, ItPl_Mana_Herb_03,1);
	CreateInvItems (self, ItPl_Health_Herb_01,1);
	CreateInvItems (self, ItPl_Health_Herb_02,1);
	CreateInvItems (self, ItPl_Health_Herb_03,1);
	CreateInvItems (self, ItPl_Dex_Herb_01,1);
	CreateInvItems (self, ItPl_Strength_Herb_01,1);
	CreateInvItems (self, ItPl_Speed_Herb_01,1);
	CreateInvItems (self, ItPl_Temp_Herb,1);
	CreateInvItems (self, ItPl_Perm_Herb,1);
	
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_02"); //Par Adanos ! C'est pourtant vrai !
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_03"); //Qui sait ? Peut-être avez-vous le potentiel pour faire un bon alchimiste après tout...
	
	
	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP (XP_Constantino_Herbs);
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Constantino m'acceptera comme apprenti pour autant que les autres maîtres soient d'accord.");
	
	Info_ClearChoices (DIA_Constantino_HerbsRunning);
};

func void DIA_Constantino_HerbsRunning_Running()
{
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_Running_15_00"); //Je vois.
	Info_ClearChoices (DIA_Constantino_HerbsRunning);
};

// *******************************************************
//						LEHRLING		//e5
// *******************************************************

var int Constantino_StartGuild;
// ----------------------------

instance DIA_Constantino_LEHRLING (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_LEHRLING_Condition;
	information = DIA_Constantino_LEHRLING_Info;
	permanent   = TRUE;
	description = "Puis-je devenir votre apprenti maintenant ?";
};
FUNC INT DIA_Constantino_LEHRLING_Condition()
{	
	if (MIS_Constantino_BringHerbs == LOG_SUCCESS)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_LEHRLING_Info()
{
	var int stimmen;
	stimmen = 0;
	
	AI_Output (other, self,"DIA_Constantino_LEHRLING_15_00"); //Alors, puis-je devenir votre apprenti ?
	
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		// ------ Constantino ------
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_01"); //Pour ma part, oui.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_02"); //La seule chose qui compte aux yeux d'Harad, c'est que vous soyez capable d'aider à défendre la ville si les orques venaient à nous attaquer.
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_03"); //Et on dirait que vous l'en avez convaincu.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_04"); //Mais il est persuadé que vous n'êtes qu'un lâche.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_05"); //Mais il affirme qu'il ne vous a jamais vu.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_06"); //Bosper s'est montré très réticent à l'idée de me parler de vous.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_07"); //J'imagine qu'il préférerait que vous deveniez son apprenti plutôt que le mien.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_08"); //Mais il a tout de même fini par accepter.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_09"); //Refuser de vous donner son accord pour cette raison est vraiment tout sauf honorable !
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_10"); //Mais si tous les autres maîtres sont d'accord, vous n'aurez pas besoin de son aval.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_11"); //Et Bosper ne vous connaît pas encore.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_12"); //Thorben est très croyant.
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_13"); //Il vous a donné sa bénédiction, ce qui est un très bon signe.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_14"); //Il ne vous donnera son aval que si vous recevez la bénédiction des dieux.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_15"); //Thorben ne vous connaît pas.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_16"); //Quant à Mattéo, il ne cesse de chanter vos louanges.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_17"); //Mattéo dit que vous lui devez quelque chose et qu'il serait bon de songer à régler cette affaire si vous voulez obtenir son accord.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_18"); //Mattéo dit qu'il ne vous a pas encore parlé à ce sujet.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_19"); //Mattéo dit qu'il ne vous a jamais vu dans sa boutique.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_20"); //Cela signifie que vous avez l'accord de tous les maîtres !
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_21"); //Cela signifie que vous avez l'accord de quatre des maîtres, ce qui suffit pour être accepté comme apprenti.
			};
			
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_22"); //Etes-vous prêt à devenir mon apprenti ?
			
			Info_ClearChoices (DIA_Constantino_LEHRLING);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Je dois d'abord dormir.", DIA_Constantino_LEHRLING_Later);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Oui, maître.", DIA_Constantino_LEHRLING_Yes);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_23"); //Vous devez obtenir l'accord de quatre maîtres au moins pour pouvoir être accepté comme apprenti dans le bas quartier.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_24"); //Cela signifie qu'il vous faut aller parler à ceux qui ne sont pas encore convaincus de vous laisser votre chance.
		};
	}
	else //CITY CRIME > 0
	{
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_25"); //(irrité) Hors de question ! J'ai entendu des rumeurs comme quoi vous seriez accusé d'être un vulgaire criminel.
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_26"); //Je ne vous prendrai pas comme apprenti tant que vous n'aurez pas tiré cette affaire au clair avec le commandant de la garde.
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Yes_15_00"); //Oui, maître.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_01"); //(soupire) Bon, très bien. J'espère juste que je ne le regretterai pas...
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_02"); //A partir de maintenant, considérez-vous comme mon apprenti.
	Player_IsApprentice = APP_Constantino;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Constantino_StartGuild = other.guild;
	
	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("alchemist",	GIL_NONE);
	
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Cosntantino m'a accepté comme apprenti. J'ai désormais accès au haut quartier.");

	Info_ClearChoices (DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Later_15_00"); //Il faut d'abord que j'y réfléchisse.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Later_10_01"); //Ha ! Si vous n'en avez pas vraiment envie, il vaudrait mieux choisir une autre profession !
	
	Info_ClearChoices (DIA_Constantino_LEHRLING);
};

// *******************************************************
//				 IMPORTANT als Lehrling 
// *******************************************************
// ----------------------------------
	var int Constantino_MILKommentar;
	var int Constantino_INNOSKommentar;
// ----------------------------------

instance DIA_Constantino_AlsLehrling (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 1;
	condition   = DIA_Constantino_AlsLehrling_Condition;
	information = DIA_Constantino_AlsLehrling_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Constantino_AlsLehrling_Condition()
{	
	if (Player_IsApprentice == APP_Constantino)
	&& (Npc_IsInState(self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_AlsLehrling_Info()
{
	if (B_GetGreatestPetzCrime (self) > CRIME_NONE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_00"); //(irrité) Je refuse de continuer à vous faire profiter de mon enseignement tant que vous serez accusé d'un crime.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_01"); //Allez voir le seigneur André et réglez cette affaire sur le champ.
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	
	else if (other.guild == GIL_MIL)
	&& (Constantino_StartGuild != GIL_MIL)
	&& (Constantino_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_02"); //Ainsi vous avez intégré la milice ? Je me l'étais laissé dire.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_03"); //Vous cherchez désespérément à devenir apprenti et, dès que vous y arrivez, vous entrez dans la milice ? N'espérez pas que je vous simplifie la vie !
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_04"); //J'exige que vous respectiez notre accord et que vous me rameniez régulièrement plantes et champignons.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_05"); //Et si mener deux métiers de front est trop difficile pour vous, vous n'avez qu'à moins dormir !
		Constantino_MILKommentar = TRUE;
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL) )
	&& (Constantino_StartGuild != GIL_NOV)
	&& (Constantino_StartGuild != GIL_KDF)
	&& (Constantino_StartGuild != GIL_PAL)
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_06"); //Je vois que vous êtes entré au service d'Innos. J'imagine que cela signifie que vous n'aurez plus de temps à accorder à un vieillard afin d'aller cueillir des plantes à sa place...
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_07"); //Mais c'est un honneur pour moi de vous avoir permis de mettre le pied à l'étrier.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_08"); //Si, malgré vos nouveaux devoirs, vous avez encore le temps de pratiquer l'alchimie, sachez que vous serez toujours le bienvenu ici.
		Constantino_INNOSKommentar = TRUE;
	}
	
	else if (Constantino_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_09"); //Qu'est-ce que vous fabriquiez ?
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_10"); //J'attends plus de mes apprentis que le fait de venir me voir quand cela leur chante.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_11"); //J'espère que vous m'apportez des champignons, au moins.
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_12"); //Ah, vous revoilà !
		Constantino_Lehrling_Day = Wld_GetDay();
	};
};

// *******************************************************
//					Aufgaben als Lehrling	
// *******************************************************
instance DIA_Constantino_Aufgaben (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_Aufgaben_Condition;
	information = DIA_Constantino_Aufgaben_Info;
	permanent   = FALSE;
	description = "Que dois-je faire ?";
};
FUNC INT DIA_Constantino_Aufgaben_Condition()
{	
	if (Player_IsApprentice == APP_Constantino)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_Aufgaben_Info()
{
	AI_Output (other, self,"DIA_Constantino_Aufgaben_15_00"); //Que dois-je faire ?
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_01"); //Je suis conscient du fait qu'il est impossible de demander à un jeune homme de passer toutes ses journées à l'intérieur en ma compagnie.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_02"); //De temps en temps, je vous chargerai d'aller me chercher les plantes dont j'ai besoin. En échange, je vous enseignerai l'art de l'alchimie.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_03"); //Vous pouvez m'acheter les bouteilles dont vous avez besoin. Par contre, il vous faudra vous procurer la plupart de vos ingrédients vous-même.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_04"); //Et j'espère que vous vous comporterez honorablement comme tout citoyen qui se respecte.
};

// *******************************************************
//					Welche Pflanzen	
// *******************************************************
instance DIA_Constantino_Mushrooms (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_Mushrooms_Condition;
	information = DIA_Constantino_Mushrooms_Info;
	permanent   = FALSE;
	description = "Quelles plantes dois-je vous ramener ?";
};
FUNC INT DIA_Constantino_Mushrooms_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Constantino_Aufgaben))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_Mushrooms_Info()
{
	AI_Output (other, self,"DIA_Constantino_Mushrooms_15_00"); //Quelles plantes suis-je censé vous rapporter ?
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_01"); //Je vous achèterai tout ce que vous me ramènerai en vous en offrant le prix normal.
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_02"); //Par contre, je vous offrirai un prix spécial pour les champignons.
	
	MIS_Constantino_Mushrooms = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Je peux vendre des champignons un très bon prix à Constantino.");
};

// *******************************************************
//					Mushrooms Running
// *******************************************************

instance DIA_Constantino_MushroomsRunning (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_MushroomsRunning_Condition;
	information = DIA_Constantino_MushroomsRunning_Info;
	permanent   = TRUE;
	description = "Vous vouliez des champignons...";
};
FUNC INT DIA_Constantino_MushroomsRunning_Condition()
{	
	if (MIS_Constantino_Mushrooms == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_MushroomsRunning_Info()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_15_00"); //Vous vouliez des champignons...

	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	Info_AddChoice (DIA_Constantino_MushroomsRunning, "Je vais vous en rapporter...", DIA_Constantino_MushroomsRunning_Later);
	if (Player_KnowsDunkelpilzBonus == FALSE)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "Pourquoi ces choses sont-elles aussi importantes ?", DIA_Constantino_MushroomsRunning_Why);
	};
	if (Npc_HasItems (other, ItPl_Mushroom_01) > 0)
	|| (Npc_HasItems (other, ItPl_Mushroom_02) > 0)
	{
		Info_AddChoice (DIA_Constantino_MushroomsRunning, "J'en ai un peu...", DIA_Constantino_MushroomsRunning_Sell);
	};
};

func void DIA_Constantino_MushroomsRunning_Sell()
{
	var int Dunkelpilz_dabei; Dunkelpilz_dabei = FALSE;
	
	if (Npc_HasItems(other,ItPl_Mushroom_01) > 0)
	{
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_00"); //J'ai là quelques champignons noirs...
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_01"); //Ah, ce sont les meilleurs ! Bravo ! Tenez, voici votre argent.
		Dunkelpilz_dabei = TRUE;
		
		Constantino_DunkelpilzCounter = Constantino_DunkelpilzCounter + Npc_HasItems(other,ItPl_Mushroom_01);
				
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_01) * Value_Mushroom_01) );
		B_GiveInvItems (other, self, ItPl_Mushroom_01, Npc_HasItems (other, ItPl_Mushroom_01));
	};
	
	if (Npc_HasItems(other,ItPl_Mushroom_02) > 0)
	{
		if (Dunkelpilz_dabei == TRUE)
		{
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_02"); //Et en voici d'autres.
		}
		else
		{
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_03"); //J'ai là quelques champignons...
		};
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_04"); //Ils ne sont pas aussi intéressants que les noirs, mais je les prends tout de même.
		
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_02) * Value_Mushroom_02) );
		B_GiveInvItems (other, self, ItPl_Mushroom_02, Npc_HasItems (other, ItPl_Mushroom_02));
	};
	
	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_00"); //En quoi sont-ils si intéressants ?
	if (Constantino_DunkelpilzCounter == 0)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_01"); //Même si vous êtes mon apprenti, n'espérez pas que je vous dise tout.
	}
	else if (Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_02"); //Très bien, je vais vous le dire, mais promettez-moi de ne jamais le répéter.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_03"); //Les champignons noirs regorgent d'énergie magique. Chaque fois qu'on en mange, on absorbe une partie de cette énergie.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_04"); //Et vous l'aurez compris, il suffit d'en manger suffisamment pour voir son énergie magique augmenter.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_05"); //Si je vous l'avais dit plus tôt, vous vous seriez empressé de les manger plutôt que de me les rapporter, n'est-ce pas ?
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_06"); //(soupire) Oh, flûte !
		
		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	}
	else // 1 - 49
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_07"); //Vous m'avez déjà posé la question. (malicieux) Et, qui sait, peut-être vous le dirai-je un jour...
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Later_15_00"); //Je vais vous rapporter des...
	AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Later_10_01"); //Parfait ! Ramenez-en autant que vous pourrez !
	
	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
};

// *******************************************************
//					Unterrichte mich	
// *******************************************************
instance DIA_Constantino_Alchemy (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_Alchemy_Condition;
	information = DIA_Constantino_Alchemy_Info;
	permanent   = FALSE;
	description = "Apprenez-moi l'art de l'alchimie.";
};
FUNC INT DIA_Constantino_Alchemy_Condition()
{	
	if (Player_IsApprentice == APP_Constantino)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_Alchemy_Info()
{
	AI_Output (other, self,"DIA_Constantino_Alchemy_15_00"); //Enseignez-moi l'art de l'alchimie.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_01"); //Très bien, commençons par les bases...
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_02"); //Les potions sont faites à base de plantes. Elles possèdent toutes sortes de propriétés.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_03"); //Ces propriétés sont obtenues naturellement, l'art de l'alchimie consistant uniquement à les modifier.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_04"); //Pour préparer une potion, il faut un atelier et une flasque de laboratoire.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_05"); //Il faut également connaître la formule et posséder les ingrédients nécessaires.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_06"); //Je pourrais vous enseigner un grand nombre de formules.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_07"); //Vous apprendre, par exemple, à concocter des potions qui rendent la force perdue ou même qui permettent de gagner de la force de façon permanente.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_08"); //Mais on ne peut pas tout apprendre en même temps.
	
	Constantino_TeachAlchemy = TRUE;
	
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino peut m'apprendre l'art de l'alchimie.");
};

// *******************************************************
//					für Nicht-Lehrlinge	
// *******************************************************
INSTANCE DIA_Constantino_NewRecipes (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_NewRecipes_Condition;
	information = DIA_Constantino_NewRecipes_Info;
	permanent   = FALSE;
	description = "Je recherche de nouvelles recettes de potions.";
};
FUNC INT DIA_Constantino_NewRecipes_Condition()
{	
	if (Player_IsApprentice != APP_Constantino)
	&& (Player_IsApprentice > APP_NONE)
	&& (Npc_GetTalentSkill (other, NPC_TALENT_ALCHEMY) > 0)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_NewRecipes_Info()
{
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_00"); //Je suis à la recherche de recettes de potions.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_01"); //Avez-vous des connaissances en matière d'alchimie ?
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_02"); //Oui.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_03"); //Et pourtant vous êtes toujours en vie, ce qui plaide plutôt en votre faveur...
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_04"); //Je pense pouvoir vous révéler quelques formules, mais tout dépend de ce qui vous intéresse bien sûr.
	
	Constantino_TeachAlchemy = TRUE;
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino peut m'apprendre l'art de l'alchimie.");
};
	
// *******************************************************
//							TEACH		
// *******************************************************
INSTANCE DIA_Constantino_TEACH (C_INFO)
{
	npc         = VLK_417_Constantino;
	nr          = 2;
	condition   = DIA_Constantino_TEACH_Condition;
	information = DIA_Constantino_TEACH_Info;
	permanent   = TRUE;
	description = "Quelle recette pouvez-vous m'apprendre ?";
};
FUNC INT DIA_Constantino_TEACH_Condition()
{	
	if (Constantino_TeachAlchemy == TRUE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Constantino_TEACH_Info()
{
	AI_Output (other, self,"DIA_Constantino_TEACH_15_00"); //Quelles sont les recettes que vous pouvez m'enseigner ?
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_01"); //Je regrette mais je n'ai rien d'autre à vous apprendre.
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_02"); //J'en connais quelques-unes. Faites votre choix.
		
		Info_ClearChoices (DIA_Constantino_Teach);
		Info_AddChoice (DIA_Constantino_Teach, DIALOG_BACK, DIA_Constantino_Teach_BACK);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Essence médicinale", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Constantino_TEACH_Health01);              
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Extrait médicinal", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Constantino_TEACH_Health02);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elixir médicinal", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Constantino_TEACH_Health03);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == FALSE) 
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)                                                                                                                              
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elixir de vie", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_Health)), DIA_Constantino_TEACH_PermHealth);            
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == FALSE)                                                                                                                                   
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Essence de mana", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_01)), DIA_Constantino_TEACH_Mana01);                  
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == FALSE)   
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)                                                                                                                                                                                                                                                                  
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Extrait de mana", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Mana_02)), DIA_Constantino_TEACH_Mana02);                 
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == FALSE) 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elixir de force", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Perm_STR)), DIA_Constantino_TEACH_PermSTR);               
	};
};

func void DIA_Constantino_Teach_BACK()
{
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health01()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_01)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health01_10_00"); //Les ingrédients de l'essence médicinale sont une plante médicinale et du nœud de prairie.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_00"); //Il faut des plantes médicinales et des nœuds de prairie pour préparer un extrait médicinal.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_01"); //Chauffez surtout très doucement cet extrait !
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health03()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_00"); //Il faut une certaine expérience pour pouvoir concocter un élixir médicinal.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_01"); //Vous aurez besoin de racines médicinales et de nœuds de prairie pour en obtenir. Faites surtout très attention en portant le tout à ébullition.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermHealth()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_00"); //Un élixir de vie ! Voilà une potion extrêmement rare. Non pas à cause de son processus de préparation, non, car elle n'est pas plus complexe que les autres...
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_01"); //Mais les ingrédients sont très difficiles à trouver. Il s'agit en effet de racine médicinale et d'oseille royale.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana01()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_00"); //L'essence de magie est la potion la plus basique qui soit.
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_01"); //Prenez des orties de feu et un nœud de prairie et faites chauffer le tout lentement.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02)
	{
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_00"); //Comme vous savez déjà concocter de l'essence de magie, il ne devrait pas être difficile pour vous d'obtenir de l'extrait.
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_01"); //Il faut être doué pour obtenir cette potion. Utilisez de l'herbe de feu et un nœud de prairie comme ingrédients.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermSTR()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_00"); //L'élixir de force ? C'est une excellente potion pour laquelle vous aurez besoin de racine de dragon et d'oseille royale.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_01"); //En faisant chauffer le tout, ne laissez surtout pas les bulles devenir trop grosses ou vous risquez d'avoir une fort mauvaise surprise !
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};



	

	
	






 


