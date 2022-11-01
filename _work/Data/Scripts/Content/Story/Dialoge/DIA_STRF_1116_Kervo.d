///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Kervo_EXIT   (C_INFO)
{
	npc         = STRF_1116_Kervo;
	nr          = 999;
	condition   = DIA_Kervo_EXIT_Condition;
	information = DIA_Kervo_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Kervo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kervo_EXIT_Info()
{
	AI_StopProcessInfos (self);
};


///////////////////////////////////////////////////////////////////////
//	Info wasist
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_WASIST		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	nr		 = 	4;
	condition	 = 	DIA_Kervo_WASIST_Condition;
	information	 = 	DIA_Kervo_WASIST_Info;

	description	 = 	"Co se dęje?";
};

func int DIA_Kervo_WASIST_Condition ()
{
	return TRUE;
};

func void DIA_Kervo_WASIST_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_WASIST_15_00"); //Co je s tebou?
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_01"); //Ty se ptáš? Jen se kolem sebe podívej.
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_02"); //Ty zatracený číhavci už zabrali celou âeku.
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_03"); //Nejdâív byli jen dva. Ale od včerejška už jsem jich potkal minimálnę pęt.
	AI_Output			(self, other, "DIA_Kervo_WASIST_13_04"); //Nemám ani tušení, jak se odsud dostat.
};


///////////////////////////////////////////////////////////////////////
//	Info Hilfe
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_HILFE		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	nr		 = 	5;
	condition	 = 	DIA_Kervo_HILFE_Condition;
	information	 = 	DIA_Kervo_HILFE_Info;

	description	 = 	"Zkoušel ses dostat pâes průsmyk?";
};

func int DIA_Kervo_HILFE_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Kervo_WASIST))
		{
				return TRUE;
		};
};
func void DIA_Kervo_HILFE_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_15_00"); //Zkoušel ses dostat pâes průsmyk?
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_01"); //Vypadám snad jako magor? Dokud tam budou ty bestie, nedostane mę tam ani dvacet vojáků. Nesnáším je.
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_02"); //(úplnę sklíčenę) Jenom je ucítím a už mę polévá studený pot. A z toho jejich neustálýho huhlání mi tuhne krev v žilách.
	AI_Output			(self, other, "DIA_Kervo_HILFE_13_03"); //Jestli tak toužíš po tom, nechat si od nich stáhnout kůži zaživa, tak bęž rovnou tam.

	Info_ClearChoices	(DIA_Kervo_HILFE);
	Info_AddChoice	(DIA_Kervo_HILFE, "Fajn, v tom pâípadę na to zapomeŕ.", DIA_Kervo_HILFE_tschau );
	Info_AddChoice	(DIA_Kervo_HILFE, "Ale tady nemůžeš zůstat vęčnę.", DIA_Kervo_HILFE_ewig );

	if (Kervo_GotStuff == TRUE)
	{
		Info_AddChoice	(DIA_Kervo_HILFE, "Co mi dáš, když ty vęci zabiju?", DIA_Kervo_HILFE_Problem );
	};

	MIS_Kervo_KillLurker = LOG_RUNNING;
};
func void DIA_Kervo_HILFE_ewig ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_ewig_15_00"); //Ale tady nemůžeš zůstat vęčnę.
	AI_Output			(self, other, "DIA_Kervo_HILFE_ewig_13_01"); //Nemám tušení, co po mnę vlastnę chceš, ale jedno ti âeknu: odsud mę nedostaneš.
};
var int Kervo_PromiseNugget;
func void DIA_Kervo_HILFE_Problem ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_Problem_15_00"); //Co mi dáš, když ty potvory zabiju?
	AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_01"); //Hmm. Fajn. Mohlo by stačit, kdyby zmizeli ty číhavci pâed jeskyní.
	
	if (hero.guild == GIL_KDF)
	{	
		AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_02"); //Našel jsem prázdný runový kámen. Jsi mág, takže by se ti mohl hodit.
	}
	else
	{
		AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_03"); //Našel jsem hroudu rudy.
	};

	AI_Output			(self, other, "DIA_Kervo_HILFE_Problem_13_04"); //Můžu ti ji dát jako revanš.
	Kervo_PromiseNugget = TRUE;
	AI_StopProcessInfos (self);
};

