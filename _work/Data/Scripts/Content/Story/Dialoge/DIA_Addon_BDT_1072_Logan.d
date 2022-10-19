//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_EXIT   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 999;
	condition   = DIA_Addon_Logan_EXIT_Condition;
	information = DIA_Addon_Logan_EXIT_Info;
	permanent   = TRUE;
	description = "Volveré más tarde…";
};
FUNC INT DIA_Addon_Logan_EXIT_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Logan_EXIT_Info()
{		
	AI_Output (other,self,"DIA_Addon_Logan_EXIT_15_00");//Volveré luego
	
	if ((!MIS_HlpLogan == LOG_RUNNING)
	|| ( !MIS_HlpLogan == LOG_SUCCESS))
	&& (Logan_Inside == FALSE)
	{
		AI_Output (self,other,"DIA_Addon_Logan_EXIT_10_01");//(gruñe) Sííííí, mejor lárgate. Yo me quedaré a detener a todo el que se acerque.
	};
	AI_StopProcessInfos (self);
};	
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Logan_PICKPOCKET (C_INFO)
{
	npc			= BDT_1072_Addon_Logan;
	nr			= 900;
	condition	= DIA_Addon_Logan_PICKPOCKET_Condition;
	information	= DIA_Addon_Logan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Addon_Logan_PICKPOCKET_Condition()
{
	C_Beklauen (59, 50);
};
 
FUNC VOID DIA_Addon_Logan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Logan_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Logan_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Logan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Logan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Logan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Logan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Logan_PICKPOCKET);
};
	
