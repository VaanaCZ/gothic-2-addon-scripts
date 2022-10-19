///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
var int Brahim_ShowedMaps;
FUNC VOID B_BrahimNewMaps ()
{
	if (Brahim_ShowedMaps == TRUE)
	{
		AI_Output			(self, other, "B_BrahimNewMaps_07_00"); //Vuelve m�s tarde. Seguro que entonces tendr� algo nuevo para ti.
	};
};
INSTANCE DIA_Brahim_EXIT   (C_INFO)
{
	npc         = VLK_437_Brahim;
	nr          = 999;
	condition   = DIA_Brahim_EXIT_Condition;
	information = DIA_Brahim_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Brahim_EXIT_Condition()
{
	if (Kapitel <= 2)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Brahim_EXIT_Info()
{
	B_BrahimNewMaps ();
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Brahim_PICKPOCKET (C_INFO)
{
	npc			= VLK_437_Brahim;
	nr			= 900;
	condition	= DIA_Brahim_PICKPOCKET_Condition;
	information	= DIA_Brahim_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_20;
};                       

FUNC INT DIA_Brahim_PICKPOCKET_Condition()
{
	C_Beklauen (15, 15);
};
 
FUNC VOID DIA_Brahim_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Brahim_PICKPOCKET);
	Info_AddChoice		(DIA_Brahim_PICKPOCKET, DIALOG_BACK 		,DIA_Brahim_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Brahim_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Brahim_PICKPOCKET_DoIt);
};

func void DIA_Brahim_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Brahim_PICKPOCKET);
};
	
func void DIA_Brahim_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Brahim_PICKPOCKET);
};
///////////////////////////////////////////////////////////////////////
//	Info GREET
///////////////////////////////////////////////////////////////////////
instance DIA_Brahim_GREET		(C_INFO)
{
	npc			 = 	VLK_437_Brahim;
	nr			 = 	2;
	condition	 = 	DIA_Brahim_GREET_Condition;
	information	 = 	DIA_Brahim_GREET_Info;
	permanent	 =  FALSE;
	description	 = 	"�Qu� est�s haciendo aqu�?";
};
func int DIA_Brahim_GREET_Condition ()
{
	return TRUE;
};
func void DIA_Brahim_GREET_Info ()
{
	AI_Output (other, self, "DIA_Brahim_GREET_15_00"); //�Qu� est�s haciendo aqu�?
	AI_Output (self, other, "DIA_Brahim_GREET_07_01"); //Me llamo Brahim. Dibujo mapas y los vendo.
	AI_Output (self, other, "DIA_Brahim_GREET_07_02"); //Como eres nuevo aqu�, quiz� te vendr�a bien un mapa de la ciudad.
	AI_Output (self, other, "DIA_Brahim_GREET_07_03"); //Es bastante barato, y muy �til hasta que aprendas a orientarte.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Brahim dibuja y vende mapas cerca del puerto.");
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Brahim_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_437_Brahim;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Brahim_MissingPeople_Condition;
	information	 = 	DIA_Addon_Brahim_MissingPeople_Info;

	description	 = 	"�Es cierto que ha desaparecido gente, sin m�s?";
};

func int DIA_Addon_Brahim_MissingPeople_Condition ()
{
	if (SC_HearedAboutMissingPeople == TRUE)
	&& (ENTERED_ADDONWORLD == FALSE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Brahim_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Brahim_MissingPeople_15_00"); //�Es cierto que ha desaparecido gente, sin m�s?
	AI_Output	(self, other, "DIA_Addon_Brahim_MissingPeople_07_01"); //Eso he o�do. Pero no tengo muy claro si es verdad.
	AI_Output	(self, other, "DIA_Addon_Brahim_MissingPeople_07_02"); //Echa un vistazo. �Este agujero de ratas te parece el t�pico lugar al que vendr�as a pasar tus mejores a�os?
	AI_Output	(self, other, "DIA_Addon_Brahim_MissingPeople_07_03"); //No me extra�a que la gente se est� largando.
};

///////////////////////////////////////////////////////////////////////
//	Info Perm
///////////////////////////////////////////////////////////////////////
/*
instance DIA_Brahim_Perm		(C_INFO)
{
	npc			 = 	VLK_437_Brahim;
	nr			 = 	99;
	condition	 = 	DIA_Brahim_Perm_Condition;
	information	 = 	DIA_Brahim_Perm_Info;
	permanent	 =  TRUE;
	description	 = 	"";
};
func int DIA_Brahim_Perm_Condition ()
{	
	
	{
		return TRUE;
	};
};
func void DIA_Brahim_Perm_Info ()
{
	AI_Output (other, self, "DIA_Brahim_Perm_15_00"); //
	AI_Output (self, other, "DIA_Brahim_Perm_07_01"); //
};
*/
///////////////////////////////////////////////////////////////////////
//	Info BUY
///////////////////////////////////////////////////////////////////////
instance DIA_Brahim_BUY		(C_INFO)
{
	npc			 = 	VLK_437_Brahim;
	nr			 = 	9;
	condition	 = 	DIA_Brahim_BUY_Condition;
	information	 = 	DIA_Brahim_BUY_Info;
	permanent 	 =  TRUE;
	trade 		 =  TRUE;
	description	 = 	"Ens��ame tus mapas.";
};

func int DIA_Brahim_BUY_Condition ()
{	
	if Npc_KnowsInfo (hero,DIA_Brahim_GREET)
	{
		return TRUE;
	};
};
func void DIA_Brahim_BUY_Info ()
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Brahim_BUY_15_00"); //Ens��ame tus mapas.
	
	if (hero.guild == GIL_KDF)
	{
		AI_Output (self ,other, "DIA_Brahim_BUY_07_01"); //No encontrar�s nada mejor en ese monasterio tuyo.
	};
	if (hero.guild == GIL_PAL)
	{
		AI_Output (self ,other, "DIA_Brahim_BUY_07_02"); //Los buenos mapas son importantes. Especialmente para la gente que llega del continente, Sr. Palad�n.
	};
	Brahim_ShowedMaps = TRUE;
};

