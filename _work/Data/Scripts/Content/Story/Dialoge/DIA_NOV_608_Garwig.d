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
	description = "Gradisci una salsiccia?";
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
	AI_Output (other, self, "DIA_Garwig_Wurst_15_00"); //Gradisci una salsiccia?
	AI_Output (self, other, "DIA_Garwig_Wurst_06_01"); //Ah, deliziosa. Grazie mille, fratello.
	
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
	AI_Output (self ,other,"DIA_Garwig_Hello_06_00"); //Che Innos sia con te. Non ti ho mai visto prima d'ora, sei forse nuovo?
	AI_Output (other ,self,"DIA_Garwig_Hello_15_01"); //Sì, sono appena arrivato.
	AI_Output (self ,other,"DIA_Garwig_Hello_06_02"); //In tal caso, spero ti adatterai presto al monastero. Fammi sapere se posso aiutarti in qualcosa.
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
	description	= "Che stanza è questa?";
};
FUNC INT DIA_Garwig_Room_Condition()
{	
		return TRUE;
};
FUNC VOID DIA_Garwig_Room_Info()
{
	AI_Output (other,self ,"DIA_Garwig_Room_15_00"); //Che stanza è questa?
	AI_Output (self ,other,"DIA_Garwig_Room_06_01"); //Qui è dove custodiamo le sacre reliquie del monastero.
	AI_Output (other,self ,"DIA_Garwig_Room_15_02"); //Che reliquie?
	AI_Output (self ,other,"DIA_Garwig_Room_06_03"); //Qui giacciono il Martello di Innos, insieme allo Scudo del fuoco. Sono le reliquie più importanti della Chiesa di Innos al di fuori della capitale del regno.
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
	description	= "Parlami del martello.";
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
	AI_Output (other,self ,"DIA_Garwig_Hammer_15_00"); //Parlami del martello.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_01"); //Questo è il sacro Martello di Innos. Con questo martello, Santo Rhobar uccise la Sentinella di Pietra.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_02"); //Le Sacre Scritture affermano che la Sentinella di Pietra fosse invulnerabile. Svettava in battaglia come una torre e le armi dei nemici si infrangevano contro la sua pelle di pietra.
	AI_Output (self ,other,"DIA_Garwig_Hammer_06_03"); //Con il nome di Innos sulle labbra, Rhobar si scagliò contro il mostro e lo mandò in frantumi con un possente colpo del suo martello.
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
	description	= "Parlami dello scudo.";
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
	AI_Output (other,self ,"DIA_Garwig_Shield_15_00"); //Parlami dello scudo.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_01"); //Lo Scudo di Fuoco fu utilizzato da Dominique nella battaglia delle Isole Meridionali.
	AI_Output (self ,other,"DIA_Garwig_Shield_06_02"); //Ma il potere dello scudo non dovrà più essere utilizzato. Per questo lo abbiamo inchiodato al muro.
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
	description	= "Anche l’Occhio di Innos è conservato qui?";
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
	AI_Output (other,self ,"DIA_Garwig_Auge_15_00"); //Anche l’Occhio di Innos è conservato qui?
	AI_Output (self ,other,"DIA_Garwig_Auge_06_01"); //Certo che no, che razza di idea. Nessuno sa dove trovare quell'artefatto divino.
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
	description	 = 	"Cosa stai facendo, qui?";
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
	AI_Output			(other, self, "DIA_Garwig_SLEEP_15_00"); //Cosa stai facendo qui?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_06_01"); //Sono il guardiano degli artefatti sacri.
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice 		(DIA_Garwig_SLEEP,DIALOG_BACK,DIA_Garwig_SLEEP_BACK);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Posso darti il cambio per un po’?",DIA_Garwig_SLEEP_EXCHANGE);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Perché gli artefatti sono sotto sorveglianza?",DIA_Garwig_SLEEP_THIEF);
	Info_AddChoice 		(DIA_Garwig_SLEEP,"Non dormi mai?",DIA_Garwig_SLEEP_NEVER);
};
FUNC VOID DIA_Garwig_SLEEP_BACK()
{
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
};
FUNC VOID DIA_Garwig_SLEEP_EXCHANGE()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_EXCHANGE_15_00"); //Posso darti il cambio per un po’?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_01"); //Si tratta di una prova? I maghi ti hanno mandato per mettermi alla prova, vero? Oh, lo sapevo!
	AI_Output			(self, other, "DIA_Garwig_SLEEP_EXCHANGE_06_02"); //Ma io supererò questa prova. Di' ai tuoi maghi che resterò solido come una roccia e che resisterò a tutte le tentazioni, poiché sono un guardiano affidabile.
};
FUNC VOID DIA_Garwig_SLEEP_THIEF()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_THIEF_15_00"); //Perché gli artefatti vengono guardati a vista? C'è forse un motivo perché possano venire rubati?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_01"); //Che idea incredibile. Cosa te lo fa pensare?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_THIEF_06_02"); //Solo coloro che servono Innos sono autorizzati a mettere piede nel monastero. E nessun vero credente potrebbe mai concepire simili pensieri.
};
FUNC VOID DIA_Garwig_SLEEP_NEVER()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_NEVER_15_00"); //Non dormi mai?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_01"); //Che strana idea. Certo che non dormo mai. Innos stesso mi ha concesso il potere di servirlo senza bisogno del sonno.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_NEVER_06_02"); //Altrimenti come potrei adempiere ai sacri doveri della sorveglianza?
	
	Info_ClearChoices 	(DIA_Garwig_SLEEP);
	Info_AddChoice (DIA_Garwig_SLEEP,"Davvero non dormi MAI?",DIA_Garwig_SLEEP_AGAIN);
};
FUNC VOID DIA_Garwig_SLEEP_AGAIN()
{
	AI_Output			(other, self, "DIA_Garwig_SLEEP_AGAIN_15_00"); //Davvero non dormi MAI?
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_01"); //No. Se un guardiano cade addormentato, allora ha fallito.
	AI_Output			(self, other, "DIA_Garwig_SLEEP_AGAIN_06_02"); //Ma io non fallirò, poiché Innos mi ha donato la forza e la resistenza, e non mi stancherò mai.
	
	
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
		AI_Output (self, other, "DIA_Garwig_THIEF_06_00"); //(sconvolto) Ladro! Hai disonorato non solo te stesso, ma l'intero monastero!
		AI_Output (self, other, "DIA_Garwig_THIEF_06_01"); //Espierai le tue colpe per questo sacrilegio. E, soprattutto... RIDAMMI SUBITO QUEL MARTELLO!
		
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_THIEF_06_02"); //(disperato) Il martello è scomparso. Com'è potuto succedere?
		AI_Output (self, other, "DIA_Garwig_THIEF_06_03"); //Ho fallito. Innos mi punirà!
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
	description	 =  "Sto riportando il martello.";
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
	AI_Output (other, self, "DIA_Garwig_Abgeben_15_00"); //Sto riportando il martello.
	
	if (Hammer_Taken == TRUE)
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_01"); //Sei un maledetto ladro!
	}
	else
	{
		AI_Output (self, other, "DIA_Garwig_Abgeben_06_02"); //Dunque sei tu che l'hai preso...
	};
	AI_Output (self, other, "DIA_Garwig_Abgeben_06_03"); //Ma non spetta a me giudicarti. Innos dispenserà la sua giustizia su di te, e tu riceverai la sua punizione!
	
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















