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
	description = "�Qu� haces rondando por aqu�?";
};

FUNC INT DIA_Jergan_Hallo_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Jergan_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jergan_Hallo_15_00");//�Qu� haces rondando por aqu�?
	AI_Output (self, other,"DIA_Jergan_Hallo_13_01");//Vengo del castillo. Me han enviado a buscar a los que faltan y a revisar el �rea.
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
	description = "�Los que faltan?";
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
	AI_Output (other, self,"DIA_Jergan_Vermisste_15_00");//�Los que faltan?
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_01");//Algunos huyeron al atacar los dragones. La mayor�a de ellos no lo consiguieron, �no es de extra�ar!
	AI_Output (self, other,"DIA_Jergan_Vermisste_13_02");//Pero si hay alg�n superviviente, lo traer� de vuelta.
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
	description = "�Puedes ayudarme a entrar en el castillo?";
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
	AI_Output (other, self,"DIA_Jergan_Burg_15_00");//�Puedes ayudarme a entrar en el castillo?
	AI_Output (self, other,"DIA_Jergan_Burg_13_01");//Claro, pero tienes que hacerme un favor.
	AI_Output (self, other,"DIA_Jergan_Burg_13_02");//Si consigues entrar en el castillo, habla con el palad�n Oric. Dile que su hermano la palm� arriba, en el paso.
	
	Log_CreateTopic (Topic_OricBruder, LOG_MISSION);
	Log_SetTopicStatus (Topic_OricBruder,LOG_RUNNING);
	B_LogEntry (Topic_OricBruder,"Cuando est� en el castillo, tengo que decirle a Oric que su hermano cay� en el paso.");
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
	description = "�Qu� debo saber sobre esta �rea?";
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
		AI_Output (other, self,"DIA_Jergan_Gegend_15_00");//�Qu� debo saber sobre esta �rea?
		AI_Output (self, other,"DIA_Jergan_Gegend_13_01");//Si quieres vivir, regresa al sitio de donde vienes.
		AI_Output (self, other,"DIA_Jergan_Gegend_13_02");//Los pieles verdes llevan semanas asediando el castillo y esos dragones est�n escondidos tambi�n por alg�n sitio.
	};
	AI_Output (self, other,"DIA_Jergan_Gegend_13_03");//Todo el valle de las minas est� infestado de orcos. No importa d�nde vayas, no va a ser un picnic.
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
	description = "�C�mo puedo entrar en el castillo?";
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
	AI_Output (other, self,"DIA_Jergan_Hilfe_15_00");//�C�mo puedo entrar en el castillo?
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_01");//Lo primero de todo, puedes ir olvid�ndote de la ruta directa. Pero si rodeas el castillo, podr�as tener una oportunidad desde atr�s.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_02");//Deber�as mantenerte apartado de los caminos y usar el r�o. Mejor si nadas r�o abajo un poco. Deber�a ser m�s f�cil desde ah�.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_03");//Los orcos han instalado un ariete detr�s del castillo. Puedes entrar por all�. Ac�rcate todo lo que puedas a los orcos y echa a correr.
	AI_Output (self, other,"DIA_Jergan_Hilfe_13_04");//Si eres suficientemente r�pido, podr�as conseguirlo.
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
	description = "�Qu� est�s haciendo aqu�?";
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
	AI_Output (other, self,"DIA_Jergan_Mine_15_00");//�Qu� est�s haciendo aqu�?
	AI_Output (self, other,"DIA_Jergan_Mine_13_01");//Soy un explorador. Vago por el campo. Pero todos esos chasqueadores no me lo han puesto nada f�cil.
	AI_Output (self, other,"DIA_Jergan_Mine_13_02");//Es un buen momento para conseguir unos cuantos trofeos. Siempre que sepas lo que est�s haciendo.
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
	description = "�Puedes ense�arme a hacer eso?";
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
	AI_Output (other, self,"DIA_Jergan_Claw_15_00");//�Puedes ense�arme a hacer eso?
	AI_Output (self, other,"DIA_Jergan_Claw_13_01");//Puedo ense�arte a arrancar las garras de esas cosas una vez muertas.
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
	AI_Output (other, self,"DIA_Jergan_Teach_15_00");//Ens��ame a arrancar garras.
	
	if (B_TeachPlayerTalentTakeAnimalTrophy (self, other, TROPHY_Claws))
	{
		AI_Output (self, other,"DIA_Jergan_Teach_13_01");//Lo importante es arrancar las garras de un tir�n. No dudes demasiado y no andes usando cuchillos.
		AI_Output (self, other,"DIA_Jergan_Teach_13_02");//No solo se arrancan as� las garras de los chasqueadores, tambi�n de lagartos y de bestias de la sombra.
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
	description = "�Sabes d�nde fue Diego?";
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
	AI_Output (other, self,"DIA_Jergan_Diego_15_00");//�Sabes ad�nde fue Diego?
	AI_Output (self, other,"DIA_Jergan_Diego_13_01");//�Diego? Era uno de los raspadores de Silvestro. Pero �ltimamente es dif�cil de ver.
	AI_Output (self, other,"DIA_Jergan_Diego_13_02");//Le vi con dos caballeros y una caja, no muy lejos de aqu�.
	AI_Output (self, other,"DIA_Jergan_Diego_13_03");//Desde aqu� puedes ver la vieja atalaya, �no? Ve hasta all� y luego hacia el castillo.
	AI_Output (self, other,"DIA_Jergan_Diego_13_04");//Hay un camino que pasa entre las rocas hacia la derecha. Se fueron por all�.
};
///////////////////////////////////////////////////////////////////////
//	Rudelf�hrer get�tet
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
	AI_Output (self, other,"DIA_Jergan_Leader_13_00");//As� que mataste al l�der del grupo. �Y le quitaste las garras a esa bestia?
	
	if (Npc_HasItems (other, ItAt_ClawLeader) >= 1)
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_01");//S�.
		AI_Output (self, other,"DIA_Jergan_Leader_13_02");//Seguro que valen un mont�n. Hay tipos que coleccionan esas cosas.
		AI_Output (self, other,"DIA_Jergan_Leader_13_03");//Si encuentras al comprador adecuado, obtendr�s una pila de oro por ellas.
	}
	else
	{
		AI_Output (other, self,"DIA_Jergan_Leader_15_04");//No.
		AI_Output (self, other,"DIA_Jergan_Leader_13_05");//Deber�as hacerlo. Estoy seguro de que valen una fortuna.
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














