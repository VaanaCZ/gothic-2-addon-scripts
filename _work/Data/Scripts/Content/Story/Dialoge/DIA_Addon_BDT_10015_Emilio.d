//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_EXIT   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 999;
	condition   = DIA_Addon_Emilio_EXIT_Condition;
	information = DIA_Addon_Emilio_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Emilio_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Emilio_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Emilio_PICKPOCKET (C_INFO)
{
	npc			= BDT_10015_Addon_Emilio;
	nr			= 900;
	condition	= DIA_Addon_Emilio_PICKPOCKET_Condition;
	information	= DIA_Addon_Emilio_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       

FUNC INT DIA_Addon_Emilio_PICKPOCKET_Condition()
{
	C_Beklauen (76, 112);
};
 
FUNC VOID DIA_Addon_Emilio_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Emilio_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Emilio_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Emilio_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Emilio_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Emilio_PICKPOCKET_DoIt);
};

func void DIA_Addon_Emilio_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Emilio_PICKPOCKET);
};
	
func void DIA_Addon_Emilio_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Emilio_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Hi   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 1;
	condition   = DIA_Addon_Emilio_Hi_Condition;
	information = DIA_Addon_Emilio_Hi_Info;
	permanent   = FALSE;
	description	= "Vypad·ö jako kop·Ë.";
};
FUNC INT DIA_Addon_Emilio_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Emilio_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Hi_15_00");//Vypad·ö jako kop·Ë.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Hi_10_01");//Taky ûe JSEM kop·Ë. Kdyû jsem byl naposledy v dole, nad¯el jsem se jak hovado.

	if (SC_KnowsRavensGoldmine == FALSE)
	{
		B_LogEntry (TOPIC_Addon_RavenKDW, LogText_Addon_RavensGoldmine); 
		Log_AddEntry (TOPIC_Addon_Sklaven, LogText_Addon_RavensGoldmine); 
		B_LogEntry (TOPIC_Addon_ScoutBandits,Log_Text_Addon_ScoutBandits);
	};

	SC_KnowsRavensGoldmine = TRUE;
};
//----------------------------------------------------------------------
//	Info Gold
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Gold   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 2;
	condition   = DIA_Addon_Emilio_Gold_Condition;
	information = DIA_Addon_Emilio_Gold_Info;
	permanent   = FALSE;
	description	= "Co se dÏje se zlatem z dolu?";
};
FUNC INT DIA_Addon_Emilio_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Gold_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Gold_15_00");//Co dÏl·te s vytÏûen˝m zlatem?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_01");//Thorus je vybÌr· a rozdÏluje. Nikdo si nesmÌ nechat, co nakope.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_02");//Kaûdej dost·v· jenom Ë·st zlata, aby zbyl podÌl i na lovce a str·ûe.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_03");//MyslÌm, ûe to tak m· bejt. Od t˝ doby, co m·me tohle pravidlo, bylo mÌÚ smrù·k˘ a kop·Ëi furt dost·vaj vÌc neû ti, co se poflakujou venku.
};
//----------------------------------------------------------------------
//	Info Stein
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Stein   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 3;
	condition   = DIA_Addon_Emilio_Stein_Condition;
	information = DIA_Addon_Emilio_Stein_Info;
	permanent   = FALSE;
	description	= "Co je to s tÏmi Ëerven˝mi kameny?";
};
FUNC INT DIA_Addon_Emilio_Stein_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Emilio_Jetzt)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Stein_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Stein_15_00");//A co m·te s tÏmi Ëerven˝mi kameny?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_01");//To vymyslel Thorus s Estebanem.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_02");//Thorus se star· o rozdÏlov·nÌ zlata a Esteban organizuje dÏlnÌky v dole.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_03");//Samoz¯ejmÏ ûe nechce bÏhat za Thorusem pokaûd˝, kdyû nÏkoho poöle do dolu.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_04");//A proto n·m d·v· tyhle Ëerven˝ kamenn˝ tabulky a Thorus n·s za nÏ pouötÌ dovnit¯. Fungujou jako vstupenky.
};
//---------------------------------------------------------------------
//	Info Attentat 
//---------------------------------------------------------------------
var int Emilio_Switch;

