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
	description = "Je cherche � devenir apprenti.";
};
FUNC INT DIA_Constantino_AboutLehrling_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Constantino_AboutLehrling_Info()
{
	AI_Output (other, self,"DIA_Constantino_AboutLehrling_15_00"); //Je cherche � devenir apprenti.
	AI_Output (self, other,"DIA_Constantino_AboutLehrling_10_01"); //Vraiment�? Et par qui comptez-vous vous faire engager�?
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
	AI_Output (self, other,"DIA_Constantino_Heilung_10_01"); //(s�chement) Pourquoi�? Vous �tes bless�?
	
	Info_ClearChoices (DIA_Constantino_Heilung);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Pas vraiment.",DIA_Constantino_Heilung_Nein);
	Info_AddChoice 	  (DIA_Constantino_Heilung,"Oui.",DIA_Constantino_Heilung_Ja);
	
};
FUNC VOID DIA_Constantino_Heilung_Ja()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Ja_15_00"); //Oui.
	
	if (other.attribute[ATR_HITPOINTS] <  other.attribute[ATR_HITPOINTS_MAX])
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_01"); //Allez voir Vatras, il vous soignera. Et arr�tez de mettre du sang partout, vous voulez bien�?
	}
	else 
	{
		AI_Output (self, other,"DIA_Constantino_Heilung_Ja_10_02"); //Vous avez � peine quelques �gratignures et j'ai mieux � faire que perdre mon temps � vous parler.
	};
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Constantino_Heilung_Nein()
{
	AI_Output (other, self,"DIA_Constantino_Heilung_Nein_15_00"); //Pas vraiment.
	AI_Output (self, other,"DIA_Constantino_Heilung_Nein_10_01"); //Dans ce cas, fichez-moi le quand ou vous risquez fort de l'�tre dans quelques instants...
	
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
	AI_Output	(self, other, "DIA_Addon_Constantino_LestersKraeuter_10_01"); //Si vous en avez � proposer
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
		B_LogEntry (Topic_CityTrader,"Constantino vend du mat�riel d'alchimie."); 
		
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
	description = "Je veux m'engager aupr�s de vous comme apprenti.";
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
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_01"); //MON apprenti�? Hors de question�! J'ai d�j� eu l'honneur douteux d'avoir un apprenti il y a quelque temps, et je suis vaccin� depuis, merci.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_02"); //J'ai investi plusieurs ann�es de mon temps dans sa formation et, au bout du compte, il a fallu que cet ignare s'empoisonne.
	AI_Output (self, other,"DIA_Constantino_BeiDir_10_03"); //Allez donc vous faire engager par l'un des autres ma�tres.
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
	description = "Je veux m'engager comme apprenti aupr�s d'un des autres ma�tres.";
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
	AI_Output (other, self,"DIA_Constantino_ZUSTIMMUNG_15_00"); //Je voudrais devenir l'apprenti de l'un des autres ma�tres.
	AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_01"); //Et vous venez me demander mon accord, c'est �a�?
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_02"); //Bah. Pour ce que j'en ai � faire, vous pouvez devenir l'apprenti de n'importe qui.
		
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_03"); //Eh bien, vous ne l'aurez pas�! Ce que j'ai entendu � votre sujet ne me dit rien qui vaille.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_04"); //Il est hors de question que je permette � un criminel tel que vous d'�tre consid�r� comme un citoyen.
		AI_Output (self, other,"DIA_Constantino_ZUSTIMMUNG_10_05"); //Ma r�ponse sera n�gative tant que cette affaire n'aura pas �t� r�gl�e avec le commandant de la garde.
		
	};
	
	if ( Constantino_Logpatch2 == FALSE)
	{
	 
	 Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	 Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	 B_LogEntry (TOPIC_Lehrling,"Constantino accepte que je devienne apprenti tant que je ne suis pas accus� d'un crime en ville.");	
	
	 Constantino_Logpatch2 = TRUE;
	  	
	};
};

