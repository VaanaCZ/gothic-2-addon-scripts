//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_EXIT   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 999;
	condition   = DIA_Addon_Paul_EXIT_Condition;
	information = DIA_Addon_Paul_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Paul_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Paul_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Paul_PICKPOCKET (C_INFO)
{
	npc			= BDT_1070_Addon_Paul;
	nr			= 900;
	condition	= DIA_Addon_Paul_PICKPOCKET_Condition;
	information	= DIA_Addon_Paul_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Addon_Paul_PICKPOCKET_Condition()
{
	C_Beklauen (22, 19);
};
 
FUNC VOID DIA_Addon_Paul_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Paul_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Paul_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Paul_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Paul_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Paul_PICKPOCKET_DoIt);
};

func void DIA_Addon_Paul_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Paul_PICKPOCKET);
};
	
func void DIA_Addon_Paul_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Paul_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_Hi   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 1;
	condition   = DIA_Addon_Paul_Hi_Condition;
	information = DIA_Addon_Paul_Hi_Info;
	permanent   = FALSE;
	description = "¿Tienes equipamiento de herrería?";
};
FUNC INT DIA_Addon_Paul_Hi_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Addon_Paul_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_Hi_15_00"); //¿Tienes equipamiento de herrería?
	AI_Output (self, other, "DIA_Addon_Paul_Hi_03_01"); //Huno tiene acero. Yo sólo tengo unos trozos de mineral.
	AI_Output (self, other, "DIA_Addon_Paul_Hi_03_02"); //Pero son para mí. Es lo único que me queda de valor.
};
//---------------------------------------------------------------------
//	Info Huno
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_Huno   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 2;
	condition   = DIA_Addon_Paul_Huno_Condition;
	information = DIA_Addon_Paul_Huno_Info;
	permanent   = FALSE;
	description	= "¿Trabajas para Huno?";
};
FUNC INT DIA_Addon_Paul_Huno_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Paul_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_Huno_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_Huno_15_00"); //¿Trabajas para Huno?
	AI_Output (self, other, "DIA_Addon_Paul_Huno_03_01"); //Quería conseguir algo de oro y empecé con Huno, pero, desde entonces, Esteban no me ha dado nada.
	AI_Output (self, other, "DIA_Addon_Paul_Huno_03_02"); //Dice que ya no le sirvo para nada.
	AI_Output (self, other, "DIA_Addon_Paul_Huno_03_03"); //Sólo puedo seguir trabajando como un burro para Huno.
};

//---------------------------------------------------------------------
//	Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_Attentat   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 3;
	condition   = DIA_Addon_Paul_Attentat_Condition;
	information = DIA_Addon_Paul_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Paul_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Paul_Attentat_03_00"); //¡Nada, amigo! ¡No tuve nada que ver con eso! ¿Qué quieres de mí?
};
	
//---------------------------------------------------------------------
//	HunoVerdacht
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_HunoVerdacht   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 4;
	condition   = DIA_Addon_Paul_HunoVerdacht_Condition;
	information = DIA_Addon_Paul_HunoVerdacht_Info;
	permanent   = FALSE;
	description	= "Hay sospechas de que Huno tuvo algo que ver en el ataque...";
};
FUNC INT DIA_Addon_Paul_HunoVerdacht_Condition()
{	
	if ( (Finn_TellAll == TRUE) || (Emilio_TellAll == TRUE) )
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_HunoVerdacht_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_HunoVerdacht_15_00"); //Se sospecha que Huno tuvo algo que ver en el ataque
	AI_Output (self, other, "DIA_Addon_Paul_HunoVerdacht_03_01"); //¡Yo no sé nada!
};
	
//---------------------------------------------------------------------
//	Arbeitest für Huno
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_HunoArbeit (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 5;
	condition   = DIA_Addon_Paul_HunoArbeit_Condition;
	information = DIA_Addon_Paul_HunoArbeit_Info;
	permanent   = FALSE;
	description	= "¡Trabajas para Huno! ¡Debes de saber algo!";
};
FUNC INT DIA_Addon_Paul_HunoArbeit_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Paul_Huno))
	&& (Npc_KnowsInfo (other, DIA_Addon_Paul_HunoVerdacht))
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_HunoArbeit_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_HunoArbeit_15_00"); //¡Pero trabajas para Huno! ¡Tienes que saber algo!
	AI_Output (self, other, "DIA_Addon_Paul_HunoArbeit_03_01"); //(desesperado) ¡En serio, no sé nada! ¡Tengo que irme!
	Npc_ExchangeRoutine(self, "AWAY");
	AI_StopProcessInfos (self);
};
	
