//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_EXIT   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 999;
	condition   = DIA_Addon_Huno_EXIT_Condition;
	information = DIA_Addon_Huno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};
// ************************************************************
// 			  				PICK POCKET
// ************************************************************
INSTANCE DIA_Addon_Huno_PICKPOCKET (C_INFO)
{
	npc			= BDT_1099_Addon_Huno;
	nr			= 900;
	condition	= DIA_Addon_Huno_PICKPOCKET_Condition;
	information	= DIA_Addon_Huno_PICKPOCKET_Info;
	permanent	= TRUE;
	description = Pickpocket_80;
};                       
FUNC INT DIA_Addon_Huno_PICKPOCKET_Condition()
{
	C_Beklauen (85, 102);
};
 
FUNC VOID DIA_Addon_Huno_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Addon_Huno_PICKPOCKET);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_BACK 		,DIA_Addon_Huno_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Addon_Huno_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Addon_Huno_PICKPOCKET_DoIt);
};

func void DIA_Addon_Huno_PICKPOCKET_DoIt()
{
	B_Beklauen ();
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
	
func void DIA_Addon_Huno_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Addon_Huno_PICKPOCKET);
};
//----------------------------------------------------------------------
//	Abwimmeln
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Abwimmeln (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Abwimmeln_Condition;
	information = DIA_Addon_Huno_Abwimmeln_Info;
	permanent   = TRUE;
	important 	= TRUE;
};
FUNC INT DIA_Addon_Huno_Abwimmeln_Condition()
{
	if (Huno_MEGA_Angepisst == TRUE)
	{
		return TRUE;
	};
	
	if (Huno_zuSnaf == TRUE)
	&& (!Npc_KnowsInfo (other, DIA_Addon_Fisk_Meeting))
	&& (Npc_IsInState (self, ZS_Talk))
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Abwimmeln_Info()
{	
	if (Huno_MEGA_Angepisst == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_00"); //Co chceš? Vypadni!
	}
	else //schickt dich in die Kneipe
	{
		AI_Output (self, other, "DIA_Addon_Huno_Abwimmeln_06_01"); //Tak na co èekáš? Bìž k baru!
	};
	AI_StopProcessInfos (self);
};
//----------------------------------------------------------------------
//	Info Hi
//----------------------------------------------------------------------
var int Knows_Flucht;
var int Huno_Angepisst;
//----------------------------------------------------------------------
instance DIA_Addon_Huno_Hi   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 1;
	condition   = DIA_Addon_Huno_Hi_Condition;
	information = DIA_Addon_Huno_Hi_Info;
	permanent   = FALSE;
	description = "Øekl bych, že jsi mistrem svého øemesla.";
};
FUNC INT DIA_Addon_Huno_Hi_Condition()
{	
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_00");//Vypadá to, že seš mistrem svýho øemesla.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_01");//To už jsem slyšel. Pøinesls mi tu ocel?
	AI_Output (other, self, "DIA_Addon_Huno_Hi_15_02");//Ocel? Ne, myslím, že si mì s nìkým pleteš.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_06_03");//Hmm, seš mi nìjak povìdomej. Neznáme se odnìkud?
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Jasnì, ze Starého tábora.",DIA_Addon_Huno_Hi_JA);
	Info_AddChoice (DIA_Addon_Huno_Hi,"Nemùžu si vzpomenout odkud.",DIA_Addon_Huno_Hi_NO);
	
	Log_CreateTopic (Topic_Addon_BDT_Trader,LOG_NOTE);
	B_LogEntry (Topic_Addon_BDT_Trader,"Huno prodává kováøské vybavení.");
};
FUNC VOID DIA_Addon_Huno_Hi_JA()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_00");//Jasnì, ze Starého tábora.
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_01");//Ze Starýho tábora? Aha, ty seš ten zvìdavej chlápek. Já myslel, že jsi mrtvej.
	AI_Output (other, self, "DIA_Addon_Huno_Hi_JA_15_02");//Jo, to si myslí každý. Kdo ještì pøežil?
	AI_Output (self, other, "DIA_Addon_Huno_Hi_JA_06_03");//Pár. A nìkdo utek s Havranem, jako já. Pro spoustu dalších se ale Starej tábor stal hrobem.
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
	
	Knows_Flucht = TRUE;
};
FUNC VOID DIA_Addon_Huno_Hi_NO()
{
	AI_Output (other, self, "DIA_Addon_Huno_Hi_NO_15_00");//A odkud bychom se mìli znát?
	AI_Output (self, other, "DIA_Addon_Huno_Hi_NO_06_01");//Hm, mám dìsnì dìravou hlavu. No to je jedno.
	
	Info_ClearChoices (DIA_Addon_Huno_Hi);
};
//----------------------------------------------------------------------
//	Info Blitz
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Blitz   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 2;
	condition   = DIA_Addon_Huno_Blitz_Condition;
	information = DIA_Addon_Huno_Blitz_Info;
	permanent   = FALSE;
	description = "Povìz mi o tom, jak jsi utekl.";
};
FUNC INT DIA_Addon_Huno_Blitz_Condition()
{	
	if (Knows_Flucht == TRUE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Blitz_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_00");//Povìz mi o tom úniku.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_01");//Když padla bariéra, propuknul chaos.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_02");//Nìkdo se schovával, nìkdo utíkal a všude se rabovalo.
	AI_Output (other, self, "DIA_Addon_Huno_Blitz_15_03");//A co jsi dìlal ty?
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_04");//Zrovna jsem vycházel z tábora, když se najednou dìsnì rozsvìtlilo a celý tìlo mi zalila dìsná bolest.
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_05");//Ten zatracenej blesk mì zasáhnul! Jako bych ho furt ještì slyšel.
	//AI_Output (self, other, "DIA_Blitz_06_07");//BLITZ
	AI_Output (self, other, "DIA_Addon_Huno_Blitz_06_06");//Pak mi nìkdo øek, že mì našel Thorus a vzal mì s sebou.
};
//----------------------------------------------------------------------
//	Info Armor
//----------------------------------------------------------------------
var int Huno_ArmorPerm;
//----------------------------------------------------------
INSTANCE DIA_Addon_Huno_Armor   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Armor_Condition;
	information = DIA_Addon_Huno_Armor_Info;
	permanent   = TRUE;
	description = "Potøebuju lepší zbroj.";
};
FUNC INT DIA_Addon_Huno_Armor_Condition()
{	
	if (Npc_KnowsInfo (other,DIA_Addon_Huno_Hi))
	&& (Huno_ArmorPerm == FALSE)
	&& (Huno_Angepisst == FALSE)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Armor_Info()
{	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
	
	AI_Output (other, self, "DIA_Addon_Huno_Armor_15_00"); //Potøebuju lepší zbroj.
	if (Huno_ArmorCheap == FALSE)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_01"); //Tak si mùžeš vzít tuhle. Je drahá, ale za to podìkuj Estebanovi.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_02"); //Ten zatracenej pes vybírá poplatky z každýho brnìní, který prodám.
		
		BDT_Armor_H_Value = 2100;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Zakoupit tìžkou zbroj banditù (Ochrana: zbranì 45, šípy 45. Cena: 2100 zlatých)", DIA_Addon_Huno_Armor_BUY);
	}
	else //CHEAP
	{
		AI_Output (other, self, "DIA_Addon_Huno_Armor_15_03"); //Fisk øíkal, že mi prý udìláš cenu.
		AI_Output (self, other, "DIA_Addon_Huno_Armor_06_04"); //Povídáš Fisk? No, poøád mu dlužím laskavost.
				
		BDT_Armor_H_Value = 1400;
		Info_AddChoice (DIA_Addon_Huno_Armor, DIALOG_BACK, DIA_Addon_Huno_Armor_BACK);
		Info_AddChoice (DIA_Addon_Huno_Armor, "Zakoupit tìžkou zbroj banditù (Ochrana: zbranì 45, šípy 45. Cena: 1400 zlatých)", DIA_Addon_Huno_Armor_BUY);
	};
};
func void DIA_Addon_Huno_Armor_Back()
{
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};
func void DIA_Addon_Huno_Armor_Buy()
{
	AI_Output (other, self, "DIA_Addon_Huno_Armor_Buy_15_00"); //Fan, tak já si tu zbroj vezmu.
	
	if B_GiveInvItems (other, self, ItMi_Gold, BDT_Armor_H_Value)
	{	
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_01"); //Jasnì.
		
		B_GiveInvItems (self, other,ITAR_BDT_H,1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_Armor_Buy_06_02"); //Žádný zlato, žádná zbroj.
	};
	
	if (BDT_Armor_H_Value < 2100) //nur, wenn billliger!
	{
		Huno_ArmorPerm = TRUE;
	};
	
	Info_ClearChoices (DIA_Addon_Huno_Armor);
};

//----------------------------------------------------------------------
//	ATTENTAT
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Attentat   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_Attentat_Condition;
	information = DIA_Addon_Huno_Attentat_Info;
	permanent   = FALSE;
	description = "K tomu pokusu o zavraždìní Estebana...";
};
FUNC INT DIA_Addon_Huno_Attentat_Condition()
{	
	if (MIS_Judas == LOG_RUNNING)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Attentat_Info()
{	
	B_Say (other, self, "$ATTENTAT_ADDON_DESCRIPTION2"); //Wegen des Attentast auf Esteban
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_00"); //(nebezpeènì) Co po mnì chceš?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_01"); //Zjišuju, kdo vìzí za tím útokem.
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_02"); //A proè s tím lozíš za mnou?
	AI_Output (other, self, "DIA_Addon_Huno_Attentat_15_03"); //Myslel jsem, že bys o tom mohl nìco vìdìt.
	AI_Output (self, other, "DIA_Addon_Huno_Attentat_06_04"); //Já nevím NIC!
};


