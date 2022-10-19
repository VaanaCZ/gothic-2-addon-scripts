///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Lee_DI_EXIT   (C_INFO)
{
	npc         = SLD_800_Lee_DI;
	nr          = 999;
	condition   = DIA_Lee_DI_EXIT_Condition;
	information = DIA_Lee_DI_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Lee_DI_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lee_DI_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DI_Hallo		(C_INFO)
{
	npc			 = 	SLD_800_Lee_DI;
	nr			 = 	2;
	condition	 = 	DIA_Lee_DI_Hallo_Condition;
	information	 = 	DIA_Lee_DI_Hallo_Info;

	description	 = 	"Co za pr·ci si vezmeö?";
};
func int DIA_Lee_DI_Hallo_Condition ()
{	
	if  (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Lee_DI_Hallo_Info ()
{
	AI_Output			(other, self, "DIA_Lee_DI_Hallo_15_00"); //Co za pr·ci si vezmeö?
	AI_Output			(self, other, "DIA_Lee_DI_Hallo_04_01"); //NÏkdo musÌ na loÔ dohlÌûet. Z˘stanu tady a postar·m se o to, aby tady byla, aû se vr·tÌö.
	
};

///////////////////////////////////////////////////////////////////////
//	Info PERM6
///////////////////////////////////////////////////////////////////////

instance DIA_Lee_DI_PERM6		(C_INFO)
{
	npc			 = 	SLD_800_Lee_DI;
	nr			 = 	2;
	condition	 = 	DIA_Lee_DI_PERM6_Condition;
	information	 = 	DIA_Lee_DI_PERM6_Info;
	permanent	 = 	TRUE;

	description	 = 	"Co moje loÔ?";
};

func int DIA_Lee_DI_PERM6_Condition ()
{	
	if (Npc_KnowsInfo(other, DIA_Lee_DI_Hallo))
	&& (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};

func void DIA_Lee_DI_PERM6_Info ()
{
	AI_Output			(other, self, "DIA_Lee_DI_PERM6_15_00"); //Co moje loÔ?

	if (ORkSturmDI == FALSE)
	{
		AI_Output			(self, other, "DIA_Lee_DI_PERM6_04_01"); //Neboj se. M·m vöechno pod kontrolou.
	}
	else
	{
		AI_Output			(self, other, "DIA_Lee_DI_PERM6_04_02"); //Vöechno je v po¯·dku. Jen aù se ti mizernÌ sk¯eti vr·tÌ. UötÏd¯Ìm jim dalöÌ v˝prask.
	};
	
	AI_StopProcessInfos (self);
};
 
//**************************************
//			Ich will trainieren
//**************************************

INSTANCE DIA_Lee_DI_Teach(C_INFO)
{
	npc			= SLD_800_Lee_DI;
	nr			= 10;
	condition	= DIA_Lee_DI_Teach_Condition;
	information	= DIA_Lee_DI_Teach_Info;
	permanent	= TRUE;
	
	description = "Pot¯ebuji v˝cvik.";
};                       

FUNC INT DIA_Lee_DI_Teach_Condition()
{
	if  (Npc_IsDead(UndeadDragon) == FALSE)
		{
				return TRUE;
		};
};
 
FUNC VOID DIA_Lee_DI_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Lee_DI_Teach_15_00"); //Pot¯ebuji se vycviËit.
	AI_Output (self,other ,"DIA_Lee_DI_Teach_04_01"); //V Ëem p¯esnÏ se chceö zlepöit?
	
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
};

FUNC VOID DIA_Lee_DI_Teach_1H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 100))
	{
			AI_Output (self ,other,"DIA_Lee_DI_Teach_1H_1_04_00"); //Tvoje obrana je straön·, ale bude to muset staËit.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_1H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 100))
	{
			AI_Output (self ,other,"DIA_Lee_DI_Teach_1H_5_04_00"); //M·ö moc tuh· z·pÏstÌ. ZbraÚ musÌö drûet volnÏji.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_2H_1 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 1, 100))
	{
		AI_Output(self,other,"DIA_DIA_Lee_DI_Teach_2H_1_04_00"); //Vûdycky mÏj na pamÏti, ûe övih vych·zÌ z bok˘, ne ze z·pÏstÌ.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_2H_5 ()
{
	if (B_TeachFightTalentPercent (self, other, NPC_TALENT_2H, 5, 100))
	{
		AI_Output(self,other,"DIA_Lee_DI_Teach_2H_5_04_00"); //I ten nejsilnÏjöÌ v˝pad je k niËemu, kdyû nic nezas·hne. Svou sÌlu tedy pouûÌvej s rozvahou.
	};
	Info_ClearChoices 	(DIA_Lee_DI_Teach);
	Info_AddChoice 		(DIA_Lee_DI_Teach,	DIALOG_BACK		,DIA_Lee_DI_Teach_Back);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h1	, B_GetLearnCostTalent(other, NPC_TALENT_2H, 1))			,DIA_Lee_DI_Teach_2H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn2h5, B_GetLearnCostTalent(other, NPC_TALENT_2H, 5))			,DIA_Lee_DI_Teach_2H_5);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Lee_DI_Teach_1H_1);
	Info_AddChoice		(DIA_Lee_DI_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Lee_DI_Teach_1H_5);
	
};

