
///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Isgaroth_EXIT   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 999;
	condition   = DIA_Isgaroth_EXIT_Condition;
	information = DIA_Isgaroth_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Isgaroth_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Isgaroth_EXIT_Info()
{
	AI_Output	(self ,other,"DIA_Isgaroth_EXIT_01_00"); //Niechaj Innos zawsze ma ci� w swojej opiece.
	AI_StopProcessInfos (self);
};
//****************************************************************************
//	Begr�ssung
//****************************************************************************

INSTANCE DIA_Isgaroth_Hello   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 2;
	condition   = DIA_Isgaroth_Hello_Condition;
	information = DIA_Isgaroth_Hello_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Isgaroth_Hello_Condition()
{
	if Npc_IsInState (self,ZS_Talk)
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Isgaroth_Hello_Info()
{
	AI_Output (self ,other,"DIA_Isgaroth_Hello_01_00"); //Niech Innos b�dzie z tob�. Co mog� dla ciebie zrobi�, w�drowcze?
}; 
//****************************************************************************
//	Segen
//****************************************************************************
INSTANCE DIA_Isgaroth_Segen   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 10;
	condition   = DIA_Isgaroth_Segen_Condition;
	information = DIA_Isgaroth_Segen_Info;
	permanent   = TRUE;
	description	= "Pob�ogos�aw mnie!";
};
FUNC INT DIA_Isgaroth_Segen_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Isgaroth_Segen_Info()
{
	AI_Output (other ,self,"DIA_Isgaroth_Segen_15_00"); //Pob�ogos�aw mnie!
	AI_Output (self ,other,"DIA_Isgaroth_Segen_01_01"); //B�ogos�awi� ci� w imieniu Innosa. Niechaj ogie� naszego Pana zawsze p�onie w twym sercu, aby dawa� ci si�� do post�powania zgodnie z jego naukami.
	
	Isgaroth_Segen = TRUE;
}; 
//********************************************************************************
//	Sergio schickt mich  (Wolf Mission)
//********************************************************************************
INSTANCE DIA_Isgaroth_Wolf   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 2;
	condition   = DIA_Isgaroth_Wolf_Condition;
	information = DIA_Isgaroth_Wolf_Info;
	permanent   = FALSE;
	description	= "Przysy�a mnie Sergio...";
};
FUNC INT DIA_Isgaroth_Wolf_Condition()
{	
	if (MIS_KlosterArbeit == LOG_RUNNING)
	&& (Sergio_Sends == TRUE) 
	&& (Kapitel == 1)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Isgaroth_Wolf_Info()
{
	AI_Output (other,self ,"DIA_Isgaroth_Wolf_15_00"); //Przys�a� mnie Sergio. Przej��em jego zadanie. A zatem, o co chodzi?
	AI_Output (self ,other,"DIA_Isgaroth_Wolf_01_01"); //W okolicy pojawi� si� ostatnio ciemny wilk. Znajd� go i zabij.

	MIS_IsgarothWolf = LOG_RUNNING;
	B_LogEntry (Topic_IsgarothWolf,"W pobli�u kaplicy kr�ci si� mroczny wilk. Mam go znale�� i zabi�.");
	
};
//********************************************************************************
// Wolf tot
//********************************************************************************
INSTANCE DIA_Isgaroth_tot   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 2;
	condition   = DIA_Isgaroth_tot_Condition;
	information = DIA_Isgaroth_tot_Info;
	permanent   = TRUE;
	description	= "Zabi�em wilka.";
};
FUNC INT DIA_Isgaroth_tot_Condition()
{	
	Wolfi = Hlp_GetNpc (BlackWolf);
	
	if (MIS_IsgarothWolf == LOG_RUNNING)
	&& Npc_IsDead (Wolfi)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Isgaroth_tot_Info()
{
	AI_Output (other,self ,"DIA_Isgaroth_tot_15_00"); //Zabi�em wilka.
	AI_Output (self ,other,"DIA_Isgaroth_tot_01_01"); //Dobra robota, nowicjuszu. Jeste� dzielnym cz�owiekiem. A teraz wracaj do klasztoru, do swoich obowi�zk�w.
	
	MIS_IsgarothWolf = LOG_SUCCESS;
	B_GivePlayerXP (XP_IsgarothWolf);
	AI_StopProcessInfos (self);
	
};
//********************************************************************************
//	Was machst Du hier
//********************************************************************************

INSTANCE DIA_Isgaroth_Job   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 4;
	condition   = DIA_Isgaroth_Job_Condition;
	information = DIA_Isgaroth_Job_Info;
	permanent   = FALSE;
	description	= "Co tu porabiasz?";
};
FUNC INT DIA_Isgaroth_Job_Condition()
{
	if (hero.guild != GIL_KDF)
	{
		return TRUE;
	};		
};
FUNC VOID DIA_Isgaroth_Job_Info()
{
	AI_Output (other,self ,"DIA_Isgaroth_Job_15_00"); //Co tutaj robisz?
	AI_Output (self ,other,"DIA_Isgaroth_Job_01_01"); //Jestem Magiem Ognia. Kap�anem boga Innosa.
	AI_Output (self ,other,"DIA_Isgaroth_Job_01_02"); //Innos jest najwy�szym bogiem, stworzycielem ognia i panem sprawiedliwo�ci, a to jest jego kaplica.
	AI_Output (self ,other,"DIA_Isgaroth_Job_01_03"); //Ludzie przychodz� tutaj, kiedy chc� si� pomodli� do Innosa lub otrzyma� b�ogos�awie�stwo.
	AI_Output (self ,other,"DIA_Isgaroth_Job_01_04"); //Za niewielk� op�at� mo�esz ode mnie otrzyma� wiele po�ytecznych przedmiot�w.
	
	Log_CreateTopic (Topic_KlosterTrader,LOG_NOTE);
	B_LogEntry (Topic_KlosterTrader,"Mistrz Isgaroth sprzedaje przydatne przedmioty magiczne w kaplicy przed klasztorem.");
};
//****************************************************************************
//	Trade
//****************************************************************************
INSTANCE DIA_Isgaroth_Trade   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 99;
	condition   = DIA_Isgaroth_Trade_Condition;
	information = DIA_Isgaroth_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description	= "Poka� mi swoje towary.";
};
FUNC INT DIA_Isgaroth_Trade_Condition()
{	
	if Npc_KnowsInfo (other,DIA_Isgaroth_Job)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Isgaroth_Trade_Info()
{
	B_GiveTradeInv (self);
	AI_Output (other ,self,"DIA_Isgaroth_Trade_15_00"); //Poka� mi swoje towary.
};
//********************************************************************************
//	Kloster
//********************************************************************************
INSTANCE DIA_Isgaroth_Kloster   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 3;
	condition   = DIA_Isgaroth_Kloster_Condition;
	information = DIA_Isgaroth_Kloster_Info;
	permanent   = FALSE;
	description	= "Dok�d prowadzi ta �cie�ka?";
};
FUNC INT DIA_Isgaroth_Kloster_Condition()
{	
	if (other.guild != GIL_NOV)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;	
	};
};
FUNC VOID DIA_Isgaroth_Kloster_Info()
{
	AI_Output (other,self ,"DIA_Isgaroth_Kloster_15_00"); //Dok�d prowadzi ta �cie�ka?
	AI_Output (self ,other,"DIA_Isgaroth_Kloster_01_01"); //Ta �cie�ka zaprowadzi ci� prosto do klasztoru Mag�w Ognia. Jednak wst�p tam maj� tylko s�udzy Innosa.
	
	if (other.guild == GIL_NONE)
	{
		AI_Output (self ,other,"DIA_Isgaroth_Kloster_01_02"); //Je�li chcesz zosta� przyj�ty jako nowicjusz, musisz przynie�� owc� i...
		B_Say_Gold (self, other,Summe_Kloster);
		
		Log_CreateTopic (Topic_Kloster,LOG_MISSION);
		Log_SetTopicStatus (Topic_Kloster,LOG_RUNNING);
		B_LogEntry (Topic_Kloster,"Aby zosta� nowicjuszem w klasztorze Innosa, potrzebuj� owcy i 1000 sztuk z�ota.");
	}
	else 
	{
		AI_Output (self ,other,"DIA_Isgaroth_Kloster_01_03"); //Poniewa� przy��czy�e� si� ju� do innej grupy, nie zostaniesz wpuszczony do �rodka.
	};
};