//----------------------------------------------------------------------
//	Paar Dinge gehört
//----------------------------------------------------------------------
var int Huno_nochmal;
var int Huno_SomeThings_PERM;
var int Huno_Counter;
//-------------------------------------

	func void B_Addon_Huno_Stress()
	{
		AI_Output (self, other, "DIA_Addon_Huno_Stress_06_00"); //(povzdech) A teï odsud hezky rychle vypadni, nebo se neznám!
		Huno_Angepisst = TRUE;
	};

INSTANCE DIA_Addon_Huno_SomeThings (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 4;
	condition   = DIA_Addon_Huno_SomeThings_Condition;
	information = DIA_Addon_Huno_SomeThings_Info;
	permanent   = TRUE;
	description = "Už jsem o tobì nìco slyšel.";
};
FUNC INT DIA_Addon_Huno_SomeThings_Condition()
{	
	if (Npc_KnowsInfo(other,DIA_Addon_Huno_Attentat))
	&& (Huno_SomeThings_PERM == FALSE)
	&& ( (Finn_TellAll == TRUE) || (Paul_TellAll == TRUE) || (Emilio_TellAll == TRUE) )
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_SomeThings_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_00"); //Zaslechl jsem o tobì pár vìcí.
	
	if (Huno_nochmal == FALSE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_01"); //No a?
		Huno_nochmal = TRUE;
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_02"); //Zase ty? (hrozivì) Koukej, a je to tentokrát nìco dùležitýho!
	};
	
	Huno_Counter = 0;

	if (Finn_TellAll == TRUE) 		
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_03"); //Slyšel jsem, že když došlo k tomu útoku, nebyls na svým místì.
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_04"); //(nebezpeènì) Co ještì?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Paul_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_05"); //Paul tvrdil, že Estebana nesnášíš.
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_06"); //(nebezpeènì) No a? On snad jo? Tak co dál?
		Huno_Counter = Huno_Counter + 1;
	};
	
	if (Emilio_TellAll == TRUE)
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_07"); //Emilio tì prásknul! Urèitì o tom útoku nìco víš!
		AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_08"); //(klidnì) Tak ty sis povídal se starým Emiliem?
		
		if (Huno_Counter > 0)
		{
			AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_09"); //A není sám, kdo tì podezírá.
			AI_PlayAni(self, "T_SEARCH");
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_10"); //A co to má jako znamenat?
			
			Huno_SomeThings_PERM = TRUE;
			Info_ClearChoices (DIA_Addon_Huno_SomeThings);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Chci se pøidat k vrahovi!", DIA_Addon_Huno_SomeThings_Contra);
			Info_AddChoice (DIA_Addon_Huno_SomeThings, "Jestli máš s tím útokem nìco spoleèného, tak si to šerednì odskáèeš!", DIA_Addon_Huno_SomeThings_Pro);
			
			B_LogEntry (Topic_Addon_Esteban, "Zdá se, že mám Huna v hrsti.");
		}
		else
		{
			AI_Output (self, other, "DIA_Addon_Huno_SomeThings_06_11"); //(hrozivì) Možná bych si s ním mìl taky promluvit. A pak bude URÈITÌ tvrdit pravej opak!
			B_Addon_Huno_Stress();
			AI_StopProcessInfos (self);
		};
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_SomeThings_15_12"); //Víc už nic.
		B_Addon_Huno_Stress();
		AI_StopProcessInfos (self);
	};
};

