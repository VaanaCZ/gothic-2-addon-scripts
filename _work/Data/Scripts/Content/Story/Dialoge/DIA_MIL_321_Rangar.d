///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rangar_EXIT   (C_INFO)
{
	npc         = MIL_321_Rangar;
	nr          = 999;
	condition   = DIA_Rangar_EXIT_Condition;
	information = DIA_Rangar_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Rangar_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Rangar_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Rangar_PICKPOCKET (C_INFO)
{
	npc			= MIL_321_Rangar;
	nr			= 900;
	condition	= DIA_Rangar_PICKPOCKET_Condition;
	information	= DIA_Rangar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Tento klíč půjde ukrást snadno.)";
};                       

FUNC INT DIA_Rangar_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_City_Tower_02) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Rangar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Rangar_PICKPOCKET);
	Info_AddChoice		(DIA_Rangar_PICKPOCKET, DIALOG_BACK 		,DIA_Rangar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Rangar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Rangar_PICKPOCKET_DoIt);
};

func void DIA_Rangar_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems (self, other, ItKe_City_Tower_02, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GiveThiefXP ();
		Info_ClearChoices (DIA_Rangar_PICKPOCKET);
	}
	else
	{
		B_ResetThiefLevel();
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); //reagiert trotz IGNORE_Theft mit NEWS
	};
};
	
func void DIA_Rangar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Rangar_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rangar_Hallo   (C_INFO)
{
	npc         = MIL_321_Rangar;
	nr          = 2;
	condition   = DIA_Rangar_Hallo_Condition;
	information = DIA_Rangar_Hallo_Info;
	permanent   = FALSE;
	description = "Zdar, jak se vede?";
};

FUNC INT DIA_Rangar_Hallo_Condition()
{
	if ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<500) == FALSE)
	&& ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03")<500) == FALSE)
		{
			return TRUE;
		};
};

FUNC VOID DIA_Rangar_Hallo_Info()
{
	AI_Output (other, self, "DIA_Rangar_Hallo_15_00");//Zdar, jak se vede?
	AI_Output (self, other, "DIA_Rangar_Hallo_07_01");//Než mi paladinové dají nęjaké další pâíkazy, můžu si tady v klidu dát nękolik piv. Co víc by si jeden mohl pâát? (zašklebí se)
	AI_Output (other, self, "DIA_Rangar_Hallo_15_02");//Pracuješ pro paladiny?
	AI_Output (self, other, "DIA_Rangar_Hallo_07_03");//Jo, podávám jim hlášení o dęní ve męstę. Momentálnę je tady docela klid.
};
///////////////////////////////////////////////////////////////////////
//	Info Ork
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rangar_Ork   (C_INFO)
{
	npc         = MIL_321_Rangar;
	nr          = 3;
	condition   = DIA_Rangar_Ork_Condition;
	information = DIA_Rangar_Ork_Info;
	permanent   = FALSE;
	description = "Jak to vypadá se skâety?";
};

FUNC INT DIA_Rangar_Ork_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Rangar_Hallo)
	&& ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<500) == FALSE)
	&& ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03")<500) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rangar_Ork_Info()
{
	AI_Output (other, self, "DIA_Rangar_Ork_15_00");//Jak to vypadá se skâety?
	AI_Output (self, other, "DIA_Rangar_Ork_07_01");//Není důvod si dęlat tęžkou hlavu - my z męstské stráže a paladinové máme všechno pod kontrolou.
	AI_Output (self, other, "DIA_Rangar_Ork_07_02");//Bęž domů a nech nás dęlat naši práci. Dohlížíme na męsto a jeho občany. -ŠKYT-
};
///////////////////////////////////////////////////////////////////////
//	Info Ork
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Rangar_Bier   (C_INFO)
{
	npc         = MIL_321_Rangar;
	nr          = 4;
	condition   = DIA_Rangar_Bier_Condition;
	information = DIA_Rangar_Bier_Info;
	permanent   = TRUE;
	description = "Dal by sis ještę pivo?";
};