//******************************************************************************************
//	Vatras Auftrag
//******************************************************************************************
INSTANCE DIA_Isgaroth_Vatras   (C_INFO)
{
	npc         = KDF_509_Isgaroth;
	nr          = 3;
	condition   = DIA_Isgaroth_Vatras_Condition;
	information = DIA_Isgaroth_Vatras_Info;
	permanent   = TRUE;
	description	= "Mam wiadomo�� od Vatrasa.";
};
FUNC INT DIA_Isgaroth_Vatras_Condition()
{
	if (MIS_Vatras_Message == LOG_RUNNING)
	&& ((Npc_HasItems (other,ItWr_VatrasMessage) == 1)
	||  (Npc_HasItems (other,ItWr_VatrasMessage_open) == 1))
	{
		return TRUE;
	};	
};
FUNC VOID DIA_Isgaroth_Vatras_Info()
{
	AI_Output (other,self ,"DIA_ISgaroth_Vatras_15_00"); //Mam wiadomo�� od Vatrasa.
	AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_01"); //Co to za wiadomo��?
	AI_Output (other,self ,"DIA_Isgaroth_Vatras_15_02"); //List. Prosz�, oto on.
	
	if (Npc_HasItems (other,ItWr_VatrasMessage) == 1)
	{
		if B_GiveInvItems (other,self ,ItWr_VatrasMessage,1)
		{
			Npc_RemoveInvItems (self,ItWr_VatrasMessage,1); 
		};
		B_UseFakeScroll();
	
		AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_03"); //Dobrze, mo�esz powiedzie� Vatrasowi, �e odebra�em jego wiadomo��.
		AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_04"); //Przyjmij jako zap�at� te magiczne mikstury, na pewno ci si� przydadz�.
		
		CreateInvItems (self, ItPo_Health_02,2);
		B_GiveInvItems (self,other,ItPo_Health_02,2);
		
		B_GivePlayerXP ((XP_Ambient)*2);
		
	}
	else if (Npc_HasItems (other,ItWr_VatrasMessage_open) == 1)
	{
		if B_GiveInvItems (other,self ,ItWr_VatrasMessage_open,1)
		{
			Npc_RemoveInvItems (self,ItWr_VatrasMessage_open,1); 
		};
		B_UseFakeScroll ();
	
		AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_05"); //Piecz�� jest z�amana. Co� ty sobie wyobra�a�, g�upcze!
		AI_Output (self ,other,"DIA_Isgaroth_Vatras_01_06"); //Id� i powiedz Vatrasowi, �e odebra�em jego wiadomo��.
		AI_StopProcessInfos (self);
	};	
	Vatras_Return = TRUE;
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Isgaroth_PICKPOCKET (C_INFO)
{
	npc			= KDF_509_Isgaroth;
	nr			= 900;
	condition	= DIA_Isgaroth_PICKPOCKET_Condition;
	information	= DIA_Isgaroth_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_60;
};                       

FUNC INT DIA_Isgaroth_PICKPOCKET_Condition()
{
	C_Beklauen (48, 50);
};
 
FUNC VOID DIA_Isgaroth_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Isgaroth_PICKPOCKET);
	Info_AddChoice		(DIA_Isgaroth_PICKPOCKET, DIALOG_BACK 		,DIA_Isgaroth_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Isgaroth_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Isgaroth_PICKPOCKET_DoIt);
};

func void DIA_Isgaroth_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Isgaroth_PICKPOCKET);
};
	
func void DIA_Isgaroth_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Isgaroth_PICKPOCKET);
};


