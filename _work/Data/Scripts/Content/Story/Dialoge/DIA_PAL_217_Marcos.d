// ************************************************************
// 			  				   EXIT 
// ************************************************************
INSTANCE DIA_Marcos_EXIT(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 999;
	condition	= DIA_Marcos_EXIT_Condition;
	information	= DIA_Marcos_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Marcos_EXIT_Condition()
{
	return TRUE;
};
 
FUNC VOID DIA_Marcos_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};	
// ************************************************************
// 			  Hallo				 
// ************************************************************
INSTANCE DIA_Marcos_Hallo(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 2;
	condition	= DIA_Marcos_Hallo_Condition;
	information	= DIA_Marcos_Hallo_Info;
	permanent	= FALSE;
	important	= TRUE;
};                       

FUNC INT DIA_Marcos_Hallo_Condition()
{	
	if (Kapitel == 2)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Hallo_Info()
{	
	AI_Output (self, other, "DIA_Marcos_Hallo_04_00");//STÓJ - w imię Innosa! Jestem Marcos, królewski paladyn. Mów czego chcesz, i lepiej mów prawdę!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_01");//Wybraniec Innosa zawsze mówi prawdę.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_02");//Wybacz mi, dostojny magu. Nie zdawałem sobie sprawy, z kim rozmawiam.
		AI_Output (other, self, "DIA_Marcos_Hallo_15_03");//Nic się nie stało.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_04");//Czy wolno mi wiedzieć, co sprowadza cię w te strony?
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_05");//Spokojnie - wypełniam rozkazy Lorda Hagena.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_06");//Jesteś żołnierzem. Co cię tu sprowadza?
	}
	else //SLD
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_07");//Spokojnie, obaj pracujemy dla Lorda Hagena.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_08");//Od kiedy to Lord Hagen zatrudnia najemników? Mów - czego tu szukasz?
	};

};
// ************************************************************
// 			  Hagen			 
// ************************************************************
INSTANCE DIA_Marcos_Hagen(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 2;
	condition	= DIA_Marcos_Hagen_Condition;
	information	= DIA_Marcos_Hagen_Info;
	permanent	= FALSE;
	description	= "Muszę dostarczyć Lordowi Hagenowi dowód na istnienie smoków.";
};                       