INSTANCE DIA_Addon_Emilio_Attentat   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 4;
	condition   = DIA_Addon_Emilio_Attentat_Condition;
	information = DIA_Addon_Emilio_Attentat_Info;
	permanent   = TRUE;
	description	= "Co vÌö o tom ˙toku?";
};
FUNC INT DIA_Addon_Emilio_Attentat_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_VonEmilio)) 
	&& (Npc_IsDead (Senyan))
	{
		return FALSE;		//selbe Condition wie 'Hilf mir...'
	}
	else if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	}
	else
	{
		return FALSE;
	};
};
FUNC VOID DIA_Addon_Emilio_Attentat_Info()
{
	AI_Output (other, self, "DIA_Addon_Emilio_Attentat_15_00"); //Co vÌö o tom ˙toku?
	if (Emilio_Switch == 0)
	{
		AI_Output (self, other, "DIA_Addon_Emilio_Attentat_10_01"); //(vydÏöenÏ) Hele, j· s tÌm nem·m nic spoleËn˝ho!
		Emilio_Switch = 1;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Emilio_Attentat_10_02"); //(vydÏöenÏ) VŸBEC NIC!
		Emilio_Switch = 0;
	};
};

//----------------------------------------------------------------------
//	Info Senyan 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Senyan   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 1;
	condition   = DIA_Addon_Emilio_Senyan_Condition;
	information = DIA_Addon_Emilio_Senyan_Info;
	permanent   = FALSE;
	important	= TRUE;
};
FUNC INT DIA_Addon_Emilio_Senyan_Condition()
{	
	if Npc_IsDead (Senyan)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Senyan_Info()
{	
	if (Senyan_Called == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_00");//(zkoumavÏ) PovÏz, PRO» Senyan ¯val 'A hele, kohopak to tu m·me'?
		AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_01");//(suöe) Nezaplacen˝ dluhy.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_02"); //Ty jsi zabil Senyana!
	};
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_03");//M·ö s tÌm Ú·kej problÈm?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_04");//(rychle) Ne, s tÌm û·dnej problÈm nem·m.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_05");//P¯esnÏ naopak. (posmÏönÏ) Ten hajzl pracoval pro Estebana.
	
	Senyan_CONTRA = LOG_SUCCESS;
	B_LogEntry (Topic_Addon_Esteban, "Emilio nenÌ na EstabanovÏ stranÏ.");
};

//----------------------------------------------------------------------
//	Info Jetzt
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_Jetzt   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 5;
	condition   = DIA_Addon_Emilio_Jetzt_Condition;
	information = DIA_Addon_Emilio_Jetzt_Info;
	permanent   = FALSE;
	description	= "Jak to, ûe nejsi v dole?";
};
FUNC INT DIA_Addon_Emilio_Jetzt_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Hi)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Jetzt_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_Jetzt_15_00"); //ProË nejsi v dole?
	AI_Output (self, other, "DIA_Addon_Emilio_Jetzt_10_01"); //(trochu nejistÏ) Uû jsem byl v dole dost dlouho a d¯el se do ˙moru. TeÔ pot¯ebuju p·r dnÌ odpoËinku.
	AI_Output (self, other, "DIA_Addon_Emilio_Jetzt_10_02"); //(trochu nejistÏ si povzdechne) Neû dostanu dalöÌ Ëervenej k·men.
};

//----------------------------------------------------------------------
//	Info VonEmilio
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_VonEmilio (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 6;
	condition   = DIA_Addon_Emilio_VonEmilio_Condition;
	information = DIA_Addon_Emilio_VonEmilio_Info;
	permanent   = FALSE;
	description	= "Lennar mi o tobÏ nÏco m·lo ¯ekl...";
};
FUNC INT DIA_Addon_Emilio_VonEmilio_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_Jetzt))
	&& (Npc_KnowsInfo (other, DIA_Addon_Lennar_Attentat))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_VonEmilio_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_VonEmilio_15_00"); //Lennar mi o tobÏ trochu vypr·vÏl
	AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_01"); //Lennar? Ten chlap je magor, to sis urËitÏ vöimnul.
	AI_Output (other, self, "DIA_Addon_Emilio_VonEmilio_15_02"); //ÿÌkal, ûe jsi nebyl v dole od toho ˙toku.
	AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_03"); //(zastraöenÏ) J·... j· nic nevÌm!
	
	if (!Npc_IsDead (Senyan))
	{	
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_04"); //Ty spolupracujeö s tÌm Senyanem!
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_05"); //Oba jste ve spolku s Estebanem! Moc dob¯e jsem slyöel, o Ëem jste to bl·bolili!
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_06"); //Esteban na n·s doteÔka kaölal, tak nevÌm, proË bych mÏl vÏ¯it jeho lidem.
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_07"); //Nech mÏ bejt.
		AI_StopProcessInfos(self);
	};
	B_LogEntry (Topic_Addon_Esteban, "Emilio si myslÌ, ûe Lennar je tot·lnÌ kretÈn.");
};
//----------------------------------------------------------------------
//	Info Hilf Mir
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_HilfMir (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 7;
	condition   = DIA_Addon_Emilio_HilfMir_Condition;
	information = DIA_Addon_Emilio_HilfMir_Info;
	permanent   = FALSE;
	description	= "Pomoz mi zjistit, kdo za tÌm ˙tokem stojÌ!";
};
FUNC INT DIA_Addon_Emilio_HilfMir_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_Emilio_VonEmilio))
	&& (Npc_IsDead (Senyan))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_HilfMir_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_00"); //Pomoz mi zjistit, kdo za tÌm ˙tokem stojÌ!
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_01"); //Ne! nechci s tÌm nic mÌt!
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_02"); //Kdyû si dement jako Lennar vöimne, ûe se divnÏ chov·ö, zanedlouho to zjistÌ i Esteban.
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_03"); //(vykrucuje se) J·... sakra! Tak j· ti teda ¯eknu jedno jmÈno, ale nic vÌc!
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_04"); //Poslouch·m.
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_05"); //Huno... bÏû za Hunem. Ten o t˝ z·leûitosti musÌ nÏco vÏdÏt.
	Emilio_TellAll = TRUE;
	
	B_LogEntry (Topic_Addon_Esteban, "Emilio koneËnÏ vyplivnul to jmÈno: Huno.");
};