func void DIA_Kervo_HILFE_tschau ()
{
	AI_Output			(other, self, "DIA_Kervo_HILFE_tschau_15_00"); //Fajn, v tom pâípadę na to zapomeŕ.
	AI_Output			(self, other, "DIA_Kervo_HILFE_tschau_13_01"); //Jasnę, vezmu si to.

	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info LurkerPlatt
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_LurkerPlatt		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	condition	 = 	DIA_Kervo_LurkerPlatt_Condition;
	information	 = 	DIA_Kervo_LurkerPlatt_Info;

	description = 	"Ty číhavci pâed jeskyní už tam nejsou.";	
};

func int DIA_Kervo_LurkerPlatt_Condition ()
{
	if 	(MIS_Kervo_KillLurker == LOG_RUNNING)
	&& (Npc_IsDead(Kervo_Lurker1))
	&& (Npc_IsDead(Kervo_Lurker2))
	&& (Npc_IsDead(Kervo_Lurker3))
	&& (Npc_IsDead(Kervo_Lurker4))
	&& (Npc_IsDead(Kervo_Lurker5))
	&& (Npc_IsDead(Kervo_Lurker6))
		{
			return TRUE;
		};
};

func void DIA_Kervo_LurkerPlatt_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_LurkerPlatt_15_00"); //Ty číhavci pâed jeskyní už tam nejsou.
	AI_Output			(self, other, "DIA_Kervo_LurkerPlatt_13_01"); //Výbornę. Konečnę se můžu znova volnę nadechnout.

	if (Kervo_PromiseNugget == TRUE)
	{
		AI_Output			(self, other, "DIA_Kervo_LurkerPlatt_13_02"); //Tady máš, co jsem ti slíbil.
	
		if (hero.guild == GIL_KDF)
		{
			B_GiveInvItems (self, other, ItMi_RuneBlank, 1);					
		}
		else
		{
			B_GiveInvItems (self, other, ItMi_Nugget, 1);					
		};	
	};
	B_GivePlayerXP (XP_KervoKillLurker);
	MIS_Kervo_KillLurker = LOG_SUCCESS;
};

///////////////////////////////////////////////////////////////////////
//	Info Vergisses
///////////////////////////////////////////////////////////////////////
instance DIA_Kervo_VERGISSES		(C_INFO)
{
	npc		 = 	STRF_1116_Kervo;
	condition	 = 	DIA_Kervo_VERGISSES_Condition;
	information	 = 	DIA_Kervo_VERGISSES_Info;
	permanent	 = 	TRUE;

	description = 	"Projdeš teë tím průsmykem?";	
};

func int DIA_Kervo_VERGISSES_Condition ()
{
	if 	(MIS_Kervo_KillLurker == LOG_SUCCESS)
		{
			return TRUE;
		};
};

func void DIA_Kervo_VERGISSES_Info ()
{
	AI_Output			(other, self, "DIA_Kervo_VERGISSES_15_00"); //Projdeš teë tím průsmykem?
	AI_Output			(self, other, "DIA_Kervo_VERGISSES_13_01"); //Na to zapomeŕ, chlape. Když mę chytí, pošlou mę zpátky do dolů. Zůstanu tady.
	AI_StopProcessInfos (self);
};



// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Kervo_PICKPOCKET (C_INFO)
{
	npc			= STRF_1116_Kervo;
	nr			= 900;
	condition	= DIA_Kervo_PICKPOCKET_Condition;
	information	= DIA_Kervo_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Kervo_PICKPOCKET_Condition()
{
	C_Beklauen (34, 10);
};
 
FUNC VOID DIA_Kervo_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Kervo_PICKPOCKET);
	Info_AddChoice		(DIA_Kervo_PICKPOCKET, DIALOG_BACK 		,DIA_Kervo_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Kervo_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Kervo_PICKPOCKET_DoIt);
};

func void DIA_Kervo_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Kervo_PICKPOCKET);
};
	
func void DIA_Kervo_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Kervo_PICKPOCKET);
};