// *******************************************************
//						Was mu� ich tun?		//e3
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
	AI_Output (other, self,"DIA_Constantino_BringHerbs_15_00"); //Que faudrait-il que je fasse pour devenir votre apprenti�?
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_01"); //(soupire) Je ne pourrais pas supporter d'avoir la mort d'un autre amateur sur la conscience.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_02"); //Il existe un grand nombre de plantes. Selon les m�langes effectu�s et les quantit�s utilis�es, le r�sultat obtenu peut �tre extr�mement vari�.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_03"); //Et vous ne devez m�me pas conna�tre la moiti� de ces plantes.
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_04"); //(soupire) Tenez, voici la liste des plus importantes.
	B_GiveInvItems (self, other, ItWr_Kraeuterliste, 1);
	AI_Output (self, other,"DIA_Constantino_BringHerbs_10_05"); //Ramenez-moi une plante de chaque esp�ce et je r�fl�chirai � la question.
	
	MIS_Constantino_BringHerbs = LOG_RUNNING;
	Log_CreateTopic (TOPIC_ConstantinoPlants,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_ConstantinoPlants,LOG_RUNNING);
	B_LogEntry (TOPIC_ConstantinoPlants,"Constantino veut une plante de chaque esp�ce sinon il ne m'acceptera pas comme apprenti.");
	
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
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_10_01"); //Si vous n'�tes pas capable de vous d�brouiller seul, vous ne ferez jamais un bon alchimiste�!
	
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
	AI_Output (other, self,"DIA_Constantino_HerbsRunning_Success_15_00"); //J'ai l� toutes les plantes que vous vouliez que je vous ram�ne.
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_01"); //Comment�? Vous vous moquez de moi, non�?

	//11 Gegenst�nde gegeben (Pflanzen) HACK f�r Screen ADDON
	AI_PrintScreen ("11 Gegenst�nde gegeben (Pflanzen)", -1, YPOS_ItemGiven, FONT_ScreenSmall, 2);
	
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
	
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_02"); //Par Adanos�! C'est pourtant vrai�!
	AI_Output (self, other,"DIA_Constantino_HerbsRunning_Success_10_03"); //Qui sait�? Peut-�tre avez-vous le potentiel pour faire un bon alchimiste apr�s tout...
	
	
	MIS_Constantino_BringHerbs = LOG_SUCCESS;
	B_GivePlayerXP (XP_Constantino_Herbs);
	
	Log_CreateTopic(TOPIC_Lehrling,LOG_MISSION);
	Log_SetTopicStatus (TOPIC_Lehrling,LOG_RUNNING);
	B_LogEntry (Topic_Lehrling,"Constantino m'acceptera comme apprenti pour autant que les autres ma�tres soient d'accord.");
	
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
	
	AI_Output (other, self,"DIA_Constantino_LEHRLING_15_00"); //Alors, puis-je devenir votre apprenti�?
	
	if (B_GetGreatestPetzCrime (self) == CRIME_NONE)
	{
		// ------ Constantino ------
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_01"); //Pour ma part, oui.
		stimmen = stimmen + 1;
		
		// ------ Harad ------
		if (Harad.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_02"); //La seule chose qui compte aux yeux d'Harad, c'est que vous soyez capable d'aider � d�fendre la ville si les orques venaient � nous attaquer.
			if (MIS_Harad_Orc == LOG_SUCCESS)
			|| (MIS_HakonBandits == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_03"); //Et on dirait que vous l'en avez convaincu.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_04"); //Mais il est persuad� que vous n'�tes qu'un l�che.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_05"); //Mais il affirme qu'il ne vous a jamais vu.
		};
		
		// ------ Bosper ------
		if (Bosper.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_06"); //Bosper s'est montr� tr�s r�ticent � l'id�e de me parler de vous.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_07"); //J'imagine qu'il pr�f�rerait que vous deveniez son apprenti plut�t que le mien.
			if (MIS_Bosper_Bogen == LOG_SUCCESS)
			|| (MIS_Bosper_WolfFurs == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_08"); //Mais il a tout de m�me fini par accepter.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_09"); //Refuser de vous donner son accord pour cette raison est vraiment tout sauf honorable�!
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_10"); //Mais si tous les autres ma�tres sont d'accord, vous n'aurez pas besoin de son aval.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_11"); //Et Bosper ne vous conna�t pas encore.
		};
		
		// ------ Thorben ------
		if (Thorben.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_12"); //Thorben est tr�s croyant.
			if (MIS_Thorben_GetBlessings == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_13"); //Il vous a donn� sa b�n�diction, ce qui est un tr�s bon signe.
				stimmen = stimmen + 1;
			}
			else
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_14"); //Il ne vous donnera son aval que si vous recevez la b�n�diction des dieux.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_15"); //Thorben ne vous conna�t pas.
		};
				
		// ------ Matteo ------
		if (Matteo.aivar[AIV_TalkedToPlayer] == TRUE)
		{
			if (MIS_Matteo_Gold == LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_16"); //Quant � Matt�o, il ne cesse de chanter vos louanges.
				stimmen = stimmen + 1;
			}
			else if (MIS_Matteo_Gold == LOG_RUNNING)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_17"); //Matt�o dit que vous lui devez quelque chose et qu'il serait bon de songer � r�gler cette affaire si vous voulez obtenir son accord.
			}
			else	
			{	
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_18"); //Matt�o dit qu'il ne vous a pas encore parl� � ce sujet.
			};
		}
		else //noch kein Dialog
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_19"); //Matt�o dit qu'il ne vous a jamais vu dans sa boutique.
		};		

		// ------ AUSWERTUNG ------
		if (stimmen >= 4)
		{
			if (stimmen == 5)
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_20"); //Cela signifie que vous avez l'accord de tous les ma�tres�!
			}
			else // == 4
			{
				AI_Output (self, other,"DIA_Constantino_LEHRLING_10_21"); //Cela signifie que vous avez l'accord de quatre des ma�tres, ce qui suffit pour �tre accept� comme apprenti.
			};
			
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_22"); //Etes-vous pr�t � devenir mon apprenti�?
			
			Info_ClearChoices (DIA_Constantino_LEHRLING);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Je dois d'abord dormir.", DIA_Constantino_LEHRLING_Later);
			Info_AddChoice (DIA_Constantino_LEHRLING, "Oui, ma�tre.", DIA_Constantino_LEHRLING_Yes);
		}
		else // stimmen < 4
		{
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_23"); //Vous devez obtenir l'accord de quatre ma�tres au moins pour pouvoir �tre accept� comme apprenti dans le bas quartier.
			AI_Output (self, other,"DIA_Constantino_LEHRLING_10_24"); //Cela signifie qu'il vous faut aller parler � ceux qui ne sont pas encore convaincus de vous laisser votre chance.
		};
	}
	else //CITY CRIME > 0
	{
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_25"); //(irrit�) Hors de question ! J'ai entendu des rumeurs comme quoi vous seriez accus� d'�tre un vulgaire criminel.
		AI_Output (self, other,"DIA_Constantino_LEHRLING_10_26"); //Je ne vous prendrai pas comme apprenti tant que vous n'aurez pas tir� cette affaire au clair avec le commandant de la garde.
	};
};