FUNC INT DIA_Marcos_Hagen_Condition()
{	
	if (Kapitel == 2)
	&& (Garond.aivar [AIV_TalkedToPlayer] == FALSE) 
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Hagen_Info()
{	
	AI_Output (other, self, "DIA_Marcos_Hagen_15_00");//Muszę dostarczyć Lordowi Hagenowi dowód na istnienie smoków.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_01");//Nie trać zatem czasu i nie nadstawiaj niepotrzebnie karku.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_02");//Czy sądzisz, że znajdziesz tutaj smoczą łuskę, którą będziesz mu mógł pokazać?
	AI_Output (self, other, "DIA_Marcos_Hagen_04_03");//Idź do zamku i porozmawiaj z kapitanem Garondem.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_04");//Musi się dowiedzieć, że wypełniasz misję powierzoną ci przez Lorda Hagena! Na pewno udzieli ci pomocy.
};	

// ************************************************************
// 			  Garond			 
// ************************************************************
INSTANCE DIA_Marcos_Garond(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 2;
	condition	= DIA_Marcos_Garond_Condition;
	information	= DIA_Marcos_Garond_Info;
	permanent	= FALSE;
	description	= "Przysyła mnie Garond...";
};                       

FUNC INT DIA_Marcos_Garond_Condition()
{	
	if (Kapitel == 2)
	&& (MIS_OLDWORLD == LOG_RUNNING)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Garond_Info()
{	
	AI_Output (other, self, "DIA_Marcos_Garond_15_00");//Przysyła mnie Garond - kazał mi się dowiedzieć, ile rudy zdołaliście wydobyć.
	AI_Output (self, other, "DIA_Marcos_Garond_04_01");//Powiedz Garondowi, że musieliśmy przerwać wydobycie z powodu nasilających się ataków orków.
	AI_Output (self, other, "DIA_Marcos_Garond_04_02");//Próbowałem dotrzeć do zamku wraz z grupą swoich ludzi, ale tylko ja przeżyłem.
	AI_Output (self, other, "DIA_Marcos_Garond_04_03");//Ruda znajduje się w bezpiecznym miejscu. Wydobyliśmy CZTERY skrzynie. Idź zameldować o tym Garondowi.
	AI_Output (self, other, "DIA_Marcos_Garond_04_04");//Powiedz mu, że będę bronił tej rudy, dopóki starczy mi sił. Nie wiem jednak, jak długo jeszcze zdołam unikać orków.
	AI_Output (self, other, "DIA_Marcos_Garond_04_05");//Powiedz mu, że potrzebuję wsparcia.
	AI_Output (other, self, "DIA_Marcos_Garond_15_06");//Dam mu znać.
	
	B_LogEntry (TOPIC_ScoutMine,"Paladyn Marcos strzeże w niewielkiej dolinie CZTERECH skrzyń rudy.");
	
	Log_CreateTopic (Topic_MarcosJungs,LOG_MISSION);
	Log_SetTopicStatus (Topic_MarcosJungs,LOG_RUNNING);
	B_LogEntry (Topic_MarcosJungs,"Marcos chce, aby Garond wysłał mu posiłki.");
	
	MIS_Marcos_Jungs = LOG_RUNNING;
	Marcos_Ore = TRUE;
	self.flags = 0;
};	
	
// ************************************************************
// 			Perm
// ************************************************************
INSTANCE DIA_Marcos_Perm(C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 9;
	condition	= DIA_Marcos_Perm_Condition;
	information	= DIA_Marcos_Perm_Info;
	permanent	= TRUE;
	description	= "Jak wygląda sytuacja?";
};                       

FUNC INT DIA_Marcos_Perm_Condition()
{	
	if (Kapitel >= 2)
	&& (Npc_KnowsInfo (other, DIA_Marcos_Hagen)
	|| Npc_KnowsInfo (other, DIA_Marcos_Garond))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Marcos_Perm_Info()
{	

	AI_Output (other, self, "DIA_Marcos_Perm_15_00");//Jak sytuacja?
	
	if (self.attribute [ATR_HITPOINTS]) < (self.attribute [ATR_HITPOINTS_MAX] /2)  
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_01");//Potrzebuję solidnego łyka mikstury leczniczej!
		B_UseItem (self, ItPo_Health_03);  
		
	}
	else if (MIS_Marcos_Jungs == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_02");//Wytrzymam - ale liczę na to, że Garond niedługo przyśle mi wsparcie.
	}
	else if (MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_03");//Dziękuję ci za pomoc. Niechaj Innos da nam siłę.
		
		if (Marcos_einmalig == FALSE)
		{
			B_GivePlayerXP(XP_Marcos_Jungs);
			Marcos_einmalig = TRUE;
		};
	}
	else 
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_04");//Nie poddam się! Innos daje mi siłę!
	};
	
	AI_StopProcessInfos (self);
};		
	

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Marcos_PICKPOCKET (C_INFO)
{
	npc			= PAL_217_Marcos;
	nr			= 900;
	condition	= DIA_Marcos_PICKPOCKET_Condition;
	information	= DIA_Marcos_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Marcos_PICKPOCKET_Condition()
{
	C_Beklauen (65, 380);
};
 
FUNC VOID DIA_Marcos_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Marcos_PICKPOCKET);
	Info_AddChoice		(DIA_Marcos_PICKPOCKET, DIALOG_BACK 		,DIA_Marcos_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Marcos_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Marcos_PICKPOCKET_DoIt);
};

func void DIA_Marcos_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Marcos_PICKPOCKET);
};
	
func void DIA_Marcos_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Marcos_PICKPOCKET);
};


	
	
	
	
	
	

	

	
	
