///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_EXIT   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 999;
	condition   = DIA_Jergan_EXIT_Condition;
	information = DIA_Jergan_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Jergan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jergan_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hallo 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Hallo   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 2;
	condition   = DIA_Jergan_Hallo_Condition;
	information = DIA_Jergan_Hallo_Info;
	permanent   = FALSE;
	description = "¿Qué haces rondando por aquí?";
};

FUNC INT DIA_Jergan_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jergan_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jergan_Hallo_15_00");//¿Qué haces rondando por aquí?
	AI_Output (self, other,"DIA_Jergan_Hallo_13_01");//Vengo del castillo. Me han enviado a buscar a los que faltan y a revisar el área.
};
///////////////////////////////////////////////////////////////////////
//	Info Vermisste
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Vermisste   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 2;
	condition   = DIA_Jergan_Vermisste_Condition;
	information = DIA_Jergan_Vermisste_Info;
	permanent   = FALSE;
	description = "¿Los que faltan?";
};

FUNC INT DIA_Jergan_Vermisste_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Vermisste_Info()
{
	AI_Output (other, self,"DIA_Jergan_Vermisste_15_00");//¿Los que faltan?
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_01");//Algunos huyeron al atacar los dragones. La mayoría de ellos no lo consiguieron, ¡no es de extrañar!
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_02");//Pero si hay algún superviviente, lo traeré de vuelta.
};
///////////////////////////////////////////////////////////////////////
//	Info Burg 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Burg   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Burg_Condition;
	information = DIA_Jergan_Burg_Info;
	permanent   = FALSE;
	description = "¿Puedes ayudarme a entrar en el castillo?";
};

FUNC INT DIA_Jergan_Burg_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	&& (Npc_GetDistToWP (self, "OW_STAND_JERGAN") <= 1000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Burg_Info()
{
	AI_Output (other, self,"DIA_Jergan_Burg_15_00");//¿Puedes ayudarme a entrar en el castillo?
	AI_Output (self, other,"DIA_Jergan_Burg_13_01");//Claro, pero tienes que hacerme un favor.
	AI_Output (self, other,"DIA_Jergan_Burg_13_02");//Si consigues entrar en el castillo, habla con el paladín Oric. Dile que su hermano la palmó arriba, en el paso.
	
	Log_CreateTopic (Topic_OricBruder, LOG_MISSION);
	Log_SetTopicStatus (Topic_OricBruder,LOG_RUNNING);
	B_LogEntry (Topic_OricBruder,"Cuando esté en el castillo, tengo que decirle a Oric que su hermano cayó en el paso.");
};
///////////////////////////////////////////////////////////////////////
//	Info Gegend
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Gegend   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Gegend_Condition;
	information = DIA_Jergan_Gegend_Info;
	permanent   = TRUE;
	description = "¿Qué debo saber sobre esta área?";
};

FUNC INT DIA_Jergan_Gegend_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Hallo)
	{
		return TRUE;
	};
};
var int Jergan_Tell;
FUNC VOID DIA_Jergan_Gegend_Info()
{
	if (Jergan_Tell == FALSE)
	{
		AI_Output (other, self,"DIA_Jergan_Gegend_15_00");//¿Qué debo saber sobre esta área?
		AI_Output (self, other,"DIA_Jergan_Gegend_13_01");//Si quieres vivir, regresa al sitio de donde vienes.
		AI_Output (self, other,"DIA_Jergan_Gegend_13_02");//Los pieles verdes llevan semanas asediando el castillo y esos dragones están escondidos también por algún sitio.
	};
	AI_Output (self, other,"DIA_Jergan_Gegend_13_03");//Todo el valle de las minas está infestado de orcos. No importa dónde vayas, no va a ser un picnic.
	Jergan_Tell = TRUE;
};
///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Hilfe   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Hilfe_Condition;
	information = DIA_Jergan_Hilfe_Info;
	permanent   = FALSE;
	description = "¿Cómo puedo entrar en el castillo?";
};

FUNC INT DIA_Jergan_Hilfe_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Jergan_Burg)
	&& (Npc_GetDistToWP (self, "OW_STAND_JERGAN") <= 1000)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Jergan_Hilfe_Info()
{
	AI_Output (other, self,"DIA_Jergan_Hilfe_15_00");//¿Cómo puedo entrar en el castillo?
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_01");//Lo primero de todo, puedes ir olvidándote de la ruta directa. Pero si rodeas el castillo, podrías tener una oportunidad desde atrás.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_02");//Deberías mantenerte apartado de los caminos y usar el río. Mejor si nadas río abajo un poco. Debería ser más fácil desde ahí.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_03");//Los orcos han instalado un ariete detrás del castillo. Puedes entrar por allí. Acércate todo lo que puedas a los orcos y echa a correr.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_04");//Si eres suficientemente rápido, podrías conseguirlo.
};


//2. Begegnung
///////////////////////////////////////////////////////////////////////
//	Info 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Mine   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Mine_Condition;
	information = DIA_Jergan_Mine_Info;
	permanent   = FALSE;
	description = "¿Qué estás haciendo aquí?";
};