func void DIA_Constantino_LEHRLING_Yes()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Yes_15_00"); //Oui, ma�tre.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_01"); //(soupire) Bon, tr�s bien. J'esp�re juste que je ne le regretterai pas...
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Yes_10_02"); //A partir de maintenant, consid�rez-vous comme mon apprenti.
	Player_IsApprentice = APP_Constantino;
	Npc_ExchangeRoutine (Lothar, "START");
	
	Constantino_StartGuild = other.guild;
	
	Constantino_Lehrling_Day = Wld_GetDay();
	Wld_AssignRoomToGuild ("alchemist",	GIL_NONE);
	
	MIS_Apprentice = LOG_SUCCESS;
	B_GivePlayerXP (XP_Lehrling);
	B_LogEntry (Topic_Bonus,"Cosntantino m'a accept� comme apprenti. J'ai d�sormais acc�s au haut quartier.");

	Info_ClearChoices (DIA_Constantino_LEHRLING);
};

func void DIA_Constantino_LEHRLING_Later()
{
	AI_Output (other, self,"DIA_Constantino_LEHRLING_Later_15_00"); //Il faut d'abord que j'y r�fl�chisse.
	AI_Output (self, other,"DIA_Constantino_LEHRLING_Later_10_01"); //Ha�! Si vous n'en avez pas vraiment envie, il vaudrait mieux choisir une autre profession�!
	
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
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_00"); //(irrit�) Je refuse de continuer � vous faire profiter de mon enseignement tant que vous serez accus� d'un crime.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_01"); //Allez voir le seigneur Andr� et r�glez cette affaire sur le champ.
		Constantino_Lehrling_Day = Wld_GetDay();
		AI_StopProcessInfos(self);
	}
	
	else if (other.guild == GIL_MIL)
	&& (Constantino_StartGuild != GIL_MIL)
	&& (Constantino_MILKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_02"); //Ainsi vous avez int�gr� la milice�? Je me l'�tais laiss� dire.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_03"); //Vous cherchez d�sesp�r�ment � devenir apprenti et, d�s que vous y arrivez, vous entrez dans la milice�? N'esp�rez pas que je vous simplifie la vie�!
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_04"); //J'exige que vous respectiez notre accord et que vous me rameniez r�guli�rement plantes et champignons.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_05"); //Et si mener deux m�tiers de front est trop difficile pour vous, vous n'avez qu'� moins dormir�!
		Constantino_MILKommentar = TRUE;
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	
	else if ( (other.guild == GIL_NOV) || (other.guild == GIL_KDF) || (other.guild == GIL_PAL) )
	&& (Constantino_StartGuild != GIL_NOV)
	&& (Constantino_StartGuild != GIL_KDF)
	&& (Constantino_StartGuild != GIL_PAL)
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_06"); //Je vois que vous �tes entr� au service d'Innos. J'imagine que cela signifie que vous n'aurez plus de temps � accorder � un vieillard afin d'aller cueillir des plantes � sa place...
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_07"); //Mais c'est un honneur pour moi de vous avoir permis de mettre le pied � l'�trier.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_08"); //Si, malgr� vos nouveaux devoirs, vous avez encore le temps de pratiquer l'alchimie, sachez que vous serez toujours le bienvenu ici.
		Constantino_INNOSKommentar = TRUE;
	}
	
	else if (Constantino_Lehrling_Day <= (Wld_GetDay() - 4) )
	&& (Constantino_INNOSKommentar == FALSE)
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_09"); //Qu'est-ce que vous fabriquiez�?
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_10"); //J'attends plus de mes apprentis que le fait de venir me voir quand cela leur chante.
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_11"); //J'esp�re que vous m'apportez des champignons, au moins.
		Constantino_Lehrling_Day = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_AlsLehrling_10_12"); //Ah, vous revoil�!
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
	AI_Output (other, self,"DIA_Constantino_Aufgaben_15_00"); //Que dois-je faire�?
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_01"); //Je suis conscient du fait qu'il est impossible de demander � un jeune homme de passer toutes ses journ�es � l'int�rieur en ma compagnie.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_02"); //De temps en temps, je vous chargerai d'aller me chercher les plantes dont j'ai besoin. En �change, je vous enseignerai l'art de l'alchimie.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_03"); //Vous pouvez m'acheter les bouteilles dont vous avez besoin. Par contre, il vous faudra vous procurer la plupart de vos ingr�dients vous-m�me.
	AI_Output (self, other,"DIA_Constantino_Aufgaben_10_04"); //Et j'esp�re que vous vous comporterez honorablement comme tout citoyen qui se respecte.
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
	AI_Output (other, self,"DIA_Constantino_Mushrooms_15_00"); //Quelles plantes suis-je cens� vous rapporter�?
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_01"); //Je vous ach�terai tout ce que vous me ram�nerai en vous en offrant le prix normal.
	AI_Output (self, other,"DIA_Constantino_Mushrooms_10_02"); //Par contre, je vous offrirai un prix sp�cial pour les champignons.
	
	MIS_Constantino_Mushrooms = LOG_RUNNING;
	
	Log_CreateTopic (Topic_Bonus,LOG_NOTE);
	B_LogEntry (Topic_Bonus,"Je peux vendre des champignons un tr�s bon prix � Constantino.");
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
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_00"); //J'ai l� quelques champignons noirs...
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_01"); //Ah, ce sont les meilleurs�! Bravo�! Tenez, voici votre argent.
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
			AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Sell_15_03"); //J'ai l� quelques champignons...
		};
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Sell_10_04"); //Ils ne sont pas aussi int�ressants que les noirs, mais je les prends tout de m�me.
		
		B_GiveInvItems (self, other, itmi_gold, (Npc_HasItems(other,ItPl_Mushroom_02) * Value_Mushroom_02) );
		B_GiveInvItems (other, self, ItPl_Mushroom_02, Npc_HasItems (other, ItPl_Mushroom_02));
	};
	
	Info_ClearChoices (DIA_Constantino_MushroomsRunning);
};