FUNC VOID DIA_Lee_DI_Teach_Back ()
{
	Info_ClearChoices (DIA_Lee_DI_Teach);
};

///////////////////////////////////////////////////////////////////////
//	Info UndeadDragonDead
///////////////////////////////////////////////////////////////////////
instance DIA_Lee_DI_UndeadDragonDead		(C_INFO)
{
	npc			 = 	SLD_800_Lee_DI;
	nr			 = 	2;
	condition	 = 	DIA_Lee_DI_UndeadDragonDead_Condition;
	information	 = 	DIA_Lee_DI_UndeadDragonDead_Info;
	permanent	 = 	TRUE;
	
	description = 	"TeÔ si p˘jdeme po svÈm.";
};

func int DIA_Lee_DI_UndeadDragonDead_Condition ()
{	
	if (Npc_IsDead(UndeadDragon))
	{
		return TRUE;
	};
};

var int DIA_Lee_DI_UndeadDragonDead_OneTime;
func void DIA_Lee_DI_UndeadDragonDead_Info ()
{
	AI_Output			(other ,self, "DIA_Lee_DI_UndeadDragonDead_15_00"); //M˘ûeme vyrazit. Nep¯Ìtel je mrtv˝.
	AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_01"); //V˝bornÏ. V tom p¯ÌpadÏ ¯ekni kapit·novi, aù zvedne kotvy.

	if (DIA_Lee_DI_UndeadDragonDead_OneTime == FALSE)
	&& (hero.guild == GIL_DJG)
		{
			AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_02"); //Vezmeö mÏ na pevninu, ûe?
			AI_Output			(other ,self, "DIA_Lee_DI_UndeadDragonDead_15_03"); //Ano. Khorinis to bez tebe zvl·dne.
			//AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_04"); //Dann kann ich dem Kˆnig endlich meine lang ersehnte Aufwartung machen. Er ist schon zu lange vor mir davon gelaufen.
			AI_Output (self ,other, "DIA_Lee_Add_04_2&"); //
			AI_Output (self ,other, "DIA_Lee_Add_04_27"); //Na tuhle chvÌli jsem Ëekal straönÏ dlouho.
			AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_05"); //Co myslÌö? NemÏla by b˝t trpÏlivost nakonec odmÏnÏna?
			AI_Output			(other ,self, "DIA_Lee_DI_UndeadDragonDead_15_06"); //TrpÏlivost a p·r p·dn˝ch argument˘.
			AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_07"); //(zasmÏje se) Jo. Bez trochy hrubÈ sÌly by to neölo. Byla Ëest jÌt do bitvy po tvÈm boku.
			DIA_Lee_DI_UndeadDragonDead_OneTime = TRUE;
		};

	AI_Output			(self ,other, "DIA_Lee_DI_UndeadDragonDead_04_08"); //Snad se po tomhle dobrodruûstvÌ naöe cesty zase nÏkdy zk¯ÌûÌ.
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine	(self,"ZaËÌt");
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Lee_DI_PICKPOCKET (C_INFO)
{
	npc			= SLD_800_Lee_DI;
	nr			= 900;
	condition	= DIA_Lee_DI_PICKPOCKET_Condition;
	information	= DIA_Lee_DI_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_120;
};                       

FUNC INT DIA_Lee_DI_PICKPOCKET_Condition()
{
	C_Beklauen (110, 570);
};
 
FUNC VOID DIA_Lee_DI_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Lee_DI_PICKPOCKET);
	Info_AddChoice		(DIA_Lee_DI_PICKPOCKET, DIALOG_BACK 		,DIA_Lee_DI_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Lee_DI_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Lee_DI_PICKPOCKET_DoIt);
};

func void DIA_Lee_DI_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Lee_DI_PICKPOCKET);
};
	
func void DIA_Lee_DI_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Lee_DI_PICKPOCKET);
};


