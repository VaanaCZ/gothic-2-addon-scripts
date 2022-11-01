//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_EXIT   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 999;
	condition   = DIA_Addon_Lucia_EXIT_Condition;
	information = DIA_Addon_Lucia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Lucia_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Lucia_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Lucia_PICKPOCKET (C_INFO)
{
	npc			= BDT_1091_Addon_Lucia;
	nr			= 900;
	condition	= DIA_Addon_Lucia_PICKPOCKET_Condition;
	information	= DIA_Addon_Lucia_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80_Female;
};                       
FUNC INT DIA_Addon_Lucia_PICKPOCKET_Condition()
{
	C_Beklauen (80, 100);
};
 
FUNC VOID DIA_Addon_Lucia_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Lucia_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Lucia_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Lucia_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Lucia_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lucia_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Lucia_PICKPOCKET);
};
	
func void DIA_Addon_Lucia_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Hi   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Hi_Condition;
	information = DIA_Addon_Lucia_Hi_Info;
	permanent   = FALSE;
	description = "¿Y? ¿Qué tal todo?";
};
FUNC INT DIA_Addon_Lucia_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lucia_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Hi_15_00");//¿Y? ¿Qué tal todo?
	AI_Output (self, other, "DIA_Addon_Lucia_Hi_16_01");//Escucha. Si quieres comer algo, recurre a Snaf. Si quieres algo para beber, estás en el sitio adecuado.
};
//---------------------------------------------------------------------
//	Info was
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_was   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_was_Condition;
	information = DIA_Addon_Lucia_was_Info;
	permanent   = FALSE;
	description = "¿Aquí qué se bebe?";
};
FUNC INT DIA_Addon_Lucia_was_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lucia_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_was_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_was_15_00");//¿Aquí qué se bebe?
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_01");//Sólo tenemos algo de cerveza. La única cerveza de la isla la trajeron los paladines.
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_02");//Casi lo único bueno que trajeron esos tipos
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_03");//Si no, bebemos licor. Tengo luz de luna, ponche y ron blanco.
	AI_Output (self, other, "DIA_Addon_Lucia_was_16_04");//(degustando) Hmmm… Deberías probar ESTO. Tengo la fórmula de Samuel. Ese chico sabe de lo suyo.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Conseguiré bebida de Lucía.");
};
//---------------------------------------------------------------------
//	Info Khorinis
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Khorinis   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Khorinis_Condition;
	information = DIA_Addon_Lucia_Khorinis_Info;
	permanent   = FALSE;
	description = "¿No eres de Khorinis?";
};
FUNC INT DIA_Addon_Lucia_Khorinis_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Bromor_Lucia)
	|| (Nadja_GaveLuciaInfo == TRUE)
	|| Npc_KnowsInfo (other, DIA_Addon_Elvrich_WhatExactly)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Khorinis_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Khorinis_15_00");//¿No eres de Khorinis?
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_01");//¡No me lo recuerdes! Mi vida en esta ciudad ha sido horrible.
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_02");//Mientras seguían llegando barcos con nuevos reclusos, aún había vida en la ciudad.
	AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_03");//Pero esos otros tipos… (ríe) No, gracias. Quizá es porque estamos en una isla… En fin, esos días se acabaron.

	if (MIS_LuciasLetter != 0)
	|| (SC_KnowsLuciaCaughtByBandits != 0)
	|| (Nadja_GaveLuciaInfo != 0)
	{
		AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_06"); //¡He acabado con Elvrich!
		AI_Output (other,self , "DIA_Addon_Lucia_Khorinis_15_04"); //¿Por qué?
		AI_Output (self, other, "DIA_Addon_Lucia_Khorinis_16_05"); //¡Es un cobarde! Cuando los bandidos me atraparon, no movió un dedo para ayudarme.
		TOPIC_END_Lucia = TRUE;
		B_GivePlayerXP (XP_Ambient);
	};
	TOPIC_END_Lucia = TRUE;
};
//---------------------------------------------------------------------
//	Info Jetzt
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Jetzt   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Jetzt_Condition;
	information = DIA_Addon_Lucia_Jetzt_Info;
	permanent   = FALSE;
	description = "¿Qué piensas hacer ahora?";
};
FUNC INT DIA_Addon_Lucia_Jetzt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lucia_Khorinis)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Jetzt_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Jetzt_15_00");//¿Qué planeas hacer?
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_01");//Ya veremos. De momento, me quedaré con Snaf, Fisk y el resto.
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_02");//¿Ya has hablado con Thorus? (ojos en blanco) ¡Oh, Innos, es tan atractivo!
	AI_Output (self, other, "DIA_Addon_Lucia_Jetzt_16_03");//(ríe) Disculpa… Volvamos a la pregunta… No he pensado nada concreto, lo estoy pensando.
};
//---------------------------------------------------------------------
//	Info Paladine
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Paladine   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 2;
	condition   = DIA_Addon_Lucia_Paladine_Condition;
	information = DIA_Addon_Lucia_Paladine_Info;
	permanent   = FALSE;
	description = "No te caen muy bien los paladines, ¿verdad?";
};
FUNC INT DIA_Addon_Lucia_Paladine_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_was)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Paladine_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_15_00");//No te caen muy bien los paladines, ¿verdad?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_01");//¿Esos asesinos fanáticos a sueldo de los Magos de Fuego? No.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_02");//Ese tal Lord Hagen llena la ciudad con sus matones y todos se doblegan ante él.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_16_03");//Y yo no quería hacer lo mismo. No iba a esperar hasta que cerraran la 'Antorcha roja' y me encerraran.
	
	if (Npc_GetTrueGuild (other) != GIL_SLD)
	&& (Npc_GetTrueGuild (other) != GIL_DJG)
	{
		Info_ClearChoices (DIA_Addon_Lucia_Paladine);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"Finalizar conversación.",DIA_Addon_Lucia_Paladine_BACK);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"No es sólo que los paladines luchen en su nombre. Innos escoge a sus guerreros.",DIA_Addon_Lucia_Paladine_WAHL);
		Info_AddChoice (DIA_Addon_Lucia_Paladine,"Los paladines son los guerreros de Innos, no asesinos.",DIA_Addon_Lucia_Paladine_MURDER);
		
	};
};
FUNC VOID DIA_Addon_Lucia_Paladine_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_Paladine);
};
FUNC VOID DIA_Addon_Lucia_Paladine_WAHL()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_WAHL_15_00");//Los paladines no sólo luchan en su nombre. Innos escoge a sus guerreros.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WAHL_16_01");//¿Y? Creo que es la propia gente quien se escoge a sí misma.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WAHL_16_02");//Tus palabras me siguen sorprendiendo. Hablas casi como si fueras de ellos.
	
	Info_AddChoice (DIA_Addon_Lucia_Paladine,"¿Has matado a algún ser humano?",DIA_Addon_Lucia_Paladine_KILL);
};
FUNC VOID DIA_Addon_Lucia_Paladine_KILL()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_KILL_15_00");//¿Has matado alguna vez a alguien?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_01");//No, y me alegro mucho.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_02");//Por favor, dejemos de ponernos tan serios.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_KILL_16_03");//Mejor bebamos y disfrutemos de los momentos que nos regalan los dioses.
	
	Info_ClearChoices (DIA_Addon_Lucia_Paladine);
};
FUNC VOID DIA_Addon_Lucia_Paladine_WEIB()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_WEIB_15_00");//¿Entonces reniegas de Innos?
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WEIB_16_01");//¿Cómo podría? Lo que pasa es que la gente no usa bien su nombre.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_WEIB_16_02");//Pero nunca dudé del esplendor de Innos ni por un instante.
};
FUNC VOID DIA_Addon_Lucia_Paladine_MURDER()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Paladine_MURDER_15_00");//Los paladines son guerreros de Innos, no asesinos.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_MURDER_16_01");//¿Y? Sus espadas están manchadas de sangre, como las armas de los piratas o los bandidos.
	AI_Output (self, other, "DIA_Addon_Lucia_Paladine_MURDER_16_02");//La única diferencia es que ellos lo hacen en nombre de Innos y no por sobrevivir.
	
	Info_AddChoice (DIA_Addon_Lucia_Paladine,"¿Entonces reniegas de Innos?",DIA_Addon_Lucia_Paladine_WEIB);
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Attentat   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 9;
	condition   = DIA_Addon_Lucia_Attentat_Condition;
	information = DIA_Addon_Lucia_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Lucia_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Lucia_Attentat_16_00");//Nada de nada.
};
//---------------------------------------------------------------------
//	Info Trade
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_Trade   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 99;
	condition   = DIA_Addon_Lucia_Trade_Condition;
	information = DIA_Addon_Lucia_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = "Dame algo para beber.";
};
FUNC INT DIA_Addon_Lucia_Trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_was)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_Trade_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_Trade_15_00");//Dame algo de beber.
	B_GiveTradeInv(self);
};
//---------------------------------------------------------------------
//	Info lernen
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_lernen   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 19;
	condition   = DIA_Addon_Lucia_lernen_Condition;
	information = DIA_Addon_Lucia_lernen_Info;
	permanent   = FALSE;
	description = "¿Puedes enseñarme algo?";
};
FUNC INT DIA_Addon_Lucia_lernen_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lucia_lernen_Info()
{
	AI_Output (other, self, "DIA_Addon_Lucia_lernen_15_00");//¿Puedes enseñarme algo?
	AI_Output (self, other, "DIA_Addon_Lucia_lernen_16_01");//(ríe) Será un placer. Puedes entrenar conmigo tu DESTREZA.
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Lucia puede ayudarme a mejorar mi destreza.");	
};
///////////////////////////////////////////////////////////////////////
//	Info TEACH
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Lucia_TEACH		(C_INFO)
{
	npc		  	 = 	BDT_1091_Addon_Lucia;
	nr			 = 	101;
	condition	 = 	DIA_Addon_Lucia_TEACH_Condition;
	information	 = 	DIA_Addon_Lucia_TEACH_Info;
	permanent	 = 	TRUE;
	description	 = 	"Quiero ser más diestro.";
};
func int DIA_Addon_Lucia_TEACH_Condition ()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Lucia_lernen)
	{
		return TRUE;
	};
};
func void DIA_Addon_Lucia_TEACH_Info ()
{
	AI_Output (other, self, "DIA_Addon_Lucia_TEACH_15_00"); //Quiero ser más diestro.
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
};
func void DIA_Addon_Lucia_TEACH_BACK()
{
	Info_ClearChoices (DIA_Addon_Lucia_TEACH);
};
func void DIA_Addon_Lucia_TEACH_1()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 1, T_MED);
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
	
};
func void DIA_Addon_Lucia_TEACH_5()
{
	B_TeachAttributePoints (self, other, ATR_DEXTERITY, 5, T_MED);
	
	Info_ClearChoices   (DIA_Addon_Lucia_TEACH);
	
	Info_AddChoice 		(DIA_Addon_Lucia_TEACH, DIALOG_BACK, DIA_Addon_Lucia_TEACH_BACK);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX1	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)),DIA_Addon_Lucia_TEACH_1);
	Info_AddChoice		(DIA_Addon_Lucia_TEACH, B_BuildLearnString(PRINT_LearnDEX5	, B_GetLearnCostAttribute(other, ATR_DEXTERITY)*5)	,DIA_Addon_Lucia_TEACH_5);
	
	
};