func void DIA_Addon_Huno_SomeThings_Pro()
{
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Pro_15_00"); //Jestli máš s tím útokem nìco spoleèného, tak si to šerednì odskáèeš!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_01"); //(otrávenì) Ty seš takovej debil! To si vážnì myslíš, že mùžeš Estabanovi takhle podlejzat?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Pro_06_02"); //Vypadni odsud!
	Huno_MEGA_Angepisst = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};	
	
func void DIA_Addon_Huno_SomeThings_Contra()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_00"); //Chci se k tomu vrahovi pøidat!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_01"); //Proti Estebanovi? Vážnì? No tak to dokaž!
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_02"); //Už hezky dlouho èekám na dodávku oceli od pirátù.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_03"); //Poèítám, že ji zabavil Esteban, aby mi ji pak prodal za vyšší cenu.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_04"); //Samozøejmì to nemùže udìlat sám. Platí ještì pár banditùm z bažin.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_05"); //Jak to víš?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_06"); //Ožrali banditi vždycky hodnì žvanìj.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Contra_15_07"); //A má ten užvanìný bandita nìjaké jméno?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_08"); //Do jeho jména ti nic není. Ale ten, koho hledáš TY, se jmenuje Juan. Jenže toho už jsem stejnì v táboøe nìjakou dobu nevidìl.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Contra_06_09"); //Musíš se po nìm poohlídnout v bažinì.
	
	MIS_Huno_Stahl = LOG_RUNNING;
	Huno_Angepisst = FALSE;
	
	Log_CreateTopic (Topic_Addon_Huno,LOG_MISSION);
	Log_SetTopicStatus (Topic_Addon_Huno,LOG_RUNNING);
	B_LogEntry (Topic_Addon_Huno,"Huno èeká, až mu piráti dodají nìjakou ocel. Prý ji Estebanovi ukradl jakýsi Juan, který se teï skrývá kdesi v bažinách.");
	
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Napøed mi povìz, kdo stojí za tím útokem!", DIA_Addon_Huno_SomeThings_TellMeNow);
	Info_AddChoice (DIA_Addon_Huno_SomeThings, "Dobøe, udìlám to.", DIA_Addon_Huno_SomeThings_Mission);
};

