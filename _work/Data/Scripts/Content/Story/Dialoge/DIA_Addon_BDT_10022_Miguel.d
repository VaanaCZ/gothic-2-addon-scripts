//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_EXIT   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 999;
	condition   = DIA_Addon_Miguel_EXIT_Condition;
	information = DIA_Addon_Miguel_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Addon_Miguel_PICKPOCKET (C_INFO)
{
	npc			= BDT_10022_Addon_Miguel;
	nr			= 900;
	condition	= DIA_Addon_Miguel_PICKPOCKET_Condition;
	information	= DIA_Addon_Miguel_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Miguel_PICKPOCKET_Condition()
{
	C_Beklauen (40, 48);
};
 
FUNC VOID DIA_Addon_Miguel_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Miguel_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Miguel_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Miguel_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Miguel_PICKPOCKET_DoIt);
};

func void DIA_Addon_Miguel_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
	
func void DIA_Addon_Miguel_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Miguel_PICKPOCKET);
};
//---------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Hi   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 1;
	condition   = DIA_Addon_Miguel_Hi_Condition;
	information = DIA_Addon_Miguel_Hi_Info;
	permanent   = FALSE;
	description = "¿Qué estás haciendo aquí?";
};
FUNC INT DIA_Addon_Miguel_Hi_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Hi_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_00");//¿Qué estás haciendo aquí?
	
	if Wld_IsTime (06,00,22,00)
	{
		AI_Output (other, self, "DIA_Addon_Miguel_Hi_15_01");//¿Buscas algo?
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_02");//Plantas. Estoy buscando plantas.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_03");//Suelo buscar plantas.
	};
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_04");//Casi todo lo que crece aquí sirve para algo.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_05");//Muchas plantas tienen propiedades curativas, puedes fumar cigarros de hierba del pantano.
	AI_Output (self, other, "DIA_Addon_Miguel_Hi_11_06");//Antes de mis días tras la Barrera, trabajé como alquimista.
};
//---------------------------------------------------------------------
//	Info Story
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Story   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 2;
	condition   = DIA_Addon_Miguel_Story_Condition;
	information = DIA_Addon_Miguel_Story_Info;
	permanent   = FALSE;
	description = "¿Por qué te han dejado al otro lado de la Barrera?";
};
FUNC INT DIA_Addon_Miguel_Story_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Miguel_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Story_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Story_15_00");//¿Por qué te trajeron al otro lado de la Barrera?
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_01");//Trabajaba con muchas pociones que alteraban la mente.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_02");//Una tarde, mi maestro Ignaz se bebió mi experimento en vez su vino.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_03");//Eso lo volvió temporalmente… eh… impredecible, y desde entonces se encuentra confuso.
	AI_Output (self, other, "DIA_Addon_Miguel_Story_11_04");//(maliciosamente) Los magos me desterraron por ello tras la Barrera. Por 'experimentar con conocimientos prohibidos', según ellos.
};

//---------------------------------------------------------------------
//	LAGER
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Lager   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 3;
	condition   = DIA_Addon_Miguel_Lager_Condition;
	information = DIA_Addon_Miguel_Lager_Info;
	permanent   = FALSE;
	description = "¿Qué puedes contarme sobre el campamento?";
};
FUNC INT DIA_Addon_Miguel_Lager_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Miguel_Lager_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Lager_15_00"); //¿Qué puedes contarme sobre el campamento?
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_01"); //No mucho. Yo nunca he ido.
	AI_Output (self, other, "DIA_Addon_Miguel_Lager_11_02"); //Sólo la gente de Raven lleva allí desde el principio. Los que vinieron luego, como yo, tienen que esperar hasta que necesiten más personal.
};

//-----------------------------------------
//	Woher
//-----------------------------------------
instance DIA_Addon_Miguel_WhereFrom (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_WhereFrom_Condition;
	information = DIA_Addon_Miguel_WhereFrom_Info;
	permanent   = FALSE;
	description = "¿De dónde vienes tú?";
};
FUNC INT DIA_Addon_Miguel_WhereFrom_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Hi)
	|| Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_WhereFrom_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_00"); //¿De dónde vienes tú?
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_01"); //Pues del mismo lugar que tú, supongo. Del mar, con los piratas.
	AI_Output (self, other, "DIA_Addon_Miguel_WhereFrom_11_02"); //Este valle está completamente aislado. No hay conexión con el resto de territorios.
	AI_Output (other, self, "DIA_Addon_Miguel_WhereFrom_15_03"); //(pensativo) Cierto.
};

