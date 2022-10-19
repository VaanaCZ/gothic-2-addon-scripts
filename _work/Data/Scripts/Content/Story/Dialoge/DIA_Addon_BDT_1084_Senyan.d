//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_EXIT   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 999;
	condition   = DIA_Addon_Senyan_EXIT_Condition;
	information = DIA_Addon_Senyan_EXIT_Info;
	permanent   = TRUE;
	description = "Tak zatím...";
};
FUNC INT DIA_Addon_Senyan_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Senyan_EXIT_Info()
{
	if (Senyan_Erpressung == LOG_RUNNING)
	{
		AI_Output (self, other, "DIA_Addon_Senyan_EXIT_12_00");//Ty víš, co dêlat.
	};
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Senyan_PICKPOCKET (C_INFO)
{
	npc			= BDT_1084_Addon_Senyan;
	nr			= 900;
	condition	= DIA_Addon_Senyan_PICKPOCKET_Condition;
	information	= DIA_Addon_Senyan_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_40;
};                       

FUNC INT DIA_Addon_Senyan_PICKPOCKET_Condition()
{
	C_Beklauen (45, 88);
};
 
FUNC VOID DIA_Addon_Senyan_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Senyan_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Senyan_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Senyan_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Senyan_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Senyan_PICKPOCKET_DoIt);
};

func void DIA_Addon_Senyan_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Senyan_PICKPOCKET);
};
	
