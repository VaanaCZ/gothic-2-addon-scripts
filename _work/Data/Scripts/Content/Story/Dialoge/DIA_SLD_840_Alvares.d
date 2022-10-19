///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Alvares_EXIT   (C_INFO)
{
	npc         = SLD_840_Alvares;
	nr          = 999;
	condition   = DIA_Alvares_EXIT_Condition;
	information = DIA_Alvares_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Alvares_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Alvares_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info HauAb
///////////////////////////////////////////////////////////////////////
instance DIA_Alvares_HAUAB		(C_INFO)
{
	npc			 = 	SLD_840_Alvares;
	nr			 = 	4;
	condition	 = 	DIA_Alvares_HAUAB_Condition;
	information	 = 	DIA_Alvares_HAUAB_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Alvares_HAUAB_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Alvares_HAUAB_Info ()
{
	Akils_SLDStillthere = TRUE;
	AI_Output (self, other, "DIA_Alvares_HAUAB_11_00"); //Sea lo que sea que te trajo aquí, mejor que lo olvides y te largues.
	Log_CreateTopic (TOPIC_AkilsSLDStillthere, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_AkilsSLDStillthere, LOG_RUNNING);
	B_LogEntry (TOPIC_AkilsSLDStillthere,"La granja de Akil está amenazada por mercenarios."); 
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Attack
///////////////////////////////////////////////////////////////////////
instance DIA_Alvares_ATTACK		(C_INFO)
{
	npc			 = 	SLD_840_Alvares;
	nr			 = 	6;
	condition	 = 	DIA_Alvares_ATTACK_Condition;
	information	 = 	DIA_Alvares_ATTACK_Info;
	permanent	 = 	FALSE;
	important	 = 	TRUE;
};
func int DIA_Alvares_ATTACK_Condition ()
{
	if	(Npc_KnowsInfo(other, DIA_Alvares_HAUAB))
	&&  (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
func void DIA_Alvares_ATTACK_Info ()
{
	AI_Output (self, other, "DIA_Alvares_ATTACK_11_00"); //Ey, sigues aquí. Te doy dos opciones, extraño: pírate o muere.
	
	Info_ClearChoices (DIA_Alvares_ATTACK);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"¿Vosotros quiénes sois?, ¿un par de bufones?",DIA_Alvares_ATTACK_Kerle);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"Quiero unirme a vosotros, los mercenarios.",DIA_Alvares_ATTACK_Soeldner);
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"A ver, salid de aquí ya...",DIA_Alvares_ATTACK_Witz);	 
	Info_AddChoice 	  (DIA_Alvares_ATTACK,"No quiero problemas.",DIA_Alvares_ATTACK_Aerger);
	
	if (MIS_Baltram_ScoutAkil == LOG_RUNNING)
	{
		Info_AddChoice 	  (DIA_Alvares_ATTACK,"Solo he venido a buscar una cosa.",DIA_Alvares_ATTACK_Lieferung);
	};
	
	
};
FUNC VOID DIA_Alvares_ATTACK_Witz()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Witz_15_00"); //Vosotros largaos de aquí inmediatamente, ¿está claro?
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_01"); //Anda, mira, tenemos un héroe ante nosotros. Un héroe estúpido de verdad.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_02"); //¿Sabes lo que estoy pensando?
	AI_Output (other, self, "DIA_Alvares_ATTACK_Witz_15_03"); //¿A quién le importa lo que pienses?
	AI_Output (self, other, "DIA_Alvares_ATTACK_Witz_11_04"); //Creo que el único héroe bueno es el héroe muerto. Así que hazme un favor: ¡date prisa y muérete!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);

};
FUNC VOID DIA_Alvares_ATTACK_Kerle()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Kerle_15_00"); //¿Vosotros quiénes sois?, ¿un par de bufones?
	AI_Output (self, other, "DIA_Alvares_ATTACK_Kerle_11_01"); //Eso es. Voy a seguir riéndome cuando estés en el barro, boca abajo.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Kerle_11_02"); //(Llama) Engardo, ¡manos a la obra! Tú ocúpate del granjero, ¡yo me encargo de este payaso!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);

};
FUNC VOID DIA_Alvares_ATTACK_Aerger()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Aerger_15_00"); //No quiero problemas.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Aerger_11_01"); //Pero nosotros sí. Hemos venido desde muy lejos para tenerlos.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Aerger_11_02"); //Sí, vamos a meternos en muchos líos. Y yo voy a empezar contigo si no te esfumas ahora mismo.
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Alvares_ATTACK_Lieferung()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Lieferung_15_00"); //Solo he venido a buscar una cosa.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Lieferung_11_01"); //Nosotros también. Y hemos llegado antes. Así que lárgate o tendré que hacerte daño.
	
	AI_StopProcessInfos (self);
};
FUNC VOID DIA_Alvares_ATTACK_Soeldner()
{
	AI_Output (other, self, "DIA_Alvares_ATTACK_Soeldner_15_00"); //Quiero unirme a vosotros, los mercenarios.
	AI_Output (self, other, "DIA_Alvares_ATTACK_Soeldner_11_01"); //Oh, ¿de veras? Pues lárgate o no te unirás a nadie nunca más.
	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Schluss
///////////////////////////////////////////////////////////////////////
instance DIA_Alvares_Schluss		(C_INFO)
{
	npc			 = 	SLD_840_Alvares;
	nr			 = 	4;
	condition	 = 	DIA_Alvares_Schluss_Condition;
	information	 = 	DIA_Alvares_Schluss_Info;
	permanent	 =  FALSE;
	important	 = 	TRUE;
};

func int DIA_Alvares_Schluss_Condition ()
{
	if (Npc_IsInState (self, ZS_Talk))
	&& (Npc_KnowsInfo (other,DIA_Alvares_ATTACK))
	{
		return TRUE;
	};
};
func void DIA_Alvares_Schluss_Info ()
{
	AI_Output (self, other, "DIA_Alvares_Schluss_11_00"); //Tuviste tu oportunidad. Pero parece que no quieres atenerte a razones.
	AI_Output (self, other, "DIA_Alvares_Schluss_11_01"); //De acuerdo. Ahora voy a matarte. (Llama) Engardo, ¡a por ellos!
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_SuddenEnemyInferno, 1);	

	
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Alvares_PICKPOCKET (C_INFO)
{
	npc			= SLD_840_Alvares;
	nr			= 900;
	condition	= DIA_Alvares_PICKPOCKET_Condition;
	information	= DIA_Alvares_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Alvares_PICKPOCKET_Condition()
{
	C_Beklauen (20, 15);
};
 
FUNC VOID DIA_Alvares_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Alvares_PICKPOCKET);
	Info_AddChoice		(DIA_Alvares_PICKPOCKET, DIALOG_BACK 		,DIA_Alvares_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Alvares_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Alvares_PICKPOCKET_DoIt);
};

func void DIA_Alvares_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Alvares_PICKPOCKET);
};
	
func void DIA_Alvares_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Alvares_PICKPOCKET);
};


