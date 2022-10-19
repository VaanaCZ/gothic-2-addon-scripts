///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Coragon_EXIT   (C_INFO)
{
	npc         = VLK_420_Coragon;
	nr          = 999;
	condition   = DIA_Coragon_EXIT_Condition;
	information = DIA_Coragon_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Coragon_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Coragon_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Coragon_PICKPOCKET (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr			= 900;
	condition	= DIA_Coragon_PICKPOCKET_Condition;
	information	= DIA_Coragon_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Coragon_PICKPOCKET_Condition()
{
	C_Beklauen (40, 45);
};
 
FUNC VOID DIA_Coragon_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Coragon_PICKPOCKET);
	Info_AddChoice		(DIA_Coragon_PICKPOCKET, DIALOG_BACK 		,DIA_Coragon_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Coragon_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Coragon_PICKPOCKET_DoIt);
};

func void DIA_Coragon_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Coragon_PICKPOCKET);
};
	
func void DIA_Coragon_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Coragon_PICKPOCKET);
};

// *********************************************************
// 							Hallo
// *********************************************************
instance DIA_Coragon_HALLO		(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  2;
	condition	 = 	DIA_Coragon_HALLO_Condition;
	information	 = 	DIA_Coragon_HALLO_Info;
	permanent    =  FALSE;
	description	 = 	"�Puedo beber algo aqu�?";
};

func int DIA_Coragon_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Coragon_HALLO_Info ()
{
	AI_Output (other, self, "DIA_Coragon_HALLO_15_00"); //�Puedo beber algo aqu�?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_00"); //Si tienes oro, hasta puedes comer aqu�, si quieres.
	
	Log_CreateTopic (Topic_CityTrader,LOG_NOTE);
	B_LogEntry (Topic_CityTrader,"Puedo comprar comida y bebida a Coragon, el posadero.");
};

// *********************************************************
// 							Trade
// *********************************************************
instance DIA_Coragon_Trade		(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  2;
	condition	 = 	DIA_Coragon_Trade_Condition;
	information	 = 	DIA_Coragon_Trade_Info;
	permanent    =  TRUE;
	description	 = 	"Ens��ame tu mercanc�a.";
	trade 		 =  TRUE;
};
func int DIA_Coragon_Trade_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Trade_Info () //FIXME_FILER NOCH ESSEN IN INV
{
	B_GiveTradeInv (self);
	AI_Output (other, self, "DIA_Coragon_Trade_15_00"); //Ens��ame tu mercanc�a.
};

// *********************************************************
// 							WhatsUp
// *********************************************************
instance DIA_Coragon_WhatsUp	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  3;
	condition	 = 	DIA_Coragon_WhatsUp_Condition;
	information	 = 	DIA_Coragon_WhatsUp_Info;
	permanent    =  FALSE;
	description	 = 	"�Y c�mo va el negocio?";
	
};
func int DIA_Coragon_WhatsUp_Condition ()
{	
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	{
		return TRUE;
	};
};
func void DIA_Coragon_WhatsUp_Info ()
{
	AI_Output (other, self, "DIA_Coragon_Gelaber_15_00"); //�Y c�mo va el negocio?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_01"); //Ah, no me lo recuerdes. Lord Andre sirve cerveza gratis en la plaza de la horca.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_02"); //Casi nadie viene aqu�, excepto los ricos del barrio alto.
	AI_Output (other, self, "DIA_Coragon_Add_15_03"); //�Qu� tienen de malo?
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_04"); //(r�e) A algunos de esos arrogantes no hay quien los aguante.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_05"); //Valentino, por ejemplo, me pongo enfermo s�lo con verlo.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_06"); //Pero no puedo escoger a mis clientes. Necesito todo el dinero que pueda ganar.
	AI_Output (self ,other, "DIA_ADDON_NEW_Coragon_Add_09_07"); //Lo poco que hab�a conseguido ahorrar me lo han robado, junto con toda mi plata.
};

///////////////////////////////////////////////////////////////////////
//	Info MissingPeople
///////////////////////////////////////////////////////////////////////
instance DIA_Addon_Coragon_MissingPeople		(C_INFO)
{
	npc		 = 	VLK_420_Coragon;
	nr		 = 	5;
	condition	 = 	DIA_Addon_Coragon_MissingPeople_Condition;
	information	 = 	DIA_Addon_Coragon_MissingPeople_Info;

	description	 = 	"H�blame de los aldeanos desaparecidos.";
};

func int DIA_Addon_Coragon_MissingPeople_Condition ()
{
	if Npc_KnowsInfo (other, DIA_Coragon_HALLO)
	&& (SC_HearedAboutMissingPeople == TRUE)
		{
			return TRUE;
		};
};