func void DIA_Addon_Senyan_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Senyan_PICKPOCKET);
};
//----------------------------------------------------------------------
FUNC VOID B_Senyan_Attack()
{
	AI_Output (self, other, "DIA_Addon_Senyan_Attack_12_00");//(šklebí se) Tak na co tê tu teda eštê mám, ty flákaèi?
	AI_Output (self, other, "DIA_Addon_Senyan_Attack_12_01");//(volá) A heleme se, kohopak to tu máme!
	
	Senyan_Called = TRUE;	
	Senyan_Erpressung = LOG_OBSOLETE;
	B_CheckLog();
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
}; 
//----------------------------------------------------------------------
FUNC VOID B_Senyan_Erpressung()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Erpressung_15_00");//Kolik chceš?
	AI_Output (self, other, "DIA_Addon_Senyan_Erpressung_12_01");//(pâedstírá ublížení) Ale ne, kdepak! Nechci z tebe mámit žádný zlato! To by mê v životê nenapadlo!
	AI_Output (other, self, "DIA_Addon_Senyan_Erpressung_15_02");//Tak co chceš?
	AI_Output (self, other, "DIA_Addon_Senyan_Erpressung_12_03");//Nedávno se nêkdo pokusil odklidit Estebana, ale on utekl ke svý ochrance.
	AI_Output (self, other, "DIA_Addon_Senyan_Erpressung_12_04");//Zajdi za Estebanem a promluv si s ním. Pak si s tebou promluvím i já.
	
	AI_StopProcessInfos (self);
	Log_CreateTopic (Topic_Addon_Senyan,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Senyan,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Senyan,"Senyan mê poznal - ví, kdo jsem. Chce to využít ku vlastnímu prospêchu - urèitê má nêco za lubem. Chce, abych si napâed promluvil s Estebanem.");
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1084_Senyan_Hi   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 1;
	condition   = DIA_Addon_Senyan_Hi_Condition;
	information = DIA_Addon_Senyan_Hi_Info;
	permanent   = FALSE;
	Important 	= TRUE;
};
FUNC INT DIA_Addon_Senyan_Hi_Condition()
{	
	return TRUE;
};
//--------------------
var int Senyan_Msg;
var int Senyan_Bad;
var int Senyan_Good;
//--------------------
FUNC VOID DIA_Addon_Senyan_Hi_Info()
{	
	
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_12_00");//A hele, kdopak to tu je?
	B_UseFakeScroll();
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_12_01");//A heleme se, tak už jsi tady. Mám pro tebe jednu dobrou a jednu špatnou zprávu.
	
	Info_ClearChoices (DIA_Addon_BDT_1084_Senyan_Hi);
	Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"Napâed snad radši tu dobrou zprávu.",DIA_Addon_BDT_1084_Senyan_Hi_good);
	Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"Tak to vybal - jaká je ta špatná zpráva?",DIA_Addon_BDT_1084_Senyan_Hi_bad);
};
FUNC VOID DIA_Addon_BDT_1084_Senyan_Hi_good()
{
	if (Senyan_Msg == FALSE)
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_good_15_00");//Napâed chci slyšet tu dobrou.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_good_15_01");//A jaká je ta dobrá zpráva?
	};
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_02");//No, vlastnê nevím proè, ale nadêlal sis tu pár pêknê mocnejch nepâátel.
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_03");//Máš kliku, že jsem tê poznal já a ne nêkdo jinej.
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_good_12_04");//Protože já jsem družnej a mám pochopení.
	
	
	Senyan_Good = TRUE;
	
	Info_ClearChoices (DIA_Addon_BDT_1084_Senyan_Hi);
	
	if (Senyan_Bad == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else 
	{
		Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"A ta špatná zpráva?",DIA_Addon_BDT_1084_Senyan_Hi_bad);
	};
};
FUNC VOID DIA_Addon_BDT_1084_Senyan_Hi_bad()
{
	if (Senyan_Msg == FALSE)
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_00");//Napâed mi povêz tu špatnou zprávu.
		Senyan_Msg = TRUE;
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_01");//A jaká je ta špatná zpráva?
	};
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_02");//Havran tê hledá. Teda jeho stráže. Vlastnê tê hledaj všichni banditi.
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_03");//A až tê najdou, zabijou tê.
	AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Hi_bad_15_04");//To už zkusila spousta lidí.
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_05");//Pak seš stejnê dobrej bojovník, jako jsi chytrej. Pâijít do tábora s takovýmhle brnêním je jako...
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_Hi_bad_12_06");//...jako když ovce vleze mezi vlky. Tvùj život visí na vlásku, seš v pêkným maléru.
	
	Senyan_Bad = TRUE;
	
	Info_ClearChoices (DIA_Addon_BDT_1084_Senyan_Hi);
	
	if (Senyan_Good == TRUE)
	{
		B_Senyan_Erpressung();
	}
	else 
	{
		Info_AddChoice (DIA_Addon_BDT_1084_Senyan_Hi,"A ta dobrá zpráva?",DIA_Addon_BDT_1084_Senyan_Hi_good);
	};
};
//---------------------------------------------------------------------
//	Info unterwegs
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_unterwegs   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 99;
	condition   = DIA_Addon_Senyan_unterwegs_Condition;
	information = DIA_Addon_Senyan_unterwegs_Info;
	permanent   = TRUE;
	description	= "Co se týèe Estebana...";
};
FUNC INT DIA_Addon_Senyan_unterwegs_Condition()
{	
	if (MIS_Judas != LOG_RUNNING)
	&& Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_unterwegs_Info()
{
	AI_Output (other, self, "DIA_Addon_Senyan_unterwegs_15_00");//Co se týèe Estebana...
	AI_Output (self, other, "DIA_Addon_Senyan_unterwegs_12_01");//Už jsi s ním mluvil?
	AI_Output (other, self, "DIA_Addon_Senyan_unterwegs_15_02");//Ještê ne.
	AI_Output (self, other, "DIA_Addon_Senyan_unterwegs_12_03");//No, tak bys to mêl brzo udêlat.
};
//---------------------------------------------------------------------
//	Info Attentat
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_Attentat   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 2;
	condition   = DIA_Addon_Senyan_Attentat_Condition;
	information = DIA_Addon_Senyan_Attentat_Info;
	permanent   = FALSE;
	description	= "Mluvil jsem s Estebanem.";
};
FUNC INT DIA_Addon_Senyan_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	&& Npc_KnowsInfo (other,DIA_Addon_BDT_1084_Senyan_Hi)
	{	
			return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_15_00");//Mluvil jsem s Estebanem.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_01");//A zmínil se o tom útoku?
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_15_02");//Rozkázal mi, abych zjistil, kdo na nêj toho vraha poslal. Nevíš o tom nêco?
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_03");//O nic víc než ty. Taky se snažím vypátrat, kdo za tím vêzí. A teë se dostáváme k tomu nejzajímavêjšímu.
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_15_04");//Tak povídej.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_05");//Chci, abys splnil svùj úkol a splnil ho dobâe. Chci, abys našel toho zrádce.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_06");//(chladnê) A až ho najdeš, tak chci, abys ho za mê zabil.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_07");//Dám ti za to odmênu.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_12_08");//A nezapomínej, že mám furt ten papír s tvým portrétem a zprávou, že tê hledaj. Tak se koukej snažit, jinak urèitê víš, co se stane.

	Info_ClearChoices (DIA_Addon_Senyan_Attentat);
	Info_AddChoice (DIA_Addon_Senyan_Attentat,"Myslím, že nemám na vybranou.",DIA_Addon_Senyan_Attentat_JA);
	Info_AddChoice (DIA_Addon_Senyan_Attentat,"Zapomeà!",DIA_Addon_Senyan_Attentat_NO);
};
FUNC VOID DIA_Addon_Senyan_Attentat_NO()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_NO_15_00");//Na to zapomeà!

	B_Senyan_Attack();
	Info_ClearChoices (DIA_Addon_Senyan_Attentat);
};
FUNC VOID DIA_Addon_Senyan_Attentat_JA()
{
	AI_Output (other, self, "DIA_Addon_Senyan_Attentat_JA_15_00");//Nejspíš nemám na vybranou.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_JA_12_01");//Já vêdêl, že se dohodnem.
	AI_Output (self, other, "DIA_Addon_Senyan_Attentat_JA_12_02");//(úseènê) Až zjistíš, kdo to je, zabijem toho hajzla spolu. A teë zmiz!
	
	Senyan_Erpressung = LOG_RUNNING;
	Info_ClearChoices (DIA_Addon_Senyan_Attentat);
	
	B_LogEntry (Topic_Addon_Senyan,"Senyan chce, abych zjistil, kdo to má na svêdomí, a zabil ho. Pokud se mi to podaâí, èeká na mê odmêna.");
};