//######################################
//##
//##	Kapitel 3
//##
//######################################

///////////////////////////////////////////////////////////////////////
//	Info Kap3_EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Brahim_Kap3_EXIT   (C_INFO)
{
	npc         = VLK_437_Brahim;
	nr          = 999;
	condition   = DIA_Brahim_Kap3_EXIT_Condition;
	information = DIA_Brahim_Kap3_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Brahim_Kap3_EXIT_Condition()	//siehe auch First Exit
{
	if (Kapitel >= 3)
	&& ((Npc_KnowsInfo (other,DIA_Brahim_Kap3_First_EXIT))
	|| (Npc_HasItems (other,ItWr_ShatteredGolem_MIS) == 0))
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Brahim_Kap3_EXIT_Info()
{
	if (Kapitel <= 4)
	{
		B_BrahimNewMaps ();
	};
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Kap3_First_EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Brahim_Kap3_First_EXIT   (C_INFO)
{
	npc         = VLK_437_Brahim;
	nr          = 999;
	condition   = DIA_Brahim_Kap3_First_EXIT_Condition;
	information = DIA_Brahim_Kap3_First_EXIT_Info;
	permanent   = FALSE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Brahim_Kap3_First_EXIT_Condition()
{
	if (Kapitel >= 3)
	&& (Npc_HasItems (other,ItWr_ShatteredGolem_MIS) >=1)
	{
		return TRUE;
	};	
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_Info()
{
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_07_00"); //Sab�a que �ste te interesar�a.
	AI_Output (other,self ,"DIA_Brahim_Kap3_First_EXIT_15_01"); //�A cu�l te refieres?
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_07_02"); //Bueno, ese viejo mapa que acabas de comprar.
	AI_Output (self, other,"DIA_Brahim_Kap3_First_EXIT_07_03"); //Conozco a los de tu cala�a. No dejas escapar una oportunidad de encontrar tesoros.
	Info_ClearChoices (DIA_Brahim_Kap3_First_EXIT);
	Info_AddChoice (DIA_Brahim_Kap3_First_EXIT,DIALOG_BACK,DIA_Brahim_Kap3_First_EXIT_BACK);
	Info_AddChoice (DIA_Brahim_Kap3_First_EXIT,"�D�nde has conseguido ese documento?",DIA_Brahim_Kap3_First_EXIT_WhereGetIt);
	Info_AddChoice (DIA_Brahim_Kap3_First_EXIT,"�Qu� tipo de documento es ese?",DIA_Brahim_Kap3_First_EXIT_Content);
	Info_AddChoice (DIA_Brahim_Kap3_First_EXIT,"�Por qu� no te lo quedas?",DIA_Brahim_Kap3_First_EXIT_KeepIt);
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_BACK ()
{
	Info_ClearChoices (DIA_Brahim_Kap3_First_EXIT);
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_WhereGetIt ()
{
	AI_Output (other,self ,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_15_00"); //�De d�nde sacaste este mapa?
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_01"); //Oh, lo encontr� entre una pila de mapas que compr� recientemente.
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_WhereGetIt_07_02"); //Se le debi� de traspapelar al vendedor.
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_Content ()
{
	AI_Output (other,self ,"DIA_Brahim_Kap3_First_EXIT_Content_15_00"); //�Qu� clase de mapa es?
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_01"); //Parece ser un mapa del tesoro o algo as�.
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_Content_07_02"); //Pero me pareces la clase de persona que llegar� al fondo de este asunto.
};

FUNC VOID DIA_Brahim_Kap3_First_EXIT_KeepIt()
{
	AI_Output (other,self ,"DIA_Brahim_Kap3_First_EXIT_KeepIt_15_00"); //�Por qu� no te lo quedas?
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_01"); //Soy un hombre viejo y ya hace mucho que pas� la �poca en la que sal�a de viaje.
	AI_Output (self ,other,"DIA_Brahim_Kap3_First_EXIT_KeepIt_07_02"); //Se lo dejo a los j�venes.
};