func void DIA_Addon_Logan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Logan_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1072_Logan_Mine   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_Mine_Condition;
	information = DIA_Addon_Logan_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Logan_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	&& (Npc_GetDistToWP (self, "BL_INN_CORNER_02") <= 1000) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	AI_Output (self, other, "DIA_Addon_BDT_1072_Logan_Mine_10_00");//Lo has conseguido, ¿eh? Bueno, al menos no me has dejado colgado.
	
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
};
//---------------------------------------------------------------------
//	Info INSIDE
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_How2   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_How2_Condition;
	information = DIA_Addon_Logan_How2_Info;
	permanent   = FALSE;
	description	= "¿Qué tal te va a ti?";
};
FUNC INT DIA_Addon_Logan_How2_Condition()	
{
	if (Logan_Inside == TRUE)
	&& (Npc_GetDistToWP (self,"BL_INN_CORNER_02") <= 1000)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_How2_Info()
{
	AI_Output (other, self, "DIA_Addon_Logan_How2_15_00"); //¿Qué tal te va?
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_01"); //Bien, al menos estoy dentro. Lucía prepara un licor terrible.
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_02"); //Pero Esteban no quiere dejarme entrar a la mina. Al menos, no de momento. Me ha encomendado otra labor.
	AI_Output (other, self, "DIA_Addon_Logan_How2_15_03"); //¿Y? ¿Qué te ha pedido que hagas?
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_04"); //Intentaron asesinar a Esteban y quiere que averigüe quién está detrás del asunto.
	AI_Output (self, other, "DIA_Addon_Logan_How2_10_05"); //(en voz baja) Esteban cree que Snaf tiene algo que ver. Se supone que debo vigilarle

};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_Attentat   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 9;
	condition   = DIA_Addon_Logan_Attentat_Condition;
	information = DIA_Addon_Logan_Attentat_Info;
	permanent   = FALSE;
	description	= DIALOG_ADDON_ATTENTAT_DESCRIPTION;
};
FUNC INT DIA_Addon_Logan_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	&& (Logan_Inside == TRUE)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Attentat_Info()
{
	B_Say 	  (other, self, "$ATTENTAT_ADDON_DESCRIPTION");
	AI_Output (self, other, "DIA_Addon_Logan_Attentat_10_00");//Estás buscando al responsable, ¿eh?
	AI_Output (self, other, "DIA_Addon_Logan_Attentat_10_01");//Sí, pero no sé nada al respecto. ¿Cómo podría? Yo aún andaba por el pantano entonces
};
//---------------------------------------------------------------------
//	Info HI 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_HI   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_HI_Condition;
	information = DIA_Addon_Logan_HI_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Logan_HI_Condition()	
{
	if (Logan_Inside == FALSE)
	&& Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_HI_Info()
{
	AI_Output (self, other, "DIA_Addon_Logan_HI_10_00");//Mira, una cara nueva.
	AI_Output (self, other, "DIA_Addon_Logan_HI_10_01");//¿Te vas a quedar por aquí sin más, o has venido a ayudarme?
	
	if Npc_KnowsInfo (other, DIA_Addon_Franco_HI) 
	{
		AI_Output (other, self, "DIA_Addon_Logan_HI_15_02");//Franco me envía. Dice que necesitas ayuda. ¿Qué sucede?
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Logan_HI_15_03");//Depende, ¿para qué necesitas ayuda?
	};
	AI_Output (self, other, "DIA_Addon_Logan_HI_10_04");//Los tiburones de la ciénaga se están acercando demasiado. Ya es hora de acabar con unos cuantos.
	
	Log_CreateTopic (Topic_Addon_Logan,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Logan,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Logan,"Logan quiere que cace tiburones de la ciénaga con él.");
};
//---------------------------------------------------------------------
//	Info Why
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_Why   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_Why_Condition;
	information = DIA_Addon_Logan_Why_Info;
	permanent   = FALSE;
	description	= "¿Y qué consigo a cambio de la ayuda?";
};
FUNC INT DIA_Addon_Logan_Why_Condition()	
{
	if Npc_KnowsInfo (other, DIA_Addon_Logan_HI)
	&& (Logan_Inside == FALSE)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Why_Info()
{
	AI_Output (other, self, "DIA_Addon_Logan_Why_15_00"); //¿Y qué consigo a cambio de la ayuda?
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_01"); //(gruñe) Franco dejará que te pudras aquí si no lo haces.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_02"); //Si quieres entrar al campamento, tendrás que echar una mano. No llegarás muy lejos sólo con palabras.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_03"); //Además, puedo enseñarte a sacarle las tripas a las bestias.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_04"); //Pero no creas que Franco te enviará directo al campamento sólo por divertirnos un rato con los tiburones de la ciénaga.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_05"); //Hay gente aquí fuera que lleva esperando mucho tiempo.
	AI_Output (self, other, "DIA_Addon_Logan_Why_10_06"); //Y el próximo en entrar seré yo… (gruñe)… más vale que así sea
	
	Log_CreateTopic (Topic_Addon_BDT_Teacher,LOG_NOTE);
	B_LogEntry 	(Topic_Addon_BDT_Teacher,"Logan puede enseñarme a conseguir pellejos, garras y dientes.");	
};
//---------------------------------------------------------------------
//	Info Lager
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_Lager   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 3;
	condition   = DIA_Addon_Logan_Lager_Condition;
	information = DIA_Addon_Logan_Lager_Info;
	permanent   = FALSE;
	description	= "¿Qué hay en el campamento?";
};
FUNC INT DIA_Addon_Logan_Lager_Condition()	
{
	if Npc_KnowsInfo (other, DIA_Addon_Logan_Why)
	&& (Logan_Inside == FALSE)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Logan_Lager_15_00");//¿Qué hay en el campamento?
	AI_Output (self, other, "DIA_Addon_Logan_Lager_10_01");//(gruñe) La cuestión es qué NO HAY en el campamento. No hay tiburones, ni agujeros…ni CIÉNAGA.
	AI_Output (self, other, "DIA_Addon_Logan_Lager_10_02");//En vez de eso, tienen licor y oro. Por lo que sé, tienen hasta una mujer. ¿Lo captas?
};
//---------------------------------------------------------------------
//	Info von Franco geschickt (MISsion) 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_MIS   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 99;
	condition   = DIA_Addon_Logan_MIS_Condition;
	information = DIA_Addon_Logan_MIS_Info;
	permanent   = FALSE;
	description	= "Vayamos a por los tiburones de la ciénaga.";
};
FUNC INT DIA_Addon_Logan_MIS_Condition()	
{	
	if Npc_KnowsInfo (other, DIA_Addon_Logan_HI)
	{
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_MIS_Info()
{
	
	AI_Output (other, self, "DIA_Addon_Logan_MIS_15_00");//Vayamos a por los tiburones de la ciénaga.
	AI_Output (self, other, "DIA_Addon_Logan_MIS_10_01");//(gruñe) Veo que comprendes cómo evolucionar en la vida. Me complace. Psst… ¿lo oyes? Sííííí, los oigo.
	AI_Output (other, self, "DIA_Addon_Logan_MIS_15_02");//Entiendo. ¿Y qué hacemos ahora?
	AI_Output (self, other, "DIA_Addon_Logan_MIS_10_03");//Se acercan. Tienen hambre de carne humana. Bien, veamos QUIÉN se come a quién… En marcha.
	
	Snd_Play ("SWA_Warn");
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"JAGD");
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_HlpLogan = LOG_RUNNING;
	
	
	Wld_InsertNpc (MIS_Addon_Swampshark_01,"ADW_SWAMPSHARK_01");
	Wld_InsertNpc (MIS_Addon_Swampshark_02,"ADW_SWAMPSHARK_02");
	Wld_InsertNpc (MIS_Addon_Swampshark_03,"ADW_BANDIT_VP3_06");
	
};
//---------------------------------------------------------------------
//	Info Sumpfhaie TOT
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_tot   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 2;
	condition   = DIA_Addon_Logan_tot_Condition;
	information = DIA_Addon_Logan_tot_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Logan_tot_Condition()	
{	
	if Npc_IsDead (MIS_Addon_Swampshark_01)
	&& Npc_IsDead (MIS_Addon_Swampshark_02)
	&& Npc_IsDead (MIS_Addon_Swampshark_03)
	&& Npc_KnowsInfo (other,DIA_Addon_Logan_MIS)
	{
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_tot_Info()
{	 
	AI_Output (self, other, "DIA_Addon_Logan_tot_10_00");//Tiburón bueno, tiburón muerto. ¡Eso servirá de aviso para el resto!
	AI_Output (other, self, "DIA_Addon_Logan_tot_15_01");//Muy bien, ¿algo más que hacer? Si no, tengo que irme
	AI_Output (self, other, "DIA_Addon_Logan_tot_10_02");//Hazlo. Si quieres aprender algo, ya sabes dónde encontrarme.
	
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	MIS_HlpLogan = LOG_SUCCESS;
	B_CheckLog ();
	B_LogEntry (Topic_Addon_Franco,"He ayudado a Logan. Veamos lo que Franco dice al respecto.");
	
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"START");
	
};

///////////////////////////////////////////////////////////////////////
//	Info Lernen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Logan_Lern   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 100;
	condition   = DIA_Addon_Logan_Lern_Condition;
	information = DIA_Addon_Logan_Lern_Info;
	permanent   = FALSE;
	description = "Enséñame a destripar animales…";
};
FUNC INT DIA_Addon_Logan_Lern_Condition()
{	
 	if Npc_KnowsInfo (other, DIA_Addon_Logan_Why)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Lern_Info()
{	
	AI_Output (other, self, "DIA_Addon_Logan_Lern_15_00");//Enséñame a destripar animales
	AI_Output (self, other, "DIA_Addon_Logan_Lern_10_01");//Si quieres aprender algo sobre moscas de sangre, acude a Edgor. Sabe todo sobre esos insectos.
	AI_Output (self, other, "DIA_Addon_Logan_Lern_10_02");//Y si quieres destripar tiburones de la ciénaga o lagartos, tienes que saber cómo quitarles la piel y los dientes. Te lo mostraré.
};
///////////////////////////////////////////////////////////////////////
//	Info Allgemeine Talente
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Logan_Allg   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 3;
	condition   = DIA_Addon_Logan_Allg_Condition;
	information = DIA_Addon_Logan_Allg_Info;
	permanent   = TRUE;
	description = "Quiero aprender…";
};
FUNC INT DIA_Addon_Logan_Allg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Logan_Lern)
	&& ((PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	|| (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Allg_Info()
{
	Info_ClearChoices (DIA_Addon_Logan_Allg);
	Info_AddChoice (DIA_Addon_Logan_Allg,DIALOG_BACK,DIA_Addon_Logan_Allg_BACK);
	
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Teeth] == FALSE)
	{ 
		Info_AddChoice	(DIA_Addon_Logan_Allg, B_BuildLearnString ("Sacar dientes",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Teeth)),  DIA_Addon_Logan_Allg_Teeth);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Claws] == FALSE)
	{ 
		Info_AddChoice	(DIA_Addon_Logan_Allg, B_BuildLearnString ("Arrancar garras",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Claws)),  DIA_Addon_Logan_Allg_Claws);
	};
	if (PLAYER_TALENT_TAKEANIMALTROPHY [TROPHY_Fur] == FALSE)
	{ 
		Info_AddChoice	(DIA_Addon_Logan_Allg, B_BuildLearnString ("Despellejar",B_GetLearnCostTalent (other,NPC_TALENT_TAKEANIMALTROPHY, TROPHY_Fur)),  DIA_Addon_Logan_Allg_Fur);
	};
	
};
//------------------------------------------------------------------------------------------------
//			Allgemeine Talente
//------------------------------------------------------------------------------------------------
FUNC VOID DIA_Addon_Logan_Allg_BACK()
{
	Info_ClearChoices (DIA_Addon_Logan_Allg);
};
FUNC VOID DIA_Addon_Logan_Allg_Teeth ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Teeth);
};
FUNC VOID DIA_Addon_Logan_Allg_Claws ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws);
};
FUNC VOID DIA_Addon_Logan_Allg_Fur ()
{
	B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Fur);
};

//----------------------------------------------------------------------
var int Logan_Lohn;
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Logan_Hacker   (C_INFO)
{
	npc         = BDT_1072_Addon_Logan;
	nr          = 9;
	condition   = DIA_Addon_Logan_Hacker_Condition;
	information = DIA_Addon_Logan_Hacker_Info;
	permanent   = TRUE;
	Description = "¿Qué tal va todo?"; 
};
FUNC INT DIA_Addon_Logan_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_PICK_08") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Logan_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Logan_Hacker_15_00"); //¿Qué tal va todo?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_01"); //Eh, gracias, lo he conseguido. ¡Estoy en la mina!
	AI_Output (self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_02"); //No sé mucho sobre extraer oro, pero todo llegará.
	
	if (Logan_Lohn == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10004_Logan_Hacker_10_03"); //He aprendido lo más importante. ¡Los pies siempre en el suelo y golpea con decisión!
		B_Upgrade_Hero_HackChance(10); 
		Logan_Lohn = TRUE;
	};
};
	