//----------------------------------------------------------------------
//	Anders Überlegt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Senyan_ChangePlan   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 3;
	condition   = DIA_Addon_Senyan_ChangePlan_Condition;
	information = DIA_Addon_Senyan_ChangePlan_Info;
	permanent   = FALSE;
	description = "Rozmyslel jsem si to. Už s tebou nebudu spolupracovat!";
};
FUNC INT DIA_Addon_Senyan_ChangePlan_Condition()
{	
	if (Senyan_Erpressung == LOG_RUNNING)
	&& (Snaf_Tip_Senyan == TRUE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_ChangePlan_Info()
{	
	AI_Output (other, self, "DIA_Addon_Senyan_ChangePlan_15_00"); //Rozmyslel jsem si to. Už s tebou nebudu spolupracovat!
	B_Senyan_Attack(); 
			
	AI_StopProcessInfos (self);
};		

//----------------------------------------------------------------------
//	Erpressung Found Fisk
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1084_Senyan_Found   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 3;
	condition   = DIA_Addon_Senyan_Found_Condition;
	information = DIA_Addon_Senyan_Found_Info;
	permanent   = FALSE;
	description = "Našel jsem toho zrádce. Je to Fisk.";
};
FUNC INT DIA_Addon_Senyan_Found_Condition()
{	
	if (Senyan_Erpressung == LOG_RUNNING)
	&& (MIS_Judas == LOG_SUCCESS)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_Found_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_1084_Senyan_Found_15_00");//Našel jsem toho zrádce. Je to Fisk.
	B_Senyan_Attack(); 
};		
//----------------------------------------------------------------------
//	Erpressung derbe
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_1084_Senyan_derbe   (C_INFO)
{
	npc         = BDT_1084_Addon_Senyan;
	nr          = 1;
	condition   = DIA_Addon_Senyan_derbe_Condition;
	information = DIA_Addon_Senyan_derbe_Info;
	permanent   = FALSE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Senyan_derbe_Condition()
{	
	if (Senyan_Erpressung == LOG_RUNNING)
	&& (MIS_Judas == LOG_SUCCESS)
	&& (Npc_IsDead (Fisk)
	|| Npc_IsDead (Esteban))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Senyan_derbe_Info()
{	
	AI_Output (self, other, "DIA_Addon_BDT_1084_Senyan_derbe_12_00");//(vztekle) Nedodržels naši dohodu.
	
	B_Senyan_Attack();		
};


	


