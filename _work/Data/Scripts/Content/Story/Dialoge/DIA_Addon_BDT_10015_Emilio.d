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
	description	= "Vypadáš jako kopáè.";
};
FUNC INT DIA_Addon_Emilio_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Emilio_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Hi_15_00");//Vypadáš jako kopáè.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Hi_10_01");//Taky že JSEM kopáè. Když jsem byl naposledy v dole, nadâel jsem se jak hovado.

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
	description	= "Co se dêje se zlatem z dolu?";
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
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Gold_15_00");//Co dêláte s vytêženým zlatem?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_01");//Thorus je vybírá a rozdêluje. Nikdo si nesmí nechat, co nakope.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_02");//Každej dostává jenom èást zlata, aby zbyl podíl i na lovce a stráže.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Gold_10_03");//Myslím, že to tak má bejt. Od tý doby, co máme tohle pravidlo, bylo míà smrãákù a kopáèi furt dostávaj víc než ti, co se poflakujou venku.
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
	description	= "Co je to s têmi èervenými kameny?";
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
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Stein_15_00");//A co máte s têmi èervenými kameny?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_01");//To vymyslel Thorus s Estebanem.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_02");//Thorus se stará o rozdêlování zlata a Esteban organizuje dêlníky v dole.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_03");//Samozâejmê že nechce bêhat za Thorusem pokaždý, když nêkoho pošle do dolu.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Stein_10_04");//A proto nám dává tyhle èervený kamenný tabulky a Thorus nás za nê pouští dovnitâ. Fungujou jako vstupenky.
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
	description	= "Co víš o tom útoku?";
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
	AI_Output (other, self, "DIA_Addon_Emilio_Attentat_15_00"); //Co víš o tom útoku?
	if (Emilio_Switch == 0)
	{
		AI_Output (self, other, "DIA_Addon_Emilio_Attentat_10_01"); //(vydêšenê) Hele, já s tím nemám nic spoleènýho!
		Emilio_Switch = 1;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Emilio_Attentat_10_02"); //(vydêšenê) VÙBEC NIC!
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
		AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_00");//(zkoumavê) Povêz, PROÈ Senyan âval 'A hele, kohopak to tu máme'?
		AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_01");//(suše) Nezaplacený dluhy.
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_02"); //Ty jsi zabil Senyana!
	};
	AI_Output (other, self, "DIA_Addon_BDT_10015_Emilio_Senyan_15_03");//Máš s tím àákej problém?
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_04");//(rychle) Ne, s tím žádnej problém nemám.
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Senyan_10_05");//Pâesnê naopak. (posmêšnê) Ten hajzl pracoval pro Estebana.
	
	Senyan_CONTRA = LOG_SUCCESS;
	B_LogEntry (Topic_Addon_Esteban, "Emilio není na Estabanovê stranê.");
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
	description	= "Jak to, že nejsi v dole?";
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
	AI_Output (other, self, "DIA_Addon_Emilio_Jetzt_15_00"); //Proè nejsi v dole?
	AI_Output (self, other, "DIA_Addon_Emilio_Jetzt_10_01"); //(trochu nejistê) Už jsem byl v dole dost dlouho a dâel se do úmoru. Teë potâebuju pár dní odpoèinku.
	AI_Output (self, other, "DIA_Addon_Emilio_Jetzt_10_02"); //(trochu nejistê si povzdechne) Než dostanu další èervenej kámen.
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
	description	= "Lennar mi o tobê nêco málo âekl...";
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
	AI_Output (other, self, "DIA_Addon_Emilio_VonEmilio_15_00"); //Lennar mi o tobê trochu vyprávêl
	AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_01"); //Lennar? Ten chlap je magor, to sis urèitê všimnul.
	AI_Output (other, self, "DIA_Addon_Emilio_VonEmilio_15_02"); //Âíkal, že jsi nebyl v dole od toho útoku.
	AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_03"); //(zastrašenê) Já... já nic nevím!
	
	if (!Npc_IsDead (Senyan))
	{	
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_04"); //Ty spolupracuješ s tím Senyanem!
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_05"); //Oba jste ve spolku s Estebanem! Moc dobâe jsem slyšel, o èem jste to blábolili!
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_06"); //Esteban na nás doteëka kašlal, tak nevím, proè bych mêl vêâit jeho lidem.
		AI_Output (self, other, "DIA_Addon_Emilio_VonEmilio_10_07"); //Nech mê bejt.
		AI_StopProcessInfos(self);
	};
	B_LogEntry (Topic_Addon_Esteban, "Emilio si myslí, že Lennar je totální kretén.");
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
	description	= "Pomoz mi zjistit, kdo za tím útokem stojí!";
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
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_00"); //Pomoz mi zjistit, kdo za tím útokem stojí!
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_01"); //Ne! nechci s tím nic mít!
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_02"); //Když si dement jako Lennar všimne, že se divnê chováš, zanedlouho to zjistí i Esteban.
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_03"); //(vykrucuje se) Já... sakra! Tak já ti teda âeknu jedno jméno, ale nic víc!
	AI_Output (other, self, "DIA_Addon_Emilio_HilfMir_15_04"); //Poslouchám.
	AI_Output (self, other, "DIA_Addon_Emilio_HilfMir_10_05"); //Huno... bêž za Hunem. Ten o tý záležitosti musí nêco vêdêt.
	Emilio_TellAll = TRUE;
	
	B_LogEntry (Topic_Addon_Esteban, "Emilio koneènê vyplivnul to jméno: Huno.");
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
	description	= "Co máš proti Estebanovi?";
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
	AI_Output (other, self, "DIA_Addon_Emilio_GegenEsteban_15_00"); //Co máš proti Estebanovi?
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_01"); //Ta svinê nemyslí na nic jinýho než na prachy.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_02"); //Jednou za pár dní nêkoho z nás sežere àákej dùlní èerv.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_03"); //Ale Esteban prostê do dolù neposílá žádný bojovníky.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_04"); //A proè? TI chlapi patâej k Havranový ochrance a Esteban jim nic neâekne, páè je z nich strachy celej podêlanej.
	AI_Output (self, other, "DIA_Addon_Emilio_GegenEsteban_10_05"); //Radši nás nechá chcípat!
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
	
	AI_Output (self, other, "DIA_Addon_BDT_10015_Emilio_Mine_10_00");//Tak teë jsi tu šéfem ty. No jo, tak já už jdu.
	
	
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
	AI_Output (self, other, "DIA_Addon_BDT_10004_Emilio_Hacker_10_01"); //Dâu se tu jako mezek, ale hlavnê že mê zatím nesežral žádnej dùlní èerv.
};