FUNC INT DIA_Rangar_Bier_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Rangar_Hallo)
	&& ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<500) == FALSE)
	&& ((Npc_GetDistToWP(self,"NW_CITY_WAY_TO_SHIP_03")<500) == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Rangar_Bier_Info()
{
	AI_Output (other, self, "DIA_Rangar_Bier_15_00");//Dal by sis ještę pivo?
	
	if B_GiveInvItems (other, self, ItFo_Beer, 1)
	{
		if (Knows_Paladins == FALSE)
		{
			AI_Output (self, other, "DIA_Rangar_Bier_07_01");//Ááá - nic se nevyrovná správnę vychlazenýmu pivku.
			CreateInvItems (self, ItFo_Booze,1);
			B_UseItem (self, ItFo_Booze);
			AI_Output (other, self, "DIA_Rangar_Bier_15_02");//Chystal ses âíct nęco o skâetech.
			AI_Output (self, other, "DIA_Rangar_Bier_07_03");//Jo, no jo, jasnę. Skâeti nepâedstavují pro męsto vůbec žádnou hrozbu.
			AI_Output (self, other, "DIA_Rangar_Bier_07_04");//Obsadili Hornické údolí. A průsmyk drží paladinové.
			AI_Output (self, other, "DIA_Rangar_Bier_07_05");//Neproklouzne kolem nich ani myš.
			
			Knows_Paladins = 1;
			Info_ClearChoices (DIA_Rangar_Bier);
		}
		else if (Knows_Paladins == 1) 
		&& (Knows_Ork == TRUE)
		{
			AI_Output (self, other, "DIA_Rangar_Bier_07_06");//Poâádnou pintu rozhodnę neodmítnu.
			CreateInvItems (self, ItFo_Booze,1);
			B_UseItem (self, ItFo_Booze);
			AI_Output (other, self, "DIA_Rangar_Bier_15_07");//Dokonce vidęli skâeta hned za męstem.
			AI_Output (self, other, "DIA_Rangar_Bier_07_08");//No jo, jasnę, nebezpečný skâet za męstem. Opravdu pâíšerný skâet. Určitę co nevidęt zaútočí na męsto.
			AI_Output (self, other, "DIA_Rangar_Bier_07_09");//Poslouchej, toho tlustýho skâeta nakopeme do toho jeho tlustýho zadku ve chvíli, kdy se moc pâiblíží k męstu. Jasan?
			AI_Output (other, self, "DIA_Rangar_Bier_15_10");//Aha.
			Knows_Paladins = 2;
			Info_ClearChoices (DIA_Rangar_Bier);
		}
		else 
		{
			AI_Output (self, other, "DIA_Rangar_Bier_07_11");//Dobrý hoâký pivko je to nejlepší, co může být.
			CreateInvItems (self, ItFo_Booze,1);
			B_UseItem (self, ItFo_Booze);
			AI_Output (self, other, "DIA_Rangar_Bier_07_12");//Víš, nenarazíš často na nękoho, kdo by tę pozval na pivo. Jsi docela fajn.
			Info_ClearChoices (DIA_Rangar_Bier);
		};
		
	}
	else 
	{
		AI_Output (self, other, "DIA_Rangar_Bier_07_13");//Jasnę že si ještę dám pivo. Jedno pro mę.
		AI_StopProcessInfos (self);
	};
};

///////////////////////////////////////////////////////////////////////
//	Info Erwischt
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Rangar_Erwischt		(C_INFO)
{
	npc		 = 	MIL_321_Rangar;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Rangar_Erwischt_Condition;
	information	 = 	DIA_Addon_Rangar_Erwischt_Info;

	description	 = 	"Co tam dęláš?";
};

var int DIA_Addon_Rangar_Erwischt_OneTime;

func int DIA_Addon_Rangar_Erwischt_Condition ()
{
	if ((Npc_GetDistToWP(self,"NW_CITY_PALCAMP_15")<500))
	&& (DIA_Addon_Rangar_Erwischt_OneTime == FALSE)
	&& (MIS_Addon_Martin_GetRangar == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Rangar_Erwischt_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Rangar_Erwischt_15_00"); //Co to tam dęláš?
	AI_Output	(self, other, "DIA_Addon_Rangar_Erwischt_07_01"); //(cítí se zaskočen) Hmmm, no, já... Do toho ti nic není. Vypadni.
	AI_Output	(other, self, "DIA_Addon_Rangar_Erwischt_15_02"); //Martin bude mít radost, až mu âeknu, kdo se mu pâehrabuje ve vęcech, když tu není.
	AI_Output	(self, other, "DIA_Addon_Rangar_Erwischt_07_03"); //(pohrdavę) Dęlej si, co chceš. Já si teda půjdu po svém.
	B_GivePlayerXP (XP_Addon_Martin_GotRangar);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Začít");
	SC_GotRangar = TRUE;
};

///////////////////////////////////////////////////////////////////////
//	Info nachhaken
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Rangar_nachhaken		(C_INFO)
{
	npc		 = 	MIL_321_Rangar;
	nr		 = 	2;
	condition	 = 	DIA_Addon_Rangar_nachhaken_Condition;
	information	 = 	DIA_Addon_Rangar_nachhaken_Info;
	permanent	 = 	TRUE;

	description	 = 	"Vážnę si myslíš, že s tím utečeš?";
};

func int DIA_Addon_Rangar_nachhaken_Condition ()
{
	if (SC_GotRangar == TRUE)
	&& (MIS_Addon_Martin_GetRangar == LOG_RUNNING)
		{
			return TRUE;
		};
};

func void DIA_Addon_Rangar_nachhaken_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Rangar_nachhaken_15_00"); //To si vážnę myslíš, že se ti s tímhle podaâí zmizet?
	AI_Output	(self, other, "DIA_Addon_Rangar_nachhaken_07_01"); //(lhostejnę) To je štráchů pro trochu dlabance.
};
