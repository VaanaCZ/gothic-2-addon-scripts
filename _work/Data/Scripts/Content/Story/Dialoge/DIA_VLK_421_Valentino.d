///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Valentino_EXIT   (C_INFO)
{
	npc         = VLK_421_Valentino;
	nr          = 999;
	condition   = DIA_Valentino_EXIT_Condition;
	information = DIA_Valentino_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};

FUNC INT DIA_Valentino_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Valentino_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

///////////////////////////////////////////////////////////////////////
//	Info Hallo
///////////////////////////////////////////////////////////////////////
instance DIA_Valentino_HALLO		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 1;
	condition	= DIA_Valentino_HALLO_Condition;
	information	= DIA_Valentino_HALLO_Info;
	permanent 	= FALSE;
	description	= "Takže copak to tu máme?";
};

func int DIA_Valentino_HALLO_Condition ()
{
	return TRUE;
};

func void DIA_Valentino_HALLO_Info ()
{
	AI_Output			(other, self, "DIA_Valentino_HALLO_15_00"); //Takže copak to tu máme?
	//AI_Output (other, self, "DIA_Valentino_Add_15_00"); //Hey, wer bist du denn?
	if (hero.guild == GIL_KDF)
	|| (hero.guild == GIL_PAL)
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_01"); //Jmenuji se Valentino. Snažím se, abych tento den, který mi Innos dal, neznesvìtil žádnou prací.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_02"); //Dávej pozor na to, co øíkáš.
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_03"); //Ach, omluv mì. Nechtìl jsem Tvou Milost nijak urazit, ó, prosím za odpuštìní, pane.
	}
	else
	{
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_04"); //Copak se neumíš chovat? To je nechutné!
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_05"); //Poøád tahle špinavá chátra! Nemáš být náhodou nìkde v práci?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_06"); //Ale poèítám, že takového ošuntìlého chlápka jako ty si každý všimne, co?
		AI_Output			(self, other, "DIA_Valentino_HALLO_03_07"); //No, až budeš mít tolik zlata jako já, taky nebudeš muset vùbec pracovat. Ale ty nikdy takhle bohatý nebudeš.
		AI_Output			(other, self, "DIA_Valentino_HALLO_15_08"); //Vidím, že s tebou si užiju poøádnou srandu.
	};
};

// ********************************************************
// 						WhoAgain
// ********************************************************

instance DIA_Valentino_WhoAgain		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 2;
	condition	= DIA_Valentino_WhoAgain_Condition;
	information	= DIA_Valentino_WhoAgain_Info;
	permanent 	= FALSE;
	description	= "Ptal jsem se tì, kdo jsi!";
};

func int DIA_Valentino_WhoAgain_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Valentino_HALLO))
	&& (other.guild != GIL_KDF)
	&& (other.guild != GIL_PAL)
	{
		return TRUE;
	};
};

func void DIA_Valentino_WhoAgain_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_01"); //Ptal jsem se tì, kdo jsi!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_wasmachstdu_15_00"); //Was macht jemand wie du in der Stadt?
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_01"); //Jsem švihák Valentino. Bonviván a miláèek žen!
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_02"); //Trápení neznám, však moudrostí a zlatem oplývám a ženy mi padají k nohám, sotva mne spatøí.
	AI_Output			(self, other, "DIA_Valentino_HALLO_wasmachstdu_03_03"); //Jestli máš problémy, nech si je pro sebe, já na nì zvìdavý nejsem.
};

// ********************************************************
// 						Manieren
// ********************************************************

instance DIA_Valentino_Manieren		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 3;
	condition	= DIA_Valentino_Manieren_Condition;
	information	= DIA_Valentino_Manieren_Info;
	permanent 	= FALSE;
	description	= "Zdá se mi, že bych ti mìl uštìdøit menší lekci slušného chování!";
};

func int DIA_Valentino_Manieren_Condition ()
{
	if (Npc_KnowsInfo (other, DIA_Valentino_HALLO))
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		return TRUE;
	};
};

func void DIA_Valentino_Manieren_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_02"); //Zdá se mi, že bych ti mìl uštìdøit menší lekci slušného chování!
	//AI_Output			(other, self, "DIA_Valentino_HALLO_klappe_15_00"); //Für deine dünnen Ärmchen hast du 'ne ganz schön große Klappe!
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_01"); //Mnì to nevadí. Jen si mì klidnì zbij. Až se zítra ráno probudím, zase mi bude dobøe.
	AI_Output			(self, other, "DIA_Valentino_HALLO_klappe_03_02"); //Ale ty s tímhle ksichtem budeš muset chodit celý život.
};