FUNC INT DIA_Jergan_Mine_Condition()
{	
	if( Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Mine_Info()
{
	AI_Output (other, self,"DIA_Jergan_Mine_15_00");//¿Qué estás haciendo aquí?
	AI_Output (self, other,"DIA_Jergan_Mine_13_01");//Soy un explorador. Vago por el campo. Pero todos esos chasqueadores no me lo han puesto nada fácil.
	AI_Output (self, other,"DIA_Jergan_Mine_13_02");//Es un buen momento para conseguir unos cuantos trofeos. Siempre que sepas lo que estás haciendo.
};
///////////////////////////////////////////////////////////////////////
//	Klauen reissen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Claw   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Claw_Condition;
	information = DIA_Jergan_Claw_Info;
	permanent   = FALSE;
	description = "¿Puedes enseñarme a hacer eso?";
};

FUNC INT DIA_Jergan_Claw_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_KnowsInfo (other, DIA_Jergan_Mine)
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Claw_Info()
{
	AI_Output (other, self,"DIA_Jergan_Claw_15_00");//¿Puedes enseñarme a hacer eso?
	AI_Output (self, other,"DIA_Jergan_Claw_13_01");//Puedo enseñarte a arrancar las garras de esas cosas una vez muertas.
};
///////////////////////////////////////////////////////////////////////
//	Klauen reissen lernen
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Teach   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Teach_Condition;
	information = DIA_Jergan_Teach_Info;
	permanent   = TRUE;
	description = "(Aprender a arrancar garras)";
};
FUNC INT DIA_Jergan_Teach_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_KnowsInfo (other, DIA_Jergan_Claw)
	&& (PLAYER_TALENT_TAKEANIMALTROPHY[TROPHY_Claws] == FALSE)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Teach_Info()
{
	AI_Output (other, self,"DIA_Jergan_Teach_15_00");//Enséñame a arrancar garras.
	
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
	{
		AI_Output (self, other,"DIA_Jergan_Teach_13_01");//Lo importante es arrancar las garras de un tirón. No dudes demasiado y no andes usando cuchillos.
		AI_Output (self, other,"DIA_Jergan_Teach_13_02");//No solo se arrancan así las garras de los chasqueadores, también de lagartos y de bestias de la sombra.
	};
};
///////////////////////////////////////////////////////////////////////
//	Diego
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Jergan_Diego   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 9;
	condition   = DIA_Jergan_Diego_Condition;
	information = DIA_Jergan_Diego_Info;
	permanent   = FALSE;
	description = "¿Sabes dónde fue Diego?";
};

FUNC INT DIA_Jergan_Diego_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& (Npc_KnowsInfo (other, DIA_DiegoOw_Hallo) == FALSE)
	&& Npc_KnowsInfo (other,DIA_Parcival_Diego)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Diego_Info()
{
	AI_Output (other, self,"DIA_Jergan_Diego_15_00");//¿Sabes adónde fue Diego?
	AI_Output (self, other,"DIA_Jergan_Diego_13_01");//¿Diego? Era uno de los raspadores de Silvestro. Pero últimamente es difícil de ver.
	AI_Output (self, other,"DIA_Jergan_Diego_13_02");//Le vi con dos caballeros y una caja, no muy lejos de aquí.
	AI_Output (self, other,"DIA_Jergan_Diego_13_03");//Desde aquí puedes ver la vieja atalaya, ¿no? Ve hasta allí y luego hacia el castillo.
	AI_Output (self, other,"DIA_Jergan_Diego_13_04");//Hay un camino que pasa entre las rocas hacia la derecha. Se fueron por allí.
};
///////////////////////////////////////////////////////////////////////
//	Rudelführer getötet
///////////////////////////////////////////////////////////////////////

INSTANCE DIA_Jergan_Leader   (C_INFO)
{
	npc         = VLK_4110_Jergan;
	nr          = 3;
	condition   = DIA_Jergan_Leader_Condition;
	information = DIA_Jergan_Leader_Info;
	permanent   = FALSE;
	important   = TRUE;
};

FUNC INT DIA_Jergan_Leader_Condition()
{	
	if (Npc_GetDistToWP (self, "OW_NEWMINE_04") < 1000)
	&& Npc_IsDead(NewMine_LeadSnapper) 
	&& Npc_KnowsInfo (other,DIA_Bilgot_KNOWSLEADSNAPPER)
	{	
		return TRUE;
	};	
};
FUNC VOID DIA_Jergan_Leader_Info()
{
	AI_Output (self, other,"DIA_Jergan_Leader_13_00");//Así que mataste al líder del grupo. ¿Y le quitaste las garras a esa bestia?
	
	if (Npc_HasItems (other, ItAt_ClawLeader) >= 1)
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_01");//Sí.
		AI_Output (self, other,"DIA_Jergan_Leader_13_02");//Seguro que valen un montón. Hay tipos que coleccionan esas cosas.
		AI_Output (self, other,"DIA_Jergan_Leader_13_03");//Si encuentras al comprador adecuado, obtendrás una pila de oro por ellas.
	}
	else
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_04");//No.
		AI_Output (self, other,"DIA_Jergan_Leader_13_05");//Deberías hacerlo. Estoy seguro de que valen una fortuna.
	};	
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Jergan_PICKPOCKET (C_INFO)
{
	npc			= VLK_4110_Jergan;
	nr			= 900;
	condition	= DIA_Jergan_PICKPOCKET_Condition;
	information	= DIA_Jergan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_100;
};                       

FUNC INT DIA_Jergan_PICKPOCKET_Condition()
{
	C_Beklauen (84, 110);
};
 
FUNC VOID DIA_Jergan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Jergan_PICKPOCKET);
	Info_AddChoice		(DIA_Jergan_PICKPOCKET, DIALOG_BACK 		,DIA_Jergan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Jergan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Jergan_PICKPOCKET_DoIt);
};

func void DIA_Jergan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Jergan_PICKPOCKET);
};
	
func void DIA_Jergan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Jergan_PICKPOCKET);
};














