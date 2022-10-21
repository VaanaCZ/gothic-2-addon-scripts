//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_EXIT   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 999;
	condition   = DIA_Addon_Lennar_EXIT_Condition;
	information = DIA_Addon_Lennar_EXIT_Info;
	permanent   = TRUE;
	description = "Me tengo que ir…";
};
FUNC INT DIA_Addon_Lennar_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_EXIT_Info()
{		
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Lennar_PICKPOCKET (C_INFO)
{
	npc			= BDT_1096_Addon_Lennar;
	nr			= 900;
	condition	= DIA_Addon_Lennar_PICKPOCKET_Condition;
	information	= DIA_Addon_Lennar_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       
FUNC INT DIA_Addon_Lennar_PICKPOCKET_Condition()
{
	C_Beklauen (65, 100);
};
 
FUNC VOID DIA_Addon_Lennar_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Lennar_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Lennar_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Lennar_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Lennar_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Lennar_PICKPOCKET_DoIt);
};

func void DIA_Addon_Lennar_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Lennar_PICKPOCKET);
};
	
func void DIA_Addon_Lennar_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Lennar_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Hi   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 1;
	condition   = DIA_Addon_Lennar_Hi_Condition;
	information = DIA_Addon_Lennar_Hi_Info;
	permanent   = FALSE;
	description	= "Hola.";
};
FUNC INT DIA_Addon_Lennar_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Lennar_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_00");//Hola.
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_01");//Hola. Soy Lennar. Bienvenido al campamento de cavadores.
	AI_Output (other, self, "DIA_Addon_Lennar_Hi_15_02");//¿Cavadores? Creí que era el de bandidos.
	AI_Output (self, other, "DIA_Addon_Lennar_Hi_01_03");//Claro, pero los bandidos vienen aquí sólo a cavar. (se encoge de hombros) Así que
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Attentat   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 2;
	condition   = DIA_Addon_Lennar_Attentat_Condition;
	information = DIA_Addon_Lennar_Attentat_Info;
	permanent   = FALSE;
	description	= "Sobre el intento de asesinato de Esteban…";
};
FUNC INT DIA_Addon_Lennar_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Attentat_Info()
{
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_00"); //(inocentemente) ¿Sí?
	AI_Output (other, self, "DIA_Addon_Lennar_ATTENTAT_15_01"); //¿Tienes idea de quién anda detrás?
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_02"); //(con entusiasmo) ¡Claro!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_03"); //(agitado) Te digo una cosa: ¡apuesto a que Emilio anda detrás de esto!
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_04"); //(agitado) Siempre corría hacia la mina como loco. Sacaba de dentro todo lo que podía.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_05"); //(con tono astuto) Pero desde el ataque, no hace más que estar sentado, sin mover un dedo.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_06"); //(dándose cuenta) ¡Es evidente! Para entrar a la mina, necesita una piedra roja de Esteban.
	AI_Output (self, other, "DIA_Addon_Lennar_ATTENTAT_01_07"); //(conspirando) Seguro que no se atreve a mirarlo a la cara.

	B_LogEntry (Topic_Addon_Esteban, "Lenar sospecha de Emilio porque ya no acude a Esteban.");
};

//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Inspektor (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 3;
	condition   = DIA_Addon_Lennar_Inspektor_Condition;
	information = DIA_Addon_Lennar_Inspektor_Info;
	permanent   = FALSE;
	description	= "What would Emilio get out of Esteban's death?";
};
FUNC INT DIA_Addon_Lennar_Inspektor_Condition()
{	
	if (Npc_KnowsInfo(other, DIA_Addon_Lennar_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Inspektor_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Inspektor_15_00"); //¿Y qué sacaría Emilio de la muerte de Esteban?
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_01"); //¿Y yo qué se? Quizás tenga un amigo en la mina para sustituir a Esteban.
	AI_Output (self, other, "DIA_Addon_Lennar_Inspektor_01_02"); //(para sí) Sí, eso tendría sentido
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Mine   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 4;
	condition   = DIA_Addon_Lennar_Mine_Condition;
	information = DIA_Addon_Lennar_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Lennar_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_00");//Tienes de verdad una piedra roja para mí.
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_01");//Excelente. Ahora haré gravilla esa maldita roca. ¡Ya sé exactamente donde pienso ir!
	AI_Output (self, other, "DIA_Addon_Lennar_Mine_01_02");//Una cosa más: si vas a la mina, cuidado con dar golpes demasiado FUERTES. ¡Se te puede quedar la piqueta enganchada en el oro!
	
	B_Upgrade_Hero_HackChance(10);
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};

//---------------------------------------------------------------------
//	Info Gold
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Gold   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 5;
	condition   = DIA_Addon_Lennar_Gold_Condition;
	information = DIA_Addon_Lennar_Gold_Info;
	permanent   = FALSE;
	description = "¿Puedes enseñarme a extraer oro?";
};
FUNC INT DIA_Addon_Lennar_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Lennar_Hi)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Lennar_Gold_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_00"); //¿Puedes enseñarme algo sobre extraer oro?
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_01"); //Claro, pero si te enseño, podrás extraer más oro.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_02"); //Para eso te lo pregunto.
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_03"); //Por supuesto. Pero si extraes más oro, lo justo será que yo me quede una parte.
	AI_Output (other, self, "DIA_Addon_Lennar_Gold_15_04"); //Pues
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_05"); //Además, puedes dármela por adelantado. Digamos
	AI_Output (self, other, "DIA_Addon_Lennar_Gold_01_06"); //Cincuenta monedas.
};

//---------------------------------------------------------------------
//	Train
//---------------------------------------------------------------------
var int Lennar_TeachGold;
// --------------------------------------------
INSTANCE DIA_Addon_Lennar_Train   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 6;
	condition   = DIA_Addon_Lennar_Train_Condition;
	information = DIA_Addon_Lennar_Train_Info;
	permanent   = TRUE;
	description = "¡Enséñame a extraer oro! (50 oro)";
};
FUNC INT DIA_Addon_Lennar_Train_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Lennar_Gold))
	&& (Lennar_TeachGold == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Addon_Lennar_Train_Info()
{
	AI_Output (other, self, "DIA_Addon_Lennar_Train_15_00"); //¡Enséñame algo para extraer oro!
	
	if B_GiveInvItems (other, self, itmi_gold, 50)
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_01"); //Bien. Los golpes regulares te harán avanzar. No te pases, pero tampoco te duermas en los laureles.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_02"); //Y no golpees siempre en el mismo punto, intenta trabajar alrededor de una buena pepita.
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_03"); //Sigue mi consejo y estarás en el buen camino para ser un experto minero.
		
		B_Upgrade_Hero_HackChance(10);
		Lennar_TeachGold = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Lennar_Train_01_04"); //¡Primero quiero ver mi parte!
	};
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Lennar_Hacker   (C_INFO)
{
	npc         = BDT_1096_Addon_Lennar;
	nr          = 9;
	condition   = DIA_Addon_Lennar_Hacker_Condition;
	information = DIA_Addon_Lennar_Hacker_Info;
	permanent   = TRUE;
	Description = "¿Va todo bien?"; 
};
FUNC INT DIA_Addon_Lennar_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_09") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Lennar_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Lennar_Hacker_15_00"); //¿Todo bien?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Lennar_Hacker_01_01"); //Suave y regularmente. ¡Así sacarás las pepitas más grandes!
};


