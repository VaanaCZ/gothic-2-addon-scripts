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
	description = "(Sería sencillo robar su llave)";
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
	description = "Eh, ¿qué pasa?";
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
	AI_Output (other, self, "DIA_Rangar_Hallo_15_00");//Eh, ¿qué pasa?
	AI_Output (self, other, "DIA_Rangar_Hallo_07_01");//Si los paladines no tienen más encargos, me tomaré un par de cervezas. ¿Qué más se puede pedir? (sonríe de oreja a oreja).
	AI_Output (other, self, "DIA_Rangar_Hallo_15_02");//¿Trabajas para los paladines?
	AI_Output (self, other, "DIA_Rangar_Hallo_07_03");//Sí, les informo de la situación en la ciudad. Por ahora, todo está tranquilo.
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
	description = "¿Cómo están las cosas con los orcos?";
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
	AI_Output (other, self, "DIA_Rangar_Ork_15_00");//¿Cómo están las cosas con los orcos?
	AI_Output (self, other, "DIA_Rangar_Ork_07_01");//No hay de qué preocuparse. Los miembros de la guardia de la ciudad y los paladines lo tenemos todo bajo control.
	AI_Output (self, other, "DIA_Rangar_Ork_07_02");//Vete a casa y déjanos hacer nuestro trabajo. Protegemos a la ciudad y a sus habitantes. Hip.
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
	description = "¿Quieres otra cerveza?";
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
	AI_Output (other, self, "DIA_Rangar_Bier_15_00");//¿Quieres otra cerveza?
	
	if B_GiveInvItems (other, self, ItFo_Beer, 1)
	{
		if (Knows_Paladins == FALSE)
		{
			AI_Output (self, other, "DIA_Rangar_Bier_07_01");//Ah, no hay nada como una cerveza fría.
			CreateInvItems (self, ItFo_Booze,1);
			B_UseItem (self, ItFo_Booze);
			AI_Output (other, self, "DIA_Rangar_Bier_15_02");//Estabas a punto de decir algo de los orcos...
			AI_Output (self, other, "DIA_Rangar_Bier_07_03");//Ah, sí, es verdad. Los orcos no suponen ninguna amenaza para la ciudad.
			AI_Output (self, other, "DIA_Rangar_Bier_07_04");//Están atrapados en el Valle de las Minas, y los paladines defienden el desfiladero.
			AI_Output (self, other, "DIA_Rangar_Bier_07_05");//No podría pasar ni una sabandija de carne.
			
			Knows_Paladins = 1;
			Info_ClearChoices (DIA_Rangar_Bier);
		}
		else if (Knows_Paladins == 1) 
		&& (Knows_Ork == TRUE)
		{
			AI_Output (self, other, "DIA_Rangar_Bier_07_06");//No voy a decir que no a una pinta en condiciones.
			CreateInvItems (self, ItFo_Booze,1);
			B_UseItem (self, ItFo_Booze);
			AI_Output (other, self, "DIA_Rangar_Bier_15_07");//Han llegado a ver un orco en las afueras de la ciudad.
			AI_Output (self, other, "DIA_Rangar_Bier_07_08");//Sí, ya, el peligroso orco que ronda las afueras. Menudo monstruo. No creo que tarde en atacar la ciudad.
			AI_Output (self, other, "DIA_Rangar_Bier_07_09");//Mira, a ese orco seboso le vamos a dar una buena patada en el culo si se acerca demasiado a la ciudad. ¿Me oyes?
			AI_Output (other, self, "DIA_Rangar_Bier_15_10");//Entiendo.
			Knows_Paladins = 2;
			Info_ClearChoices (DIA_Rangar_Bier);
		}
		else 
		{
			AI_Output (self, other, "DIA_Rangar_Bier_07_11");//Una buena cerveza amarga es lo mejor que existe.
			CreateInvItems (self, ItFo_Booze,1);
			B_UseItem (self, ItFo_Booze);
			AI_Output (self, other, "DIA_Rangar_Bier_07_12");//¿Sabes? No es frecuente que alguien te invite a una cerveza. Eres un buen tipo.
			Info_ClearChoices (DIA_Rangar_Bier);
		};
		
	}
	else 
	{
		AI_Output (self, other, "DIA_Rangar_Bier_07_13");//Claro que quiero otra cerveza. Sírveme una.
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

	description	 = 	"¿Qué estás haciendo?";
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
	AI_Output	(other, self, "DIA_Addon_Rangar_Erwischt_15_00"); //¿Qué estás haciendo?
	AI_Output	(self, other, "DIA_Addon_Rangar_Erwischt_07_01"); //(pillado in fraganti) Eehm. Yo… estoo… a ti qué te importa. Piérdete.
	AI_Output	(other, self, "DIA_Addon_Rangar_Erwischt_15_02"); //Martin se va a alegrar mucho cuando le diga quién ha estado hurgando en sus pertenencias durante su ausencia.
	AI_Output	(self, other, "DIA_Addon_Rangar_Erwischt_07_03"); //(con desdén) Haz lo que te plazca. Yo entonces me voy, hombrecillo.
	B_GivePlayerXP (XP_Addon_Martin_GotRangar);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"Start");
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

	description	 = 	"¿De verdad crees que te vas a salir con la tuya?";
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
	AI_Output	(other, self, "DIA_Addon_Rangar_nachhaken_15_00"); //¿De verdad crees que te vas a salir con la tuya?
	AI_Output	(self, other, "DIA_Addon_Rangar_nachhaken_07_01"); //(con indiferencia) No hagas una montaña de un granito de arena.
};