func void DIA_Constantino_MushroomsRunning_Why()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_00"); //En quoi sont-ils si int�ressants�?
	if (Constantino_DunkelpilzCounter == 0)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_01"); //M�me si vous �tes mon apprenti, n'esp�rez pas que je vous dise tout.
	}
	else if (Constantino_DunkelpilzCounter >= 50)
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_02"); //Tr�s bien, je vais vous le dire, mais promettez-moi de ne jamais le r�p�ter.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_03"); //Les champignons noirs regorgent d'�nergie magique. Chaque fois qu'on en mange, on absorbe une partie de cette �nergie.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_04"); //Et vous l'aurez compris, il suffit d'en manger suffisamment pour voir son �nergie magique augmenter.
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_05"); //Si je vous l'avais dit plus t�t, vous vous seriez empress� de les manger plut�t que de me les rapporter, n'est-ce pas�?
		AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Why_15_06"); //(soupire) Oh, fl�te�!
		
		Player_KnowsDunkelpilzBonus = TRUE;
		Info_ClearChoices (DIA_Constantino_MushroomsRunning);
	}
	else // 1 - 49
	{
		AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Why_10_07"); //Vous m'avez d�j� pos� la question. (malicieux) Et, qui sait, peut-�tre vous le dirai-je un jour...
	};
};

