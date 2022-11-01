//**************************************************************************
//	Info EXIT 
//**************************************************************************
INSTANCE DIA_Garwig_EXIT   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 999;
	condition   = DIA_Garwig_EXIT_Condition;
	information = DIA_Garwig_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Garwig_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Garwig_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// *************************************************************************
// 							Wurst verteilen
// *************************************************************************
INSTANCE DIA_Garwig_Wurst(C_INFO)
{
	npc         = Nov_608_Garwig;
	nr			= 3;
	condition	= DIA_Garwig_Wurst_Condition;
	information	= DIA_Garwig_Wurst_Info;
	permanent	= FALSE;
	description = "¿Te apetece algo de embutido?";
};                       

FUNC INT DIA_Garwig_Wurst_Condition()
{
	if (Kapitel == 1)
	&& (MIS_GoraxEssen == LOG_RUNNING)
	&& (Npc_HasItems (self, ItFo_SchafsWurst ) == 0)
	&& (Npc_HasItems (other, ItFo_SchafsWurst ) >= 1)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Garwig_Wurst_Info()
{	
	AI_Output (other, self, "DIA_Garwig_Wurst_15_00"); //¿Te apetece una salchicha?
	AI_Output (self, other, "DIA_Garwig_Wurst_06_01"); //¡Ah, qué rica! Muchas gracias, hermano.
	
	B_GiveInvItems (other, self, ItFo_SchafsWurst, 1);
	Wurst_Gegeben = (Wurst_Gegeben +1);
	
	CreateInvItems (self, ITFO_Sausage,1);
	B_UseItem (self, ITFO_Sausage);
	
	var string NovizeText;
	var string NovizeLeft;
	NovizeLeft = IntToString (13 - Wurst_Gegeben);
	NovizeText = ConcatStrings(NovizeLeft, PRINT_NovizenLeft);
	AI_PrintScreen	(NovizeText, -1, YPOS_GOLDGIVEN, FONT_ScreenSmall, 2);
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Garwig_Hello   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 3;
	condition   = DIA_Garwig_Hello_Condition;
	information = DIA_Garwig_Hello_Info;
	permanent   = FALSE;
	important 	= TRUE;
};
FUNC INT DIA_Garwig_Hello_Condition()
{	
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Garwig_Hello_Info()
{
	AI_Output (self ,other,"DIA_Garwig_Hello_06_00"); //Que Innos sea contigo. No te había visto nunca, ¿eres nuevo?
	AI_Output (other ,self,"DIA_Garwig_Hello_15_01"); //Sí, acabo de ingresar.
	AI_Output (self ,other,"DIA_Garwig_Hello_06_02"); //En ese caso, espero que te adaptes rápido. Hazme saber si puedo ayudarte con algo.
};
//**************************************************************************
//	Info Hello 
//**************************************************************************
INSTANCE DIA_Garwig_Room   (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 5;
	condition   = DIA_Garwig_Room_Condition;
	information = DIA_Garwig_Room_Info;
	permanent   = FALSE;
	description	= "¿Qué habitación es ésta?";
};
FUNC INT DIA_Garwig_Room_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Garwig_Room_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Room_15_00"); //¿Que habitación es ésta?
	AI_Output (self ,other,"DIA_Garwig_Room_06_01"); //Aquí es donde se guardan las sagradas reliquias del monasterio.
	AI_Output (other,self ,"DIA_Garwig_Room_15_02"); //¿Qué reliquias?
	AI_Output (self ,other,"DIA_Garwig_Room_06_03"); //Aquí se guarda el martillo de Innos, junto con el escudo de fuego. Son las reliquias más importantes de la iglesia de Innos, si excluimos las de la capital.
};
//**************************************************************************
//	Info Hammer 
//**************************************************************************
INSTANCE DIA_Garwig_Hammer  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 99;
	condition   = DIA_Garwig_Hammer_Condition;
	information = DIA_Garwig_Hammer_Info;
	permanent   = TRUE;
	description	= "Háblame del martillo.";
};
FUNC INT DIA_Garwig_Hammer_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garwig_Room))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Hammer_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Hammer_15_00"); //Háblame del martillo.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_01"); //Es el sagrado martillo de Innos. Con este martillo, san Rhobar exterminó al centinela de piedra.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_02"); //Las sagradas escrituras dicen que el centinela de piedra era invulnerable. En la batalla era como una torre y las armas de los enemigos se aplastaban contra su piel de piedra.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_03"); //Con el nombre de Innos en sus labios, Rhobar se lanzó contra el monstruo y lo aplastó con un poderoso golpe de su martillo.
};
//**************************************************************************
//	Info Schild 
//**************************************************************************
INSTANCE DIA_Garwig_Shield  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 98;
	condition   = DIA_Garwig_Shield_Condition;
	information = DIA_Garwig_Shield_Info;
	permanent   = FALSE;
	description	= "Háblame del escudo.";
};
FUNC INT DIA_Garwig_Shield_Condition()
{
	if (Npc_KnowsInfo (other,DIA_Garwig_Room))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Shield_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Shield_15_00"); //Háblame del escudo.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_01"); //El escudo de fuego es el que llevó Dominique en la batalla de las Islas del Sur.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_02"); //Pero el poder del escudo no debe volverse a desencadenar. Por eso está clavado a la pared.
};
//**************************************************************************
//	Info Auge Innos
//**************************************************************************
INSTANCE DIA_Garwig_Auge  (C_INFO)
{
	npc         = Nov_608_Garwig;
	nr          = 4;
	condition   = DIA_Garwig_Auge_Condition;
	information = DIA_Garwig_Auge_Info;
	permanent   = FALSE;
	description	= "Aquí también está el Ojo de Innos, ¿verdad?";
};
FUNC INT DIA_Garwig_Auge_Condition()
{
	if Npc_KnowsInfo (other,DIA_Garwig_Room)
	&& (Kapitel <= 2)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Garwig_Auge_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Auge_15_00"); //Aquí también está el Ojo de Innos, ¿verdad?
	AI_Output (self ,other,"DIA_Garwig_Auge_06_01"); //Claro que no. Qué idea más rara. Nadie sabe dónde está ese artefacto divino.
};
///////////////////////////////////////////////////////////////////////
//	Info SLEEP
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_SLEEP		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	23;
	condition	 = 	DIA_Garwig_SLEEP_Condition;
	information	 = 	DIA_Garwig_SLEEP_Info;
	permanent	 = 	TRUE;
	description	 = 	"¿Qué estás haciendo aquí?";
};
func int DIA_Garwig_SLEEP_Condition ()
{
	if (other.guild == GIL_NOV)
	{
		return TRUE;
	};	
};
func void DIA_Garwig_SLEEP_Info ()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_15_00"); //¿Qué haces aquí?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_06_01"); //Soy el guardián de los artefactos sagrados.
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice 		(DIA_Garwig_SLEEP,DIALOG_BACK,DIA_Garwig_SLEEP_BACK);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"¿Te puedo sustituir un rato?",DIA_Garwig_SLEEP_EXCHANGE);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"¿Por qué se vigilan los artefactos?",DIA_Garwig_SLEEP_THIEF);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"¿No duermes nunca?",DIA_Garwig_SLEEP_NEVER);
};
FUNC VOID DIA_Garwig_SLEEP_BACK()
{
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
};
FUNC VOID DIA_Garwig_SLEEP_EXCHANGE()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_EXCHANGE_15_00"); //¿Te puedo sustituir un rato?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_01"); //¿Es una prueba? Los magos te han mandado para probarme, ¿verdad? ¡Oh, lo sabía!
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_02"); //Pero superaré la prueba. Diles a los magos que soy firme como una roca y que resistiré todas las tentaciones, porque soy un guardián responsable.
};
FUNC VOID DIA_Garwig_SLEEP_THIEF()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_THIEF_15_00"); //¿Por qué se vigilan los artefactos? ¿Hay alguna razón por la que teman que sean robados?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_01"); //Qué idea más original. ¿Qué te hace pensar eso?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_02"); //Solo los que sirven a Innos están autorizados a poner el pie en este monasterio y a ningún creyente de verdad se le ocurriría algo así.
};
FUNC VOID DIA_Garwig_SLEEP_NEVER()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_NEVER_15_00"); //¿No duermes nunca?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_01"); //Una observación de lo más inusual. Claro que nunca duermo. Innos en persona me da el poder que me permite vencer al sueño.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_02"); //Si no, ¿cómo podría cumplir con los deberes sagrados de la guardia?
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice (DIA_Garwig_SLEEP,"¿De verdad que NUNCA duermes?",DIA_Garwig_SLEEP_AGAIN);
};
FUNC VOID DIA_Garwig_SLEEP_AGAIN()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_AGAIN_15_00"); //¿De verdad que NUNCA duermes?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_01"); //No. Si un guardián se duerme, ha fallado.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_02"); //Pero no fallaré, ya que Innos me proporciona fuerza y resistencia y nunca me cansaré.
	
	
};
///////////////////////////////////////////////////////////////////////
//	Info THIEF Der Hammer ist nicht mehr da
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_THIEF		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	2;
	condition	 = 	DIA_Garwig_THIEF_Condition;
	information	 = 	DIA_Garwig_THIEF_Info;
	permanent	 =  TRUE;
	important 	 = 	TRUE;
};
func int DIA_Garwig_THIEF_Condition ()
{	
	if  (Npc_IsInState (self, ZS_Talk))
	&&  (Npc_HasItems (hero, Holy_Hammer_MIS) == 1)
	{
		return TRUE;
	};
};
func void DIA_Garwig_THIEF_Info ()
{		
					
	if (Hammer_Taken == TRUE) 
	{ 
		AI_Output (self, other, "DIA_Garwig_THIEF_06_00"); //(Alterado) ¡Ladrón! ¡No solo nos has deshonrado a ti y a mí, sino a todo el monasterio!
		AI_Output (self, other, "DIA_Garwig_THIEF_06_01"); //Tendrás que expiar este sacrilegio. Y, antes de nada, ¡¡DEVUÉLVEME ESE MARTILLO!!
		
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_THIEF_06_02"); //(Desesperado) El martillo ha desaparecido, ¿cómo ha podido pasar?
		AI_Output (self, other, "DIA_Garwig_THIEF_06_03"); //He fallado. ¡Innos me castigará!
	};	
};
///////////////////////////////////////////////////////////////////////
//	Info Hammer zurückbringen (immer wenn Spieler den Hammer hat)
///////////////////////////////////////////////////////////////////////
instance DIA_Garwig_Abgeben		(C_INFO)
{
	npc			 = 	Nov_608_Garwig;
	nr			 = 	2;
	condition	 = 	DIA_Garwig_Abgeben_Condition;
	information	 = 	DIA_Garwig_Abgeben_Info;
	permanent	 = 	TRUE;
	description	 =  "Traigo el martillo.";
};
func int DIA_Garwig_Abgeben_Condition ()
{	
	if (Npc_HasItems (other, Holy_Hammer_MIS) >= 1)
	{
		return TRUE;
	};
};
func void DIA_Garwig_Abgeben_Info ()
{
	AI_Output (other, self, "DIA_Garwig_Abgeben_15_00"); //Traigo el martillo.
	
	if (Hammer_Taken == TRUE)
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_01"); //¡Eres un despreciable ladrón!
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_02"); //Así que fuiste tú el que lo cogió...
	};
	AI_Output (self, other, "DIA_Garwig_Abgeben_06_03"); //Pero juzgarte no es asunto mío. Innos hará justicia contigo ¡y recibirás su castigo!
	
	B_GiveInvItems (other,self, Holy_Hammer_MIS,1);
	Hammer_Taken = FALSE;
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Garwig_PICKPOCKET (C_INFO)
{
	npc			= Nov_608_Garwig;
	nr			= 900;
	condition	= DIA_Garwig_PICKPOCKET_Condition;
	information	= DIA_Garwig_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Garwig_PICKPOCKET_Condition()
{
	C_Beklauen (52, 80);
};
 
FUNC VOID DIA_Garwig_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Garwig_PICKPOCKET);
	Info_AddChoice		(DIA_Garwig_PICKPOCKET, DIALOG_BACK 		,DIA_Garwig_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Garwig_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Garwig_PICKPOCKET_DoIt);
};

func void DIA_Garwig_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Garwig_PICKPOCKET);
};
	
func void DIA_Garwig_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Garwig_PICKPOCKET);
};