///////////////////////////////////////////////////////////////////////
//	Info Wasnuetzliches
///////////////////////////////////////////////////////////////////////

var int Valentino_Lo_Perm;
var int Valentino_Hi_Perm;
//---------------------------------------------------

instance DIA_Valentino_WASNUETZLICHES		(C_INFO)
{
	npc		 	= VLK_421_Valentino;
	nr 			= 4;
	condition	= DIA_Valentino_WASNUETZLICHES_Condition;
	information	= DIA_Valentino_WASNUETZLICHES_Info;
	permanent	= TRUE;
	description	= "Chceš mi øíct ještì nìco jiného?";
};

func int DIA_Valentino_WASNUETZLICHES_Condition ()
{
	if (Npc_KnowsInfo(other, DIA_Valentino_HALLO))
	{
		return TRUE;
	};
};

func void DIA_Valentino_WASNUETZLICHES_Info ()
{
	AI_Output (other, self, "DIA_Valentino_Add_15_03"); //(klidnì) Chceš mi øíci ještì nìco jiného?
	//AI_Output			(other, self, "DIA_Valentino_WASNUETZLICHES_15_00"); //Kannst du mir was Nützliches über die Stadt erzählen?
	
	if (self.aivar[AIV_DefeatedByPlayer] == TRUE)
	{
		B_Say (self, other, "$NOTNOW");
	}
	else if (Valentino_Lo_Perm == FALSE)
	&& (other.guild != GIL_PAL)
	&& (other.guild != GIL_KDF)
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_01"); //Získej si vìhlas, nikdy nikomu nic neslibuj, ber si, co chceš, a dávej si pozor, aby ses nedostal do sporu s domobranou.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_02"); //Nebo se žárlivými manželi, samozøejmì - ti jsou ze všech nejhorší, to ti povím.
		Valentino_Lo_Perm = TRUE;
	}
	else if (Valentino_Hi_Perm == FALSE)
	&& ( (other.guild == GIL_PAL) || (other.guild == GIL_KDF) )
	{
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_03"); //Pro muže tvého postavení není nic nemožné. Prostì jen musíš poznat, kdy je èas k èinu.
		AI_Output (self, other, "DIA_Valentino_WASNUETZLICHES_03_04"); //Tak neztrácej èas a jednej!
		Valentino_Hi_Perm = TRUE;
	}
	else
	{
		AI_Output (self ,other,"DIA_Valentino_WASNUETZLICHES_03_05"); //Už jsem ti øekl všechno, co potøebuješ vìdìt - zbytek je na tobì.
	};
};

// ************************************************************
// 			  				PICK POCKET
// ************************************************************

INSTANCE DIA_Valentino_PICKPOCKET (C_INFO)
{
	npc			= VLK_421_Valentino;
	nr			= 900;
	condition	= DIA_Valentino_PICKPOCKET_Condition;
	information	= DIA_Valentino_PICKPOCKET_Info;
	permanent	= TRUE;
	description = "(Tento klíè pùjde ukrást snadno.)";
};                       

FUNC INT DIA_Valentino_PICKPOCKET_Condition()
{
	if (Npc_GetTalentSkill (other,NPC_TALENT_PICKPOCKET) == 1) 
	&& (self.aivar[AIV_PlayerHasPickedMyPocket] == FALSE)
	&& (Npc_HasItems(self, ItKe_Valentino) >= 1)
	&& (other.attribute[ATR_DEXTERITY] >= (30 - Theftdiff))
	{
		return TRUE;
	};
};
 
FUNC VOID DIA_Valentino_PICKPOCKET_Info()
{	
	Info_ClearChoices	(DIA_Valentino_PICKPOCKET);
	Info_AddChoice		(DIA_Valentino_PICKPOCKET, DIALOG_BACK 		,DIA_Valentino_PICKPOCKET_BACK);
	Info_AddChoice		(DIA_Valentino_PICKPOCKET, DIALOG_PICKPOCKET	,DIA_Valentino_PICKPOCKET_DoIt);
};

func void DIA_Valentino_PICKPOCKET_DoIt()
{
	if (other.attribute[ATR_DEXTERITY] >= 30)
	{
		B_GiveInvItems (self, other, ItKe_Valentino, 1);
		self.aivar[AIV_PlayerHasPickedMyPocket] = TRUE;
		B_GivePlayerXP (XP_Ambient);
		Info_ClearChoices (DIA_Valentino_PICKPOCKET);
	}
	else
	{
		AI_StopProcessInfos	(self);
		B_Attack (self, other, AR_Theft, 1); 
	};
};
	
func void DIA_Valentino_PICKPOCKET_BACK()
{
	Info_ClearChoices (DIA_Valentino_PICKPOCKET);
};