//----------------------------------------------------------------------
//	Info Hilf Mir
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_GegenEsteban (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 8;
	condition   = DIA_Addon_Emilio_GegenEsteban_Condition;
	information = DIA_Addon_Emilio_GegenEsteban_Info;
	permanent   = FALSE;
	description	= "Co m·ö proti Estebanovi?";
};
FUNC INT DIA_Addon_Emilio_GegenEsteban_Condition()
{	
	if (Npc_KnowsInfo (other, DIA_Addon_BDT_10015_Emilio_Senyan))
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_GegenEsteban_Info()
{	
	AI_Output (other, self, "DIA_Addon_Emilio_GegenEsteban_15_00"); //Co m·ö proti Estebanovi?
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_01"); //Ta svinÏ nemyslÌ na nic jin˝ho neû na prachy.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_02"); //Jednou za p·r dnÌ nÏkoho z n·s seûere Ú·kej d˘lnÌ Ëerv.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_03"); //Ale Esteban prostÏ do dol˘ neposÌl· û·dn˝ bojovnÌky.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_04"); //A proË? TI chlapi pat¯ej k Havranov˝ ochrance a Esteban jim nic ne¯ekne, p·Ë je z nich strachy celej podÏlanej.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_05"); //Radöi n·s nech· chcÌpat!
};

//----------------------------------------------------------------------
//	Info Mine
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10015_Emilio_Mine   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 9;
	condition   = DIA_Addon_Emilio_Mine_Condition;
	information = DIA_Addon_Emilio_Mine_Info;
	permanent   = FALSE;
	description = DIALOG_ADDON_MINE_DESCRIPTION;
};
FUNC INT DIA_Addon_Emilio_Mine_Condition()
{	
	if (MIS_Send_Buddler == LOG_RUNNING)
	&& (Player_SentBuddler < 3)
	&& (Npc_HasItems (other, ItmI_Addon_Stone_01) >= 1)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Mine_Info()
{	
	B_Say 	  (other, self, "$MINE_ADDON_DESCRIPTION");
	B_GiveInvItems (other, self, ItmI_Addon_Stone_01,1);
	
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Mine_10_00");//Tak teÔ jsi tu öÈfem ty. No jo, tak j· uû jdu.
	
	
	Player_SentBuddler = (Player_SentBuddler +1);
	B_GivePlayerXP (XP_Addon_MINE);
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine (self,"MINE");
	
	
};
//----------------------------------------------------------------------
//	Info Hacker
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Emilio_Hacker   (C_INFO)
{
	npc         = BDT_10015_Addon_Emilio;
	nr          = 9;
	condition   = DIA_Addon_Emilio_Hacker_Condition;
	information = DIA_Addon_Emilio_Hacker_Info;
	permanent   = TRUE;
	Description = "Jak to jde?"; 
};
FUNC INT DIA_Addon_Emilio_Hacker_Condition()
{	
	if (Npc_GetDistToWP (self,"ADW_MINE_09_PICK") <= 500)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Emilio_Hacker_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10004_Emilio_Hacker_15_00"); //Co je?
	AI_Output (self, other, "DIA_Addon_BDT_10004_Emilio_Hacker_10_01"); //D¯u se tu jako mezek, ale hlavnÏ ûe mÏ zatÌm neseûral û·dnej d˘lnÌ Ëerv.
};




