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
	AI_Output (self, other, "DIA_Marcos_Hallo_04_00");//STÓJ - w imiê Innosa! Jestem Marcos, królewski paladyn. Mów czego chcesz, i lepiej mów prawdê!
	
	if (other.guild == GIL_KDF)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_01");//Wybraniec Innosa zawsze mówi prawdê.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_02");//Wybacz mi, dostojny magu. Nie zdawa³em sobie sprawy, z kim rozmawiam.
		AI_Output (other, self, "DIA_Marcos_Hallo_15_03");//Nic siê nie sta³o.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_04");//Czy wolno mi wiedzieæ, co sprowadza ciê w te strony?
	}
	else if (other.guild == GIL_MIL)
	{
		AI_Output (other, self, "DIA_Marcos_Hallo_15_05");//Spokojnie - wype³niam rozkazy Lorda Hagena.
		AI_Output (self, other, "DIA_Marcos_Hallo_04_06");//Jesteœ ¿o³nierzem. Co ciê tu sprowadza?
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
	description	= "Muszê dostarczyæ Lordowi Hagenowi dowód na istnienie smoków.";
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
	AI_Output (other, self, "DIA_Marcos_Hagen_15_00");//Muszê dostarczyæ Lordowi Hagenowi dowód na istnienie smoków.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_01");//Nie traæ zatem czasu i nie nadstawiaj niepotrzebnie karku.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_02");//Czy s¹dzisz, ¿e znajdziesz tutaj smocz¹ ³uskê, któr¹ bêdziesz mu móg³ pokazaæ?
	AI_Output (self, other, "DIA_Marcos_Hagen_04_03");//IdŸ do zamku i porozmawiaj z kapitanem Garondem.
	AI_Output (self, other, "DIA_Marcos_Hagen_04_04");//Musi siê dowiedzieæ, ¿e wype³niasz misjê powierzon¹ ci przez Lorda Hagena! Na pewno udzieli ci pomocy.
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
	description	= "Przysy³a mnie Garond...";
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
	AI_Output (other, self, "DIA_Marcos_Garond_15_00");//Przysy³a mnie Garond - kaza³ mi siê dowiedzieæ, ile rudy zdo³aliœcie wydobyæ.
	AI_Output (self, other, "DIA_Marcos_Garond_04_01");//Powiedz Garondowi, ¿e musieliœmy przerwaæ wydobycie z powodu nasilaj¹cych siê ataków orków.
	AI_Output (self, other, "DIA_Marcos_Garond_04_02");//Próbowa³em dotrzeæ do zamku wraz z grup¹ swoich ludzi, ale tylko ja prze¿y³em.
	AI_Output (self, other, "DIA_Marcos_Garond_04_03");//Ruda znajduje siê w bezpiecznym miejscu. Wydobyliœmy CZTERY skrzynie. IdŸ zameldowaæ o tym Garondowi.
	AI_Output (self, other, "DIA_Marcos_Garond_04_04");//Powiedz mu, ¿e bêdê broni³ tej rudy, dopóki starczy mi si³. Nie wiem jednak, jak d³ugo jeszcze zdo³am unikaæ orków.
	AI_Output (self, other, "DIA_Marcos_Garond_04_05");//Powiedz mu, ¿e potrzebujê wsparcia.
	AI_Output (other, self, "DIA_Marcos_Garond_15_06");//Dam mu znaæ.
	
	B_LogEntry (TOPIC_ScoutMine,"Paladyn Marcos strze¿e w niewielkiej dolinie CZTERECH skrzyñ rudy.");
	
	Log_CreateTopic (Topic_MarcosJungs,LOG_MISSION);
	Log_SetTopicStatus (Topic_MarcosJungs,LOG_RUNNING);
	B_LogEntry (Topic_MarcosJungs,"Marcos chce, aby Garond wys³a³ mu posi³ki.");
	
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
	description	= "Jak wygl¹da sytuacja?";
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
		AI_Output (self, other, "DIA_Marcos_Perm_04_01");//Potrzebujê solidnego ³yka mikstury leczniczej!
		B_UseItem (self, ItPo_Health_03);  
		
	}
	else if (MIS_Marcos_Jungs == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_02");//Wytrzymam - ale liczê na to, ¿e Garond nied³ugo przyœle mi wsparcie.
	}
	else if (MIS_Marcos_Jungs == LOG_SUCCESS)
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_03");//Dziêkujê ci za pomoc. Niechaj Innos da nam si³ê.
		
		if (Marcos_einmalig == FALSE)
		{
			B_GivePlayerXP(XP_Marcos_Jungs);
			Marcos_einmalig = TRUE;
		};
	}
	else 
	{
		AI_Output (self, other, "DIA_Marcos_Perm_04_04");//Nie poddam siê! Innos daje mi si³ê!
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


	
	
	
	
	
	

	

	
	