func void DIA_Addon_Coragon_MissingPeople_Info ()
{
	AI_Output	(other, self, "DIA_Addon_Coragon_MissingPeople_15_00"); //H�blame de los aldeanos desaparecidos.
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_01"); //�He o�do que muchos desaparecieron en el puerto. No me extra�a, con todo lo que ocurre por all�. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_02"); //�Hasta Thorben, el carpintero de la parte baja de la ciudad, ha perdido a su aprendiz.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_03"); //�Hakon, uno de los mercaderes del mercado, cuenta una historia especialmente extra�a. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_04"); //�Dec�a que ten�a un amigo con el que sol�a encontrarse a diario, hasta que un d�a desapareci� de repente de la faz de la tierra. Incluso acudi� a la milicia a preguntar por �l. 
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_05"); //�Despu�s de eso, los ciudadanos se asustaron much�simo. No s� ni qu� pensar. Todo es absurdo.  
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_06"); //�Khorinis es una ciudad inh�spita y tras sus puertas acechan muchos peligros.   
	AI_Output	(self, other, "DIA_Addon_Coragon_MissingPeople_09_07"); //Los que osan atravesar sus murallas sufren ataques de bandidos o acaban devorados por bestias salvajes. As� de simple.  
	
	Log_CreateTopic (TOPIC_Addon_WhoStolePeople, LOG_MISSION);
	Log_SetTopicStatus(TOPIC_Addon_WhoStolePeople, LOG_RUNNING);
	B_LogEntry (TOPIC_Addon_WhoStolePeople,"Hakon, comerciante del mercado, y el carpintero Thorben deben de saber algo sobre la gente desaparecida."); 
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_Bestohlen	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  4;
	condition	 = 	DIA_Coragon_Bestohlen_Condition;
	information	 = 	DIA_Coragon_Bestohlen_Info;
	permanent    =  FALSE;
	description	 = 	"�Alguien te ha robado?";
	
};
func int DIA_Coragon_Bestohlen_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};
func void DIA_Coragon_Bestohlen_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_08"); //�Te han robado?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_09"); //S�, hace alg�n tiempo. Esa noche ten�a mucho trabajo y estaba sirviendo una ronda de cerveza.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_10"); //No me fui mucho tiempo de la barra, pero fue suficiente para esos bastardos.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_11"); //Acud� a la milicia para pedirles su ayuda, pero no encontraron nada, por supuesto. Prefieren ponerse ciegos de cerveza gratis.
	
	MIS_Coragon_Silber = LOG_RUNNING;
};


// **************
// B_Coragon_Bier
// **************

var int Coragon_Bier;
// ------------------	
	
func void B_Coragon_Bier()
{
	Coragon_Bier = Coragon_Bier + 1;
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_14"); //Toma, como recompensa.
	B_GiveInvItems (self, other, ItFo_CoragonsBeer, 1);
	
	if (Coragon_Bier < 2)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_21"); //Una cerveza muy especial. Es mi �ltimo barril.
	}
	else
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_22"); //�La �ltima gota!
	};
};

// *********************************************************
// 							Bestohlen
// *********************************************************
instance DIA_Coragon_BringSilber	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  5;
	condition	 = 	DIA_Coragon_BringSilber_Condition;
	information	 = 	DIA_Coragon_BringSilber_Info;
	permanent    =  FALSE;
	description	 = 	"Tengo tu plata.";
	
};
func int DIA_Coragon_BringSilber_Condition ()
{	
	if (MIS_Coragon_Silber == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_CoragonsSilber) >= 8)
	{
		return TRUE;
	};
};
func void DIA_Coragon_BringSilber_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_12"); //Tengo tu plata.
	
	if B_GiveInvItems (other, self, ItMi_CoragonsSilber, 8)
	{
		Npc_RemoveInvItems (self, ItMi_CoragonsSilber,8);
	};
	
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_13"); //�En serio?
	B_GivePlayerXP (XP_CoragonsSilber);
	B_Coragon_Bier();
	
	MIS_Coragon_Silber = LOG_SUCCESS;
};

// *********************************************************
// 					Lehmars Schuldenbuch
// *********************************************************
instance DIA_Coragon_Schuldenbuch	(C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  6;
	condition	 = 	DIA_Coragon_Schuldenbuch_Condition;
	information	 = 	DIA_Coragon_Schuldenbuch_Info;
	permanent    =  FALSE;
	description	 = 	"Mira lo que tengo aqu�...";
	
};
func int DIA_Coragon_Schuldenbuch_Condition ()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Schuldenbuch_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_15"); //Mira lo que tengo aqu�...
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_16"); //Mmm? (sorprendido) �Pero si es el libro de cuentas de Lehmar!
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_17"); //�Qu� planeas hacer con eso?
};