//---------------------------------------------------------------------
//	Angst vor Esteban
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_FearEsteban (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 5;
	condition   = DIA_Addon_Paul_FearEsteban_Condition;
	information = DIA_Addon_Paul_FearEsteban_Info;
	permanent   = FALSE;
	description	= "¿Sabes lo que hará Esteban contigo cuando sepa que encubres a Huno?";
};
FUNC INT DIA_Addon_Paul_FearEsteban_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Paul_HunoArbeit))
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_FearEsteban_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_FearEsteban_15_00"); //¿Sabes lo que te hará Esteban si averigua que estás encubriendo a Huno?
	AI_Output (self, other, "DIA_Addon_Paul_FearEsteban_03_01"); //¡Oye! Déjame en paz. No tengo nada que ver con ese asunto.
	Npc_ExchangeRoutine(self, "PRESTART");
	AI_StopProcessInfos (self);
};
	
//---------------------------------------------------------------------
//	MaulPaul
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_MaulPaul (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 5;
	condition   = DIA_Addon_Paul_MaulPaul_Condition;
	information = DIA_Addon_Paul_MaulPaul_Info;
	permanent   = FALSE;
	description	= "¡Dime lo que sabes enseguida!";
};
FUNC INT DIA_Addon_Paul_MaulPaul_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Paul_FearEsteban))
	&& (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_MaulPaul_Info()
{
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_00"); //(amistosamente) ¡Dime lo que sabes o te estampo contra la pared, Paul!
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_01"); //No puedes amenazarme sólo porque trabajar para el jefe.
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_02"); //(suavemente) ¡Claro que sí!
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_03"); //¡Déjalo ya!
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_04"); //(impaciente) Paul
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_05"); //(agitado) Lo único que sé es que Huno tiene asuntos pendientes con Esteban.
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_06"); //(agitado) Siempre me está hablando de ese tal Esteban. Que si ha fracasado en sus negocios por él, etc
	AI_Output (self, other, "DIA_Addon_Paul_MaulPaul_03_07"); //Yo me limitada a escuchar y a callar.
	AI_Output (other, self, "DIA_Addon_Paul_MaulPaul_15_08"); //¡Exacto! Lo ves. No era tan malo.
	
	Npc_ExchangeRoutine(self, "START");
	
	Paul_TellAll = TRUE;
	B_LogEntry (Topic_Addon_Esteban, "Paul dice que Huno odia a Esteban porque le echa a perder sus negocios.");
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1070_Paul_Mine   (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 2;
	condition   = DIA_Addon_Paul_Mine_Condition;
	information = DIA_Addon_Paul_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Paul_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_BDT_1070_Paul_Mine_03_00");//¡Por fin! Toma, quédate mi mineral por esto.
	B_GiveInvItems (self, other, ItMi_Nugget,2);
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};

//----------------------------------------------------------------------
//	PERM
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Paul_PERM (C_INFO)
{
	npc         = BDT_1070_Addon_Paul;
	nr          = 99;
	condition   = DIA_Addon_Paul_PERM_Condition;
	information = DIA_Addon_Paul_PERM_Info;
	permanent   = TRUE;
	description = "¿Todo bien, por lo demás?";
};
FUNC INT DIA_Addon_Paul_PERM_Condition()
{	
	if (Npc_KnowsInfo (other,  DIA_Addon_Paul_Huno))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Paul_PERM_Info()
{	
	AI_Output (other, self, "DIA_Addon_Paul_PERM_15_00"); //¿Todo bien, por lo demás?
	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_07") <= 500)
	{
		AI_Output (self, other, "DIA_Addon_Paul_PERM_03_01"); //¡Sí, voy a sacar un montón de oro de esta roca!
	}
	else 
	{
		if (Paul_TellAll == TRUE)
		&& (Huno_zuSnaf == FALSE)
		{
			AI_Output (self, other, "DIA_Addon_Paul_PERM_03_02"); //¡Te he dicho todo lo que sé!
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Paul_PERM_03_03"); //¡Sólo quiero hacer mi trabajo, amigo!
		};
	};
};