func void DIA_Constantino_MushroomsRunning_Later()
{
	AI_Output (other, self,"DIA_Constantino_MushroomsRunning_Later_15_00"); //Je vais vous rapporter des...
	AI_Output (self, other,"DIA_Constantino_MushroomsRunning_Later_10_01"); //Parfait�! Ramenez-en autant que vous pourrez�!
	
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
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_01"); //Tr�s bien, commen�ons par les bases...
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_02"); //Les potions sont faites � base de plantes. Elles poss�dent toutes sortes de propri�t�s.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_03"); //Ces propri�t�s sont obtenues naturellement, l'art de l'alchimie consistant uniquement � les modifier.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_04"); //Pour pr�parer une potion, il faut un atelier et une flasque de laboratoire.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_05"); //Il faut �galement conna�tre la formule et poss�der les ingr�dients n�cessaires.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_06"); //Je pourrais vous enseigner un grand nombre de formules.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_07"); //Vous apprendre, par exemple, � concocter des potions qui rendent la force perdue ou m�me qui permettent de gagner de la force de fa�on permanente.
	AI_Output (self, other,"DIA_Constantino_Alchemy_10_08"); //Mais on ne peut pas tout apprendre en m�me temps.
	
	Constantino_TeachAlchemy = TRUE;
	
	Log_CreateTopic (TOPIC_CityTeacher,LOG_NOTE);
	B_LogEntry (TOPIC_CityTeacher,"Constantino peut m'apprendre l'art de l'alchimie.");
};