func void DIA_Addon_Huno_SomeThings_Mission()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_Mission_15_00"); //Fajn, udìlám to.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_Mission_06_01"); //Dobøe. Uvidíme, jestli se ti dá vìøit.
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
};
func void DIA_Addon_Huno_SomeThings_TellMeNow()
{	
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_00"); //Napøed mi povìz, kdo vìzí za tím útokem.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_01"); //Ne. Nevìøím ti.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_02"); //Hele, tenhle rozhovor je o tom, jestli jdu s tím, kdo stojí za tím útokem, nebo s Estebanem.
	AI_Output (other, self, "DIA_Addon_Huno_SomeThings_TellMeNow_15_03"); //S kým budu mluvit, to záleží na tobì.
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_04"); //(povzdech) No dobøe. Spojím tì s tím, kdo to má na svìdomí, ale záleží, jakým zpùsobem to øeknu, jasný?
	AI_Output (self, other, "DIA_Addon_Huno_SomeThings_TellMeNow_06_05"); //Bìž k baru a promluv si s barmanem. Všecko ostatní se dozvíš od nìj.
	Huno_zuSnaf = TRUE;
	Info_ClearChoices (DIA_Addon_Huno_SomeThings);
	AI_StopProcessInfos (self);
	
	B_LogEntry (Topic_Addon_Esteban, "Huno øíkal, že bych si mìl promluvit se Snafem.");
};

//----------------------------------------------------------------------
//	Info Paket
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Paket   (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 3;
	condition   = DIA_Addon_Huno_Paket_Condition;
	information = DIA_Addon_Huno_Paket_Info;
	permanent   = FALSE;
	description = "Mám tady tu ocel.";
};
FUNC INT DIA_Addon_Huno_Paket_Condition()
{	
	if (MIS_Huno_Stahl == LOG_RUNNING)
	&& (Npc_HasItems (other, ItMi_Addon_Steel_Paket) >= 1)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Paket_Info()
{	
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_00");//Mám tu ocel.
	B_GiveInvItems (other, self, ItMi_Addon_Steel_Paket,1);
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_01"); //A dál? Byl tam i Juan?
	AI_Output (other, self, "DIA_Addon_Huno_Paket_15_02"); //Byl.
	AI_Output (self, other, "DIA_Addon_Huno_Paket_06_03"); //Já to vìdìl. To byla práce tý krysy Estebana.
	
	if (Huno_zuSnaf == TRUE)
	{
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_04"); //Jsi v pohodì. Popravdì øeèeno jsem od tebe nìco takovýho neèekal.
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_05"); //Tumáš, za odmìnu si vezmi tohle.
		B_GiveInvItems (self, other, itmi_gold, 200);
	}
	else
	{
		AI_Output (other, self, "DIA_Addon_Huno_Paket_15_06"); //A jak to teï bude s naším ujednáním?
		AI_Output (self, other, "DIA_Addon_Huno_Paket_06_07"); //Chlap, se kterým chceš mluvit, na tebe èeká u baru. Promluv si s barmanem.
		Huno_zuSnaf = TRUE;
	};
	
	B_LogEntry (Topic_Addon_Esteban, "Huno øíkal, že bych si mìl promluvit se Snafem.");
	MIS_Huno_Stahl = LOG_SUCCESS;
	B_GivePlayerXP (XP_Addon_HunoStahl);
};
//----------------------------------------------------------------------
//	Info Trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Trade  (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 888;
	condition   = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Huno_Trade_Condition()
{		
	if (Huno_Angepisst == FALSE)
	{
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Huno_Trade_Info()
{	
	B_Say (other,self,"$TRADE_3");
	B_GiveTradeInv(self);
};