// *********************************************************
// 					Schuldenbuch geben
// *********************************************************
instance DIA_Coragon_GiveBook (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  7;
	condition	 = 	DIA_Coragon_GiveBook_Condition;
	information	 = 	DIA_Coragon_GiveBook_Info;
	permanent    =  FALSE;
	description	 = 	"Aqu� est� el libro.";
	
};
func int DIA_Coragon_GiveBook_Condition ()
{	
	if (Npc_HasItems (other, ItWr_Schuldenbuch) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_GiveBook_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_18"); //Aqu� tienes tu libro.
	B_GiveInvItems (other, self, ItWr_Schuldenbuch, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_19"); //�Gracias! �Me has salvado el pellejo! A Lehmar no le va a gustar mucho.
	B_GivePlayerXP (XP_Schuldenbuch);
	B_Coragon_Bier();
};


// *********************************************************
// 							ToOV
// *********************************************************
instance DIA_Coragon_ToOV (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  9;
	condition	 = 	DIA_Coragon_ToOV_Condition;
	information	 = 	DIA_Coragon_ToOV_Info;
	permanent    =  FALSE;
	description	 = 	"�Qu� tengo que hacer para entrar en el barrio alto?";
	
};
func int DIA_Coragon_ToOV_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	&& (other.guild == GIL_NONE)
	&& (Player_IsApprentice == APP_NONE)
	{
		return TRUE;
	};
};
func void DIA_Coragon_ToOV_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_23"); //�Qu� tengo que hacer para entrar en el barrio alto?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_24"); //Tienes que ser ciudadano de la ciudad. Ve a buscar un trabajo.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_25"); //Si puede ser, con los artesanos de la parte baja de la ciudad. Eso te convertir� en ciudadano.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_26"); //S�, y por si eso no bastara, ve a hablar con Lord Andre al cuartel.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_27"); //Quiz� te deje unirte a la guardia de la ciudad, que puede entrar tambi�n en el barrio alto.
};


// *********************************************************
// 							Valentino
// *********************************************************
instance DIA_Coragon_Valentino (C_INFO)
{
	npc			 = 	VLK_420_Coragon;
	nr 			 =  8;
	condition	 = 	DIA_Coragon_Valentino_Condition;
	information	 = 	DIA_Coragon_Valentino_Info;
	permanent    =  FALSE;
	description	 = 	"�Qu� ocurre con este Valentino?";
	
};
func int DIA_Coragon_Valentino_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_WhatsUp))
	{
		return TRUE;
	};
};
func void DIA_Coragon_Valentino_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_28"); //�Qu� ocurre con este Valentino?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_29"); //Es asquerosamente rico y no necesita trabajar. Y no para de restreg�rselo a todo el mundo.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_30"); //Da igual si te interesa o no.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_31"); //Bebe mucho y siempre se queda hasta el final, luego, por la ma�ana temprano, se va dando tumbos al barrio alto.
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_32"); //Todos los d�as lo mismo.
	
	
};

// *********************************************************
// 						Zeche - Important
// *********************************************************
instance DIA_Coragon_News (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr 			= 1;
	condition	= DIA_Coragon_News_Condition;
	information	= DIA_Coragon_News_Info;
	permanent   = FALSE;
	important 	= TRUE;
	
};
func int DIA_Coragon_News_Condition ()
{	
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		if (Regis_Ring == TRUE)
		{	
			return TRUE;
		};
	};
};
func void DIA_Coragon_News_Info ()
{
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_33"); //Valentino no pudo pagar su cuenta el otro d�a.
	if (Valentino.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_34"); //Farfullaba algo de que le hab�an robado y que ya me pagar�a� �En fin!
	}
	else //Pickpocket OHNE Niederschlagen - AUSKOMMENTIERT
	{
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_35"); //Y justo antes, hab�a estado presumiendo del dinero que ten�a.
		AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_36"); //Entonces se meti� la mano en el bolsillo y puso cara rara. Dijo que le hab�an robado
	};
	
	AI_Output (other, self,"DIA_Coragon_Add_15_37"); //�Y? �Qu� hiciste?
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_38"); //Pues le di una buena paliza, claro est�.
};

// *********************************************************
// 						Ring geben
// *********************************************************
instance DIA_Coragon_Ring (C_INFO)
{
	npc			= VLK_420_Coragon;
	nr 			= 10;
	condition	= DIA_Coragon_Ring_Condition;
	information	= DIA_Coragon_Ring_Info;
	permanent   = FALSE;
	description = "Mira, toma este anillo.";
	
};
func int DIA_Coragon_Ring_Condition ()
{	
	if (Npc_KnowsInfo (other, DIA_Coragon_News))
	&& (Npc_HasItems (other, ItRi_ValentinosRing) > 0)
	{
		return TRUE;
	};
};
func void DIA_Coragon_Ring_Info ()
{
	AI_Output (other, self,"DIA_Coragon_Add_15_39"); //Mira, toma este anillo.
	B_GiveInvItems (other, self, ItRi_ValentinosRing, 1);
	AI_Output (self ,other,"DIA_ADDON_NEW_Coragon_Add_09_40"); //�Qu�? No comprendo
	AI_Output (other, self,"DIA_Coragon_Add_15_41"); //Pertenec�a a Valentino.
	AI_Output (other, self,"DIA_Coragon_Add_15_42"); //P�saselo a la pr�xima persona que le caliente el trasero...

	B_GivePlayerXP (300);
	
	AI_StopProcessInfos (self);
};



