// *******************************************************
//					f�r Nicht-Lehrlinge	
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
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_00"); //Je suis � la recherche de recettes de potions.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_01"); //Avez-vous des connaissances en mati�re d'alchimie�?
	AI_Output (other, self,"DIA_Constantino_NewRecipes_15_02"); //Oui.
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_03"); //Et pourtant vous �tes toujours en vie, ce qui plaide plut�t en votre faveur...
	AI_Output (self, other,"DIA_Constantino_NewRecipes_10_04"); //Je pense pouvoir vous r�v�ler quelques formules, mais tout d�pend de ce qui vous int�resse bien s�r.
	
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
	AI_Output (other, self,"DIA_Constantino_TEACH_15_00"); //Quelles sont les recettes que vous pouvez m'enseigner�?
	
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_Health] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_01] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Mana_02] == TRUE)
	&& (PLAYER_TALENT_ALCHEMY[POTION_Perm_STR] == TRUE)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_01"); //Je regrette mais je n'ai rien d'autre � vous apprendre.
	}
	else
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_10_02"); //J'en connais quelques-unes. Faites votre choix.
		
		Info_ClearChoices (DIA_Constantino_Teach);
		Info_AddChoice (DIA_Constantino_Teach, DIALOG_BACK, DIA_Constantino_Teach_BACK);
	};
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == FALSE)
	{
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Essence m�dicinale", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_01)), DIA_Constantino_TEACH_Health01);              
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_01] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Extrait m�dicinal", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_02)), DIA_Constantino_TEACH_Health02);             
	};                                                                                                                                                                                    
	if (PLAYER_TALENT_ALCHEMY[POTION_Health_02] == TRUE)                                                                                                                                  
	&& (PLAYER_TALENT_ALCHEMY[POTION_Health_03] == FALSE)                                                                                                                                 
	{                                                                                                                                                                                     
		Info_AddChoice (DIA_Constantino_TEACH, B_BuildLearnString ("Elixir m�dicinal", B_GetLearnCostTalent (other, NPC_TALENT_ALCHEMY, POTION_Health_03)), DIA_Constantino_TEACH_Health03);             
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
		AI_Output (self, other,"DIA_Constantino_TEACH_Health01_10_00"); //Les ingr�dients de l'essence m�dicinale sont une plante m�dicinale et du n�ud de prairie.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_02)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_00"); //Il faut des plantes m�dicinales et des n�uds de prairie pour pr�parer un extrait m�dicinal.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health02_10_01"); //Chauffez surtout tr�s doucement cet extrait�!
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Health03()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Health_03)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_00"); //Il faut une certaine exp�rience pour pouvoir concocter un �lixir m�dicinal.
		AI_Output (self, other,"DIA_Constantino_TEACH_Health03_10_01"); //Vous aurez besoin de racines m�dicinales et de n�uds de prairie pour en obtenir. Faites surtout tr�s attention en portant le tout � �bullition.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermHealth()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_Health)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_00"); //Un �lixir de vie�! Voil� une potion extr�mement rare. Non pas � cause de son processus de pr�paration, non, car elle n'est pas plus complexe que les autres...
		AI_Output (self, other,"DIA_Constantino_TEACH_PermHealth_10_01"); //Mais les ingr�dients sont tr�s difficiles � trouver. Il s'agit en effet de racine m�dicinale et d'oseille royale.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana01()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_01)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_00"); //L'essence de magie est la potion la plus basique qui soit.
		AI_Output (self, other,"DIA_Constantino_TEACH_Mana01_10_01"); //Prenez des orties de feu et un n�ud de prairie et faites chauffer le tout lentement.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_Mana02()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Mana_02)
	{
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_00"); //Comme vous savez d�j� concocter de l'essence de magie, il ne devrait pas �tre difficile pour vous d'obtenir de l'extrait.
	 	AI_Output (self, other,"DIA_Constantino_TEACH_Mana02_10_01"); //Il faut �tre dou� pour obtenir cette potion. Utilisez de l'herbe de feu et un n�ud de prairie comme ingr�dients.
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};
func void DIA_Constantino_TEACH_PermSTR()
{
	if B_TeachPlayerTalentAlchemy (self, other, POTION_Perm_STR)
	{
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_00"); //L'�lixir de force�? C'est une excellente potion pour laquelle vous aurez besoin de racine de dragon et d'oseille royale.
		AI_Output (self, other,"DIA_Constantino_TEACH_PermSTR_10_01"); //En faisant chauffer le tout, ne laissez surtout pas les bulles devenir trop grosses ou vous risquez d'avoir une fort mauvaise surprise�!
	};
	Info_ClearChoices (DIA_Constantino_Teach);
};



	

	
	






 