//-----------------------------------------
//	Angefordert
//-----------------------------------------
instance DIA_Addon_Miguel_Angefordert (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 4;
	condition   = DIA_Addon_Miguel_Angefordert_Condition;
	information = DIA_Addon_Miguel_Angefordert_Info;
	permanent   = FALSE;
	description = "¿Cuándo necesitan gente nueva?";
};
FUNC INT DIA_Addon_Miguel_Angefordert_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Lager)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Angefordert_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Angefordert_15_00"); //¿Cuándo necesitan gente nueva?
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_01"); //Bueno, pues cuando pierden personal.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_02"); //Si un reptador de las minas devora a un cavador, entra otro a sustituirle.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_03"); //A veces también se matan entre ellos. Pero últimamente ya no tanto.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_04"); //Raven ha controlado el acceso a la mina, así que ahora no puede pasar quien quiera a la vez.
	AI_Output (self, other, "DIA_Addon_Miguel_Angefordert_11_05"); //Pero no sé exactamente cómo funciona. Nunca he entrado.
};

//---------------------------------------------------------------------
//	Info Fortuno
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_Fortuno   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 6;
	condition   = DIA_Addon_Miguel_Fortuno_Condition;
	information = DIA_Addon_Miguel_Fortuno_Info;
	permanent   = FALSE;
	description = "Sobre Fotuno…";
};
FUNC INT DIA_Addon_Miguel_Fortuno_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Fortuno_FREE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_Fortuno_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_00");//Fortuno está bastante confuso y necesitaría una poción para recuperar su memoria.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_01");//¿Fortuno? Es siervo de Raven, ¿no?
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_02");//Era. Ahora sólo es un lunático. Y por culpa de Raven.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_03");//¿Raven? Hasta ahora, lo tenía bien considerado. Hm, de acuerdo. Pero aquí, en el pantano, no puedo preparar pociones.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_04");//Podría preparar la poción. Hay una mesa de trabajo de alquimista en el campamento. Sólo necesito la fórmula.
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_05");//Cuidado con esta fórmula. Prepararla es peligroso.
	B_GiveInvItems (self, other, ITWr_Addon_MCELIXIER_01,1);
	AI_Output (self, other, "DIA_Addon_Miguel_Fortuno_11_06");//Si algo sale mal en la preparación o confundes uno de los ingredientes, la poción es mortal.
	AI_Output (other, self, "DIA_Addon_Miguel_Fortuno_15_07");//Tendré cuidado.
	
	B_LogEntry (Topic_Addon_Fortuno,"Miguel me ha dado la fórmula de una poción que ayudará a recordar a Fortuno. Sólo debo prepararla cuando esté familiarizado con todos los ingredientes. Si no, puede ser letal.");
};

//---------------------------------------------------------------------
//	Info BRAU
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_BRAU   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 7;
	condition   = DIA_Addon_Miguel_BRAU_Condition;
	information = DIA_Addon_Miguel_BRAU_Info;
	permanent   = FALSE;
	description = "¿Puedes enseñarme algo?";
};
FUNC INT DIA_Addon_Miguel_BRAU_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_Story)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_BRAU_Info()
{
	AI_Output (other, self, "DIA_Addon_Miguel_BRAU_15_00");//¿Puedes enseñarme algo?
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_01");//No tengo tiempo. He venido a conseguir oro. Y mientras no pueda entrar al campamento, tengo que vivir de vender mis hierbas.
	AI_Output (self, other, "DIA_Addon_Miguel_BRAU_11_02");//Pero si necesitas pociones, aún me quedan algunas.
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Puedo comprarle pociones y plantas a Miguel.");
};

//---------------------------------------------------------------------
//	Info trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Miguel_trade   (C_INFO)
{
	npc         = BDT_10022_Addon_Miguel;
	nr          = 888;
	condition   = DIA_Addon_Miguel_trade_Condition;
	information = DIA_Addon_Miguel_trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Miguel_trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Addon_Miguel_BRAU)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Miguel_trade_Info()
{
	B_Say (other,self,"$TRADE_1");
	B_GiveTradeInv(self);
};



